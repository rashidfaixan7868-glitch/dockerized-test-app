# Dockerized Node.js + MySQL NOtes App

A small Express.js app that stores notes in a MySQL database, packaged with docker. It has a simple REST API to add and List notes, and it shows how an app container talks to a separate database conatainer.

## Why I build this 

I am learning Devops, and Docker is one of the core tools. I wanted to go beyoond a single container and understand how an app container connects to a database container, how environment variables configure the app, and how Docker networks work.

## Tech Stack

- Node.js + Express
- MySQL
- Docker

## API Endpoints
 
| Method | Endpoint | Description |
| ------ | -------- | ----------- |
| GET | `/` | Health message, confirms the app is running |
| GET | `/notes` | List all notes (newest first) |
| POST | `/notes` | Add a note. Body: `{ "message": "your text" }` |
 
The `notes` table is created automatically on startup. The app also retries the database connection every 3 seconds, so it is fine if MySQL takes a few seconds to be ready.

## Configuration
 
The app reads these environment variables:
 
| Variable | Default | Purpose |
| -------- | ------- | ------- |
| `MYSQL_HOST` | `localhost` | Database host (use the MySQL container name in Docker) |
| `MYSQL_USER` | `root` | Database user |
| `MYSQL_PASSWORD` | none, set your own | Database password |
| `MYSQL_DB` | `testdb` | Database name |
| `MYSQL_PORT` | `3306` | Database port |
| `PORT` | `3000` | Port the app listens on |

## prerequisites 

- [Docker](https://docs.docker.com/get-docker/) installed
- Git

## How to Run


```bash
git clone https://github.com/rashidfaixan7868-glitch/dockerized-test-app.git
cd dockerized-test-app
docker compose up --build
```

Then open `http://localhost:3000` in your browser.

Try the API: Try the API:
 
```bash
curl -X POST http://localhost:3000/notes \
  -H "Content-Type: application/json" \
  -d '{"message": "hello from docker"}'
 
curl http://localhost:3000/notes
```
 
To stop everything:
 
```bash
docker compose down
```
## What I Learned
 
- Writing a `Dockerfile` for a Node.js app
- Difference between a Docker image and a container
- Running a multi-container app (app + database) with Docker Compose
- Port mapping and container networking
- Configuring an app with environment variables instead of hardcoding values
- Handling database startup delay with a retry loop
## Next Steps
 
- Add a `.dockerignore` file to keep the image small
- Add a volume so MySQL data survives container restarts
- Set up CI/CD with GitHub Actions
## Author
 
**Rashid**, learning DevOps and backend development.
