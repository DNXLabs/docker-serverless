FROM node:20-alpine

ENV SERVERLESS serverless@3.38.0

RUN apk --no-cache update && \
    apk --no-cache add \
        docker \
        python3 \
        python3-dev \
        py3-pip \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        jq \
        curl \
        wget \
        g++ \
        zip \
        git \
        openssh \
        postgresql-dev \
        yarn && \
    python3 -m venv /venv && \
    source /venv/bin/activate && \
    pip install --no-cache-dir awscli virtualenv && \
    update-ca-certificates && \
    yarn global add $SERVERLESS

WORKDIR /work
