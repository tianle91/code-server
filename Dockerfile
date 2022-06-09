FROM  nvidia/cuda:11.0.3-base-ubuntu20.04
RUN apt update -y 

# python
RUN apt install -y python3 python3-pip python3-venv
RUN ln -fs /usr/bin/python3 /usr/bin/python
RUN python -m pip install -U pip

# spark
RUN apt install --no-install-recommends -y openjdk-11-jdk-headless ca-certificates-java
RUN pip install pyspark==3.2.1
ENV PYSPARK_PYTHON=/usr/bin/python
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python
ENV JAVA_HOME=/usr/lib/jvm/default-java

# code server
RUN apt install -y curl
RUN curl -fsSL https://code-server.dev/install.sh | sh

ENTRYPOINT code-server
