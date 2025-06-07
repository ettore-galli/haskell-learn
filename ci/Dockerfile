# FROM mcr.microsoft.com/devcontainers/base:bullseye AS haskell-dev
FROM debian:bookworm-slim AS haskell-dev

RUN apt-get update && \
    apt-get install -y git build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 501 devuser    
RUN useradd -m \
    -d /var/devuser \
    -s /usr/bin/bash \
    -g devuser \
    -G sudo \
    -u 501 \
    devuser

RUN echo "devuser:password" | chpasswd

USER devuser:sudo

ENV HOME="/var/devuser"

WORKDIR ${HOME}

RUN \
    BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
    BOOTSTRAP_HASKELL_NO_STACK=1 \
    BOOTSTRAP_HASKELL_NO_HLS=1 \
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

ENV GHCUP_DIR="$HOME/.ghcup"
ENV GHCUP_BIN="$HOME/.ghcup/bin"
ENV PATH="$GHCUP_BIN:$PATH"
