# tools-container

[![Stability: Experimental](https://masterminds.github.io/stability/experimental.svg)](https://masterminds.github.io/stability/experimental.html)

This provides a Linux shell with a set of tools for DevOps, using Docker.

It includes Git, Vim, Node.js and the AWS CLI.

## Usage

This project includes tasks in a *package.json* file. This enables you to run these tasks on any system that has Node.js installed.

To build the container image:

    npm run docker:build

To run the container:

    npm start

## Development

### Packages Required by Installers

The Docker image currently includes packages that are required by the Node.js and AWS CLI installers.

- curl
- unzip

These are kept in the final image, since they are useful tools.
