FROM ubuntu:latest
RUN apt-get update -y
# RUN apt-get install -y python-pip python-dev build-essential

RUN apt-get update && apt-get install -y \
    curl \
    git \
    screen \
    tmux \
    sudo \
    nano \
    pkg-config \
    software-properties-common \
    unzip \
    vim \
    wget \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt && \
    pip install -r requirements-local.txt
ENTRYPOINT ["python"]
CMD ["bin/cakechat_server.py"]