FROM python:3.13.11-alpine3.22@sha256:2fd93799bfc6381d078a8f656a5f45d6092e5d11d16f55889b3d5cbfdc64f045

ARG MKDOCS_VERSION=1.6.1
ARG MKDOCS_MATERIAL_VERSION=9.7.7

RUN apk add --no-cache aws-cli git \
    && python3 -m pip install --no-cache-dir \
      "mkdocs==${MKDOCS_VERSION}" \
      "mkdocs-material==${MKDOCS_MATERIAL_VERSION}"