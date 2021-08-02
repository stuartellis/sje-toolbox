FROM debian:buster-20210721-slim

## Image metadata ##

LABEL org.opencontainers.image.version="0.1.0"
LABEL org.opencontainers.image.authors="Stuart Ellis <stuart@stuartellis.name>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Tools Container" \ 
  org.opencontainers.image.description="Linux shell and tools"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove && \
    apt-get clean

# dnsutils provides dig
RUN apt-get install -y curl dnsutils git inetutils-ping rsync unzip zip

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs
