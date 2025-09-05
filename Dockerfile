# syntax=docker/dockerfile:1
FROM node:20-bullseye-slim

ENV NODE_ENV=production

# Install enterprise-grade system packages (typical for production image builds)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-pip \
        git \
        curl \
        vim \
        libpq-dev \
        libssl-dev \
        imagemagick \
        ffmpeg \
        ca-certificates \
        dnsutils \
        netcat \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

# Simulate copying package manifests & install heavy Node.js dependencies
RUN echo '{ "name": "cache-demo", "version": "1.0.0", "dependencies": { "express": "^4.18.2", "mongoose": "^8.0.4", "lodash": "^4.17.21", "pg": "^8.10.0", "sharp": "^0.32.5", "winston": "^3.10.0", "node-fetch": "^3.3.2", "bcrypt": "^5.1.1" } }' > package.json

RUN npm install --production

# Copy actual production requirements.txt from source code into image before pip install
COPY /src/python-app/requirements.txt .

RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Simulate realistic asset creation—heavy image/video build artifacts
RUN mkdir -p build && \
    convert -size 4096x4096 xc:blue build/large-image.png && \
    ffmpeg -f lavfi -i color=c=red:s=1920x1080:d=60 build/large-video.mp4 && \
    dd if=/dev/zero of=build/fake-artifact.bin bs=5M count=10

# NEW STEP to demonstrate caching: Add monitoring tool
RUN apt-get update && apt-get install -y --no-install-recommends htop

CMD ["node"]