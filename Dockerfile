FROM node:20-alpine

ENV SERVERLESS serverless@4.0.35

RUN apk --no-cache update && \
    apk --no-cache add \
        docker \
        python3 \
        python3-dev \
        py-pip \
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
    python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip --no-cache-dir install awscli virtualenv && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    yarn global add $SERVERLESS

WORKDIR /work

# Ensure the virtual environment is activated in subsequent RUN instructions
ENV PATH="/opt/venv/bin:$PATH"