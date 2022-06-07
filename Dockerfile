FROM  nvidia/cuda:11.0.3-base-ubuntu20.04

RUN apt update -y && apt install -y curl
RUN curl -fsSL https://code-server.dev/install.sh | sh

ENTRYPOINT code-server
