FROM debian:buster-20210721-slim

## Image metadata ##

LABEL org.opencontainers.image.version=$IMAGE_VERSION
LABEL org.opencontainers.image.authors="Stuart Ellis <stuart@stuartellis.name>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Tools Container" \ 
  org.opencontainers.image.description="Linux shell and tools"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove && \
    apt-get clean

# Packages that are required by installers
RUN apt-get install -y curl unzip

# Extra packages: dnsutils provides dig
RUN apt-get install -y dnsutils git inetutils-ping rsync vim zip

WORKDIR /root

# Install Node.js 14 LTS
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

# Install latest AWS CLI version 2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \ 
  unzip awscliv2.zip && \ 
  ./aws/install && \
  rm awscliv2.zip

# Add Vim configuration 
COPY config/.vimrc /root/.vimrc

# Create mount point
RUN mkdir /mnt/share
