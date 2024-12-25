# Copyright © 2021-2024 Compose Generator Contributors
# All rights reserved.

FROM alpine:3.21.0

# Install alpine packages
RUN apk update && apk add --no-cache sudo=1.9.16_p2-r0 bash=5.2.37-r0 curl=8.11.1-r0 git=2.47.1-r0 npm=10.9.1-r0 yarn=1.22.22-r1 \
    unzip=6.0-r15 python3=3.12.8-r1 py3-pip=24.3.1-r0 rust=1.83.0-r0 ruby=3.3.6-r0 ruby-dev=3.3.6-r0 ruby-etc=3.3.6-r0 make=4.4.1-r2 \
    zlib-dev=1.3.1-r2 icu-libs=74.2-r0 krb5-libs=1.21.3-r0 libgcc=14.2.0-r4 libintl=0.22.5-r0 libstdc++=14.2.0-r4 \
    && rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn config set network-timeout 600000 -g && yarn global add @angular/cli @vue/cli create-react-app@5.0.1 express-generator && yarn cache clean --all

# Install pip dependencies
RUN pip3 install --no-cache-dir --break-system-packages flask-now==0.2.2 django==5.1.4

# Install gem packages
RUN gem install rails:8.0.1 && gem cleanup

# Install golang
RUN apk add --no-cache --virtual .build-deps gcc=14.2.0-r4 musl-dev=1.2.5-r8 go=1.23.4-r0 openssl=3.3.2-r4 \
    && rm -rf /var/cache/apk/* \
    && curl -sSL -o go.tar.gz https://golang.org/dl/go1.23.0.src.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz
WORKDIR /usr/local/go/src/
RUN ./make.bash && apk del .build-deps
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH=/opt/go/
ENV PATH=$PATH:$GOPATH/bin

# Install dotnet
RUN curl -sSL -o dotnet-install.sh https://dot.net/v1/dotnet-install.sh && chmod +x dotnet-install.sh && bash dotnet-install.sh && rm dotnet-install.sh
ENV PATH="/root/.dotnet:${PATH}"
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

WORKDIR /toolbox
ENTRYPOINT [ "/bin/bash", "-c"]
