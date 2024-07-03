# Generative AI Building Blocks

This repository contains a collection of building blocks for generative AI use cases. 

The first use case we are going to tackle is **Text2SQL**. We are going to build an application that can convert natural language questions into SQL queries using LlamaIndex and Claude 3 through AWS Bedrock.

1 - [Text2SQL using LlamaIndex and Bedrock](./llama-index/text-to-sql/star_wars_db/talk-to-sql.ipynb)

2 - TBC


## Environment setup

```bash
pyenv install 3.12.0
pyenv local 3.12.0
python -m venv .venv
source .venv/bin/activate
``` 

### Start a local docker Postgres Instance

```
docker run --name movies-db -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 -v $(pwd)/postgres:/var/lib/postgresql/postgres:rw postgres:alpine
```

### Interactive bash shell 

```docker exec -it movies-db bash```

### Connect to Postgres
```psql -h localhost -p 5432 -U postgres```

### Create a database
```CREATE DATABASE star_wars;```

### Connect to the database
```\c star_wars```

### Use your SQL client like DBeaver to connect to the database
Once connected, open a new SQL script and run the following SQL (./llama-index/text-to-sql/star_wars_db) to create the tables and insert some data.
