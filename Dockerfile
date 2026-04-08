FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    git curl wget nano vim python3 python3-pip sudo \
    cmake libwebsockets-dev libjson-c-dev build-essential \
    && rm -rf /var/lib/apt/lists/*

# ttyd bauen
RUN git clone https://github.com/tsl0922/ttyd.git /tmp/ttyd && \
    cd /tmp/ttyd && mkdir build && cd build && \
    cmake .. && make && make install

WORKDIR /root/workspace

EXPOSE 3000

# Mit Basic Auth (Username: admin, Password: render123)
CMD ["sh", "-c", "ttyd -p ${PORT:-3000} -c admin:render123 bash"]
