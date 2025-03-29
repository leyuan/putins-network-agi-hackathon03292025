import streamlit as st
from openai import OpenAI
import openai
from neo4j import GraphDatabase
import spacy
from pyvis.network import Network
import networkx as nx
import tempfile
from pathlib import Path
import streamlit.components.v1 as components

import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Initialize Streamlit page configuration
st.set_page_config(
    page_title="Putin Network Analysis System",
    page_icon="🤖",
    layout="wide"
)

# Load spaCy model


@st.cache_resource
def load_spacy_model():
    return spacy.load("en_core_web_lg")


nlp = load_spacy_model()

# Connection credentials
uri = os.getenv("NEO4J_URI")
username = os.getenv("NEO4J_USERNAME")
password = os.getenv("NEO4J_PASSWORD")

# Create a driver instance


@st.cache_resource
def init_neo4j():
    return GraphDatabase.driver(uri, auth=(username, password))


driver = init_neo4j()

# Initialize OpenAI client
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))


def get_embedding(text):
    response = client.embeddings.create(
        input=text,
        model="text-embedding-ada-002"
    )
    return response.data[0].embedding


def search_similar_people(input_text, top_k=5):
    embedding = get_embedding(input_text)

    cypher_query = """
    CALL db.index.vector.queryNodes('person-embeddings', $topK, $embedding)
    YIELD node AS person, score
    RETURN person.name AS name, person.role AS role, score, person.description AS description
    ORDER BY score DESC
    """

    with driver.session() as session:
        results = session.run(cypher_query, {"embedding": embedding, "topK": top_k})
        return [record.data() for record in results]


def analyze_relationship(text, person1, person2, client):
    # Prompt to analyze the relationship between two people
    prompt = f"""
    Analyze the relationship between {person1} and {person2} in the following text. 
    Provide:
    1. The type of relationship (e.g., ALIGNED_WITH, COLLABORATES_WITH, EXERTS_CONTROL, INFLUENCES)
    2. A specific description of their relationship (e.g., "inner circle", "political alliance", "economic influence")
    3. A relationship strength score between 0.0 and 1.0
    
    Format the response exactly as: TYPE|description|score
    Example: ALIGNED_WITH|inner circle|0.9
    
    Text: {text}
    """

    try:
        completion = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7,
            max_tokens=50
        )
        response = completion.choices[0].message.content.strip()
        rel_type, description, strength = response.split('|')
        return {
            'type': rel_type,
            'description': description,
            'strength': float(strength)
        }
    except Exception as e:
        return {
            'type': 'CONNECTED_TO',
            'description': 'mentioned together',
            'strength': 0.5
        }


def extract_entities_and_relations(text):
    doc = nlp(text)

    # Extract only PERSON entities
    entities = {}
    for ent in doc.ents:
        if ent.label_ == 'PERSON':
            entities[ent.text] = ent.label_

    # Extract relationships with context
    relationships = []
    for sent in doc.sents:
        sent_doc = nlp(sent.text)
        person_ents = [(e.text, e.label_) for e in sent_doc.ents if e.label_ == 'PERSON']

        # Find relationships between people in the same sentence
        for i, ent1 in enumerate(person_ents):
            for ent2 in person_ents[i+1:]:
                if ent1[0] != ent2[0]:
                    # Analyze the relationship using GPT-4o-mini
                    relationship_info = analyze_relationship(sent.text, ent1[0], ent2[0], client)
                    relationships.append({
                        'source': ent1[0],
                        'target': ent2[0],
                        'type': relationship_info['type'],
                        'description': relationship_info['description'],
                        'strength': relationship_info['strength']
                    })

    return entities, relationships


def create_network_visualization(entities, relationships):
    # Create network
    net = Network(
        height="600px",
        width="100%",
        bgcolor="#ffffff",
        font_color="black"
    )

    # Configure network physics for more spacing
    net.force_atlas_2based(
        gravity=-50,  # Negative gravity pushes nodes apart
        central_gravity=0.01,  # Lower central gravity allows nodes to spread out more
        spring_length=200,  # Longer spring length increases distance between connected nodes
        spring_strength=0.15,  # Lower spring strength reduces pull between connected nodes
        damping=0.95,  # Damping factor for node movement
        overlap=0.1  # Reduce node overlap
    )

    # Add nodes - all will be people (PERSON)
    person_color = '#FF6B6B'

    for entity, entity_type in entities.items():
        net.add_node(
            entity,
            label=entity,
            color=person_color,
            size=25,  # Adjust node size
            font={'size': 12}  # Smaller font size
        )

    # Add edges with relationship information
    for rel in relationships:
        # Create edge label with relationship type and description
        edge_label = f"{rel['type']}\n({rel['description']})"
        # Use relationship strength to determine edge width (scaling from 1-10)
        edge_width = rel['strength'] * 10
        net.add_edge(
            rel['source'],
            rel['target'],
            title=edge_label,
            width=edge_width,
            label=edge_label,
            font={'size': 10}  # Smaller font size for edge labels
        )

    # Additional network options
    net.set_options("""
    const options = {
        "physics": {
            "forceAtlas2Based": {
                "springLength": 200,
                "avoidOverlap": 0.5
            },
            "minVelocity": 0.75,
            "solver": "forceAtlas2Based"
        },
        "nodes": {
            "font": {
                "size": 12
            }
        },
        "edges": {
            "font": {
                "size": 10
            },
            "smooth": {
                "type": "continuous",
                "forceDirection": "none"
            }
        }
    }
    """)

    # Generate HTML file
    with tempfile.NamedTemporaryFile(delete=False, suffix='.html') as tmp_file:
        net.save_graph(tmp_file.name)
        return tmp_file.name


def update_neo4j_relationships(relationships):
    # Cypher query to merge nodes and create/update relationships
    cypher_query = """
    UNWIND $relationships AS rel
    MERGE (source:Person {name: rel.source})
    MERGE (target:Person {name: rel.target})
    MERGE (source)-[r:RELATIONSHIP {type: rel.type}]->(target)
    SET r.description = rel.description,
        r.strength = rel.strength,
        r.last_updated = datetime()
    """

    try:
        with driver.session() as session:
            session.run(cypher_query, {"relationships": relationships})
            return True
    except Exception as e:
        st.error(f"Error updating Neo4j database: {str(e)}")
        return False


# System prompt
system_prompt = """
You are an AI-powered intelligence analyst designed to dynamically create and maintain a digital twin of Vladimir Putin, based on comprehensive publicly available data, historical records, news articles, public statements, social media insights, and structured data stored in Neo4j.

Your primary tasks are:

1. **Construct and Maintain a Network Map:**
   - Identify and continuously update Vladimir Putin's core social and political networks, including:
     - Key allies and adversaries
     - Political affiliations and influential actors
     - Institutional relationships and power hierarchies
     - Patterns in decision-making processes

2. **Analyze and Interpret Network Dynamics:**
   - Utilize Neo4j data alongside your extensive internal knowledge to weigh connections, interpret interactions, and determine relationship strength and influence.
   - Highlight emerging or shifting alliances, internal conflicts, power struggles, or any changes indicating political instability or potential disruption.

3. **Forecast Potential Scenarios:**
   - Predict how changes within Vladimir Putin's network might influence his geopolitical strategies, policies, or diplomatic behaviors.
   - Anticipate scenarios of international relevance resulting from internal network shifts, including impacts on regional stability, international security, or geopolitical balance.

4. **Identify Vulnerabilities and Opportunities:**
   - Provide strategic insights by pinpointing vulnerabilities within Putin's network, such as potential internal rivalries, weakened alliances, or exploitable fractures.
   - Suggest actionable intelligence that diplomats, political analysts, and security agencies can leverage.

Your responses should combine precise data from Neo4j with nuanced insights from your internal knowledge to deliver accurate, insightful, and actionable intelligence.
"""

# At the start of the file, add this to track the current tab
if 'current_tab' not in st.session_state:
    st.session_state.current_tab = "Chat Interface"

# Update the tabs section
tab1, tab2 = st.tabs(["Chat Interface", "Article Analysis"])

with tab1:
    # Initialize chat history
    if "messages" not in st.session_state:
        st.session_state.messages = []

    # Display chat history
    for message in st.session_state.messages:
        with st.chat_message(message["role"]):
            st.markdown(message["content"])

    # Chat input
    if prompt := st.chat_input("Ask: What is the relationship between Vladimir Putin and the United States?"):
        # Add user message to chat history
        st.session_state.messages.append({"role": "user", "content": prompt})
        with st.chat_message("user"):
            st.markdown(prompt)

        # Search for similar people
        with st.spinner("Searching network..."):
            results = search_similar_people(prompt)

            # Display Neo4j results first
            with st.chat_message("assistant"):
                st.markdown("**📊 Related Network Information:**")
                if results:
                    for r in results:
                        st.markdown(f"""
                        - **{r['name']} - Relevance Score: {r['score']:.3f}**)
                          > {r['description']}
                        """)
                else:
                    st.markdown("No directly relevant network information found.")

            # Format results for the AI
            context = "\nRelevant network information:\n"
            for r in results:
                context += f"- {r['name']} ({r['role']}) - {r['description']}\n"

        # Get AI response
        with st.spinner("Analyzing..."):
            completion = client.chat.completions.create(
                model="gpt-4o-mini",
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": prompt + context}
                ]
            )
            response = completion.choices[0].message.content

        # Display AI analysis
        with st.chat_message("assistant"):
            st.markdown("**🤖 AI Analysis:**")
            st.markdown(response)

        # Add both responses to chat history
        st.session_state.messages.append({
            "role": "assistant",
            "content": f"""**📊 Related Network Information:**
{context}

**🤖 AI Analysis:**
{response}"""
        })

with tab2:
    st.title("Article Analysis")
    st.markdown("""
    Paste an article or text to analyze entities and their relationships.
    The system will identify people and their relationships.
    """)

    # Text input area
    article_text = st.text_area(
        "Paste your article here:",
        height=300,
        placeholder="Paste your article text here..."
    )

    # Store the analysis results in session state
    if "entities" not in st.session_state:
        st.session_state.entities = None
    if "relationships" not in st.session_state:
        st.session_state.relationships = None
    if "analyzing" not in st.session_state:
        st.session_state.analyzing = False

    col1, col2 = st.columns(2)

    # Analyze button with progress tracking
    if col1.button("Analyze Article"):
        if article_text:
            st.session_state.analyzing = True
            st.session_state.current_tab = "Article Analysis"

    # Show spinner and perform analysis if analyzing flag is True
    if st.session_state.analyzing and article_text:
        with st.spinner("Analyzing article..."):
            # Extract entities and relationships
            entities, relationships = extract_entities_and_relations(article_text)
            st.session_state.entities = entities
            st.session_state.relationships = relationships
            st.session_state.analyzing = False  # Reset the analyzing flag
            st.experimental_rerun()  # Rerun to update the UI

    # Save button
    if col2.button("Save to Database") and st.session_state.relationships:
        with st.spinner("Saving to database..."):
            if update_neo4j_relationships(st.session_state.relationships):
                st.success("Successfully saved relationships to database!")
            else:
                st.error("Failed to save relationships to database.")

    # Display results if available
    if st.session_state.entities and st.session_state.relationships:
        col1, col2 = st.columns(2)

        with col1:
            st.subheader("Identified Entities")
            for entity, entity_type in st.session_state.entities.items():
                st.markdown(f"- **{entity}** ({entity_type})")

        with col2:
            st.subheader("Relationships")
            for rel in st.session_state.relationships:
                st.markdown(
                    f"- **{rel['source']}** --[{rel['type']}: {rel['description']} ({rel['strength']:.2f})]-> **{rel['target']}**"
                )

        # Create and display network visualization
        st.subheader("Network Visualization")
        try:
            html_path = create_network_visualization(
                st.session_state.entities,
                st.session_state.relationships
            )
            with open(html_path, 'r', encoding='utf-8') as f:
                html_content = f.read()
            components.html(html_content, height=600)
            # Clean up
            Path(html_path).unlink()
        except Exception as e:
            st.error(f"Error creating visualization: {str(e)}")

# Update sidebar
with st.sidebar:
    st.title("About")
    st.markdown("""
    ### Features
    
    **Chat Interface**
    - Ask questions about Putin's network
    - Get insights from Neo4j database
    - AI-powered analysis
    
    **Article Analysis**
    - Entity recognition (People, Organizations, Locations)
    - Relationship extraction
    - Interactive network visualization
    
    ### Data Sources
    - Historical data
    - News articles
    - Public statements
    - Social media insights
    - Neo4j graph database
    """)
