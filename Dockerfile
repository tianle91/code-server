FROM nvidia/cuda:11.0.3-base-ubuntu20.04
RUN apt update -y 

# python
RUN apt install -y gcc libpq-dev
RUN apt install -y python3-dev python3-pip python3-venv python3-wheel
RUN ln -fs /usr/bin/python3 /usr/bin/python
RUN python -m pip install -U pip wheel
RUN echo 'alias venv="python -m venv"' >> ~/.bashrc

# spark
RUN apt install --no-install-recommends -y openjdk-11-jdk-headless ca-certificates-java
RUN pip install pyspark==3.2.1
ENV PYSPARK_PYTHON=/usr/bin/python
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python
ENV JAVA_HOME=/usr/lib/jvm/default-java

# code server
RUN apt install -y curl git vim
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN git config --global user.email "tianlechen@gmail.com"
RUN git config --global user.name "Tianle"

ENTRYPOINT code-server
