# Compose Generator Toolbox
![GitHub release](https://img.shields.io/github/v/release/compose-generator/toolbox)
![Docker Pulls](https://img.shields.io/docker/pulls/chillibits/compose-generator-toolbox)
![CI](https://github.com/compose-generator/toolbox/workflows/Docker%20CI/badge.svg)

*Note: This library is part of the **[ComposeGenerator](https://github.com/compose-generator/compose-generator)** project, but also can be used independently.*

## Usage
To execute a Linux command on execute following Docker command:

```sh
docker run --rm -it -v ${pwd}:/toolbox chillibits/compose-generator-toolbox /bin/bash <command>
```

or

```sh
docker run --rm -it -v ${pwd}:/toolbox ghcr.io/compose-generator/compose-generator-toolbox /bin/bash <command>
```

Please note, that this Docker image is based on Linux Alpine and only supports a limited number of commands. So check if your command is supported in the list below.

## Included Linux commands

`bash`, `cargo`, `create-react-app`, `curl`, `django-admin`, `dotnet` (not for armv6, armv7, arm64), `git`, `go` (not for i386), `make`, `ng`, `npm`,
`pip`, `python`, `python3`, `rails`, `rustup`, `sh`, `unzip`, `vue`, `yarn`

© Marc Auberer 2021