# syntax=docker/dockerfile:1
FROM node:20-bullseye-slim

# Set environment for production
ENV NODE_ENV=production

# Install system build tools (simulate enterprise step)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        git \
        curl \
        vim \
    && rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /usr/src/app

# Simulate copying a package.json and installing dependencies
RUN echo '{ "name": "cache-demo", "version": "1.0.0", "dependencies": { "express": "^4.18.2", "mongoose": "^8.0.4", "lodash": "^4.17.21" } }' > package.json

# Install Node.js dependencies (heavy step)
RUN npm install --production

# Simulate build artifact creation
RUN mkdir -p build && dd if=/dev/zero of=build/fake-artifact.bin bs=1M count=20

CMD ["node"]