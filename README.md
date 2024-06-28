# gen-ai-building-blocks

```bash
pyenv install 3.12.0
pyenv local 3.12.0
python -m venv .venv
source .venv/bin/activate
eval "$(pyenv init -)"
pip install -r requirements.txt
aws sso login --sso-session mfrec
aws-sso-util login --profile Cevo-Dev.AWSFullAccountAdmin
``` 

# Start a Postgres Instance

```
docker run --name movies-db -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 -v $(pwd)/postgres:/var/lib/postgresql/postgres:rw postgres:alpine
```

# Interactive bash shell 

```docker exec -it movies-db bash```

# Connect to Postgres
```psql -h localhost -p 5432 -U postgres```

# Create a database
```CREATE DATABASE star_wars;```

# Connect to the database
```\c star_wars```

# Use your SQL client like DBeaver to connect to the database
Once connected, open a new SQL script and run the following SQL (./llama-index/text-to-sql/star_wars_db) to create the tables and insert some data.
