# Use a base image that supports systemd, for example, Ubuntu
FROM ubuntu:24.04

# Install necessary packages
RUN apt-get update && \
apt-get install -y shellinabox && \
apt-get install -y curl && \
apt-get install -y wget && \
apt-get install -y tar && \
apt-get install -y cli && \
apt-get install -y openssl && \
apt-get install -y PHP8.3 && \
apt-get install -y unzip && \
apt-get install -y systemd && \
apt-get install -y git && \
apt-get install -y composer && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:root' | chpasswd
# Expose the web-based terminal port
EXPOSE 3200

# Start shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
