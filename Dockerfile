FROM debian:buster-20210721-slim

## Image metadata ##

LABEL org.opencontainers.image.version="0.1.0"
LABEL org.opencontainers.image.authors="Stuart Ellis <stuart@stuartellis.name>"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.title="Tools Container" \ 
  org.opencontainers.image.description="Linux shell and tools"

RUN apt-get update
