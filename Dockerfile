FROM debian:bullseye-20210816-slim

## Image metadata ##

LABEL org.opencontainers.image.version=$IMAGE_VERSION
LABEL org.opencontainers.image.authors="Stuart Ellis <stuart@stuartellis.name>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Tools Container" \ 
  org.opencontainers.image.description="Linux shell and tools"

WORKDIR /home/user

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove && \
    apt-get clean

# Packages that are required by installers
RUN apt-get install -y curl sudo unzip

# Extra packages: dnsutils provides dig
RUN apt-get install -y dnsutils git inetutils-ping rsync vim zip

RUN groupadd --gid 1000 tbusers \
  && useradd --uid 1000 --gid tbusers --shell /bin/bash --create-home tbuser
  
RUN echo '%tbusers ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Install Node.js 14 LTS
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

# Install latest AWS CLI version 2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \ 
  unzip awscliv2.zip && \ 
  ./aws/install && \
  rm awscliv2.zip

# Create mount point
RUN mkdir /mnt/share

USER tbuser
WORKDIR /home/tbuser

# Add Vim configuration 
COPY config/.vimrc /home/tbuser/.vimrc
