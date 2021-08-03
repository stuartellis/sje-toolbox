# tools-container

[![Stability: Experimental](https://masterminds.github.io/stability/experimental.svg)](https://masterminds.github.io/stability/experimental.html)

This provides a Linux shell with a set of tools for DevOps, using Docker.

It includes Git, Vim, Node.js and the AWS CLI.

## Usage

To build the container image:

    npm run docker:build

To run the container:

    npm start

## Development

### Packages Required by Installers

The AWS CLI installer requires these packages:

- curl
- unzip
