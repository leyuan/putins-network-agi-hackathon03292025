
// 1) Set the OpenAI API key as a parameter
:param token => "OPENAI_API_KEY"

// 2) Create the embedding for each Person node based on the 'description' field
MATCH (p:Person)
WITH p, genai.vector.encode(p.description, "OpenAI", { token: $token }) AS embedding
CALL db.create.setNodeVectorProperty(p, 'embedding', embedding);

// 3) Create a vector index for Person embeddings
CREATE VECTOR INDEX `person-embeddings`
FOR (n:Person) ON (n.embedding)
OPTIONS {
  indexConfig: {
    `vector.dimensions`: 1536,
    `vector.similarity_function`: 'cosine'
  }
};

// 4) Try it
MATCH (p:Person {name: "Sergey Shoigu"})
CALL db.index.vector.queryNodes('person-embeddings', 5, p.embedding)
YIELD node AS similarPerson, score
RETURN similarPerson.name, similarPerson.role, score
ORDER BY score DESC;