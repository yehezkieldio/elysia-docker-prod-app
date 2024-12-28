FROM imbios/bun-node:latest-22-slim as base

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
  apt-get install -yq openssl git ca-certificates tzdata && \
  ln -fs /usr/share/zoneinfo/Asia/Makassar /etc/localtime && \
  dpkg-reconfigure -f noninteractive tzdata

# ---------------------------------------------------------------------------- #

FROM base as deps

WORKDIR /app

COPY package.json bun.lockb tsconfig.json ./
COPY src src

RUN bun install

# ---------------------------------------------------------------------------- #

FROM base as runner

WORKDIR /app

ENV NODE_ENV=production

COPY --from=deps /app/node_modules ./node_modules
COPY --from=deps /app/src src

EXPOSE 3000

CMD ["bun", "run", "./src/index.ts"]