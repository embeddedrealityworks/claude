FROM debian:trixie-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    git \
    bash \
    sudo \
    nodejs \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -r claude \
    && useradd -r -g claude -d /home/claude -c "claude" claude \
    && mkdir -p /home/claude/ \
    && chown -R claude:claude /home/claude/ \
    && echo "claude ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER claude
WORKDIR /home/claude
ENV PATH="/home/claude/.local/bin:$PATH"
RUN curl -fsSL https://claude.ai/install.sh | bash
