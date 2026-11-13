FROM node:24.22.1-bookworm-slim AS build

ARG HUGO_VERSION=0.167.0
ARG TARGETARCH

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL -o /tmp/hugo.tar.gz \
        "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-${TARGETARCH}.tar.gz" \
    && tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin hugo \
    && rm /tmp/hugo.tar.gz

WORKDIR /src

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN hugo --minify

FROM nginx:alpine

COPY --from=build /src/public/ /usr/share/nginx/html/
COPY Docker/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
