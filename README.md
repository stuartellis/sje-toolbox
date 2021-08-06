# tools-container

[![Stability: Experimental](https://masterminds.github.io/stability/experimental.svg)](https://masterminds.github.io/stability/experimental.html)

This provides a Linux shell with a set of tools for DevOps, using Docker.

It includes:

- AWS CLI
- Curl
- Git
- Node.js
- SSH
- Vim

## Usage

This project includes tasks in a *package.json* file. This enables you to run these tasks on any system that has Node.js installed.

To build the container image:

    npm run docker:build

To run the container:

    npm start

> This only works on a UNIX-based system. To run the container on Windows, use the task below.

To run the container without sharing directories:

    npm run shell

### Sharing

The *share* directory is available inside the Linux shell as */mnt/share*. This enables you to share files between the Linux shell and your host system.

The *.aws* directory in your user account is shared, so that the AWS CLI in the Linux shell automatically uses your settings.

Similarly, the *.ssh* directory in your user account is shared with the container.

> For safety, your .aws and .ssh directories are read-only in the Linux shell.

## Development

### Packages Required by Installers

The Docker image currently includes packages that are required by the Node.js and AWS CLI installers.

- curl
- unzip

These are kept in the final image, since they are useful tools.
