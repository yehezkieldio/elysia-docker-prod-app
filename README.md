# Elysia with Bun runtime

## Getting Started
To get started with this template, simply paste this command into your terminal:
```bash
bun create elysia ./elysia-example
```

## Development
To start the development server run:
```bash
bun run dev
```

Open http://localhost:3000/ with your browser to see the result.

## Production
To build the production version of the app run:
```bash
docker build -t elysia-docker-test .
```

To run the production version of the app run:
```bash
docker run --name elysia-test -e PORT=3000 -p 3000:3000 --network bridge elysia-docker-test
```