## Neo4j Data Seeding
# Neo4j Knowledge Graph Setup
Our project uses a series of Cypher statements to insert nodes—primarily `Person` and `Organization`—and define the relationships among them (such as `AFFILIATED_WITH`, `RELATED_TO`, and `FAMILY`). This creates a knowledge graph that is both visualizable and queryable for deeper insights.
## 1. Seeding Approach
### Database Cleanup
If you need a fresh start, you can clear any existing data before seeding:
```cypher
MATCH (n) DETACH DELETE n;
```
This is optional, depending on whether you want to append to existing nodes/relationships or start from scratch.
### Creating Core Nodes
We use multiple `CREATE` statements to add both people (e.g., Vladimir Putin and his close associates) and organizations (e.g., KGB, FSB, Rosneft, Gazprom, etc.). Example:
```cypher
CREATE (putin:Person { name: “Vladimir Putin”, title: “President of Russia” });
CREATE (kgb:Organization { name: “KGB” });
```
Person nodes typically contain fields such as `name`, `title`, `description`, etc. Organization nodes might just have `name` (or more elaborate fields if needed).
### Defining Relationships
#### Person-Organization (`AFFILIATED_WITH`)
Each individual can be affiliated with multiple organizations, often tracked by roles and time periods:
```cypher
MATCH (p:Person {name: “Nikolai Patrushev”})
MATCH (o:Organization {name: “KGB”})
CREATE (p)-[:AFFILIATED_WITH {period: “Career”, role: “Officer”}]->(o);
```
#### Person-Person
Includes relationships like `RELATED_TO` (e.g., trust or influence), `SHARED_BACKGROUND` (e.g., former KGB colleagues), `FAMILY`, and more:
```cypher
MATCH (p1:Person {name: “Arkady Rotenberg”})
MATCH (p2:Person {name: “Boris Rotenberg”})
CREATE (p1)-[:FAMILY {relationship: “Brother”}]->(p2);
```
By creating these relationships, we form an interconnected knowledge graph.
## 2. Using the Seeded Data
### Visualization
After the seeding scripts have been executed, open the Neo4j browser and run a simple query like:
```cypher
MATCH (n) RETURN n LIMIT 100;
```
to visualize a subset of the nodes and relationships.
### Query and Analysis
You can run Cypher queries to explore the data. For example:
```cypher
// Example: Find top-trusted individuals relative to Putin
MATCH (p:Person)-[r:RELATED_TO]->(putin:Person {name: “Vladimir Putin”})
WHERE r.trust_level CONTAINS “Extremely high” OR r.trust_level CONTAINS “Very high”
RETURN p.name, p.title, r.trust_level
ORDER BY r.trust_level DESC;
```
You can write more sophisticated queries to fit your specific business or research needs.
### Integration with Other Modules
- **Embeddings & Similarity Searches**: If your project needs vector-based searches on person descriptions, you can generate embeddings (e.g., with an OpenAI or local embedding service) and store them on each `Person` node for similarity queries.
- **Machine Learning or Graph Algorithms**: By leveraging Neo4j’s **Graph Data Science (GDS)** library, you can perform community detection, PageRank, shortest-path analysis, or other advanced algorithms on your seeded data for downstream applications.
### Versioning & Maintenance
- Updates or additional data can be added incrementally through new or modified Cypher scripts.
- Keep your scripts organized and clearly commented so that anyone on the team can replicate or adapt the data seeding process in other environments.
## 3. Seed Code Repository
The actual Cypher seed code used for creating this knowledge graph is available in this [Google Document](https://docs.google.com/document/d/1zC_tXdQWCQFqkRfh8uPAUj9gi7YJT_46IVtrPTGg4fU/edit?usp=sharing). You can find detailed implementation for various entity relationships and data structures there.
## Model Finetuning
We finetune the model on daily Institute for the Study of War bulletins.
## Run the app
`pip install -r requirements.txt`
`streamlit run app.py`