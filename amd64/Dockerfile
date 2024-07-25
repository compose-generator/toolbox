# Copyright © 2021-2024 Compose Generator Contributors
# All rights reserved.

FROM alpine:3.16.2

# Install alpine packages
RUN apk update && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main --allow-untrusted sudo bash curl git npm yarn unzip python3 py3-pip rust ruby ruby-dev ruby-etc make zlib-dev icu-libs krb5-libs libgcc libstdc++ libintl libssl1.1 && \
    rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn config set network-timeout 600000 -g && \
    yarn global add @angular/cli @vue/cli create-react-app express-generator && \
    yarn cache clean --all

# Install pip dependencies
RUN pip3 install --no-cache-dir setuptools flask-now django

# Install gem packages
RUN gem install rails && \
    gem cleanup

# Install golang
RUN apk add --no-cache --virtual .build-deps gcc musl-dev go openssl && \
    rm -rf /var/cache/apk/* && \
    curl -sSL -o go.tar.gz https://golang.org/dl/go1.22.5.src.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz
WORKDIR /usr/local/go/src/
RUN ./make.bash && apk del .build-deps
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH=/opt/go/
ENV PATH=$PATH:$GOPATH/bin

# Install dotnet
RUN curl -sSL -o dotnet-install.sh https://dot.net/v1/dotnet-install.sh && \
    chmod +x dotnet-install.sh && \
    bash dotnet-install.sh && \
    rm dotnet-install.sh
ENV PATH "/root/.dotnet:${PATH}"
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

WORKDIR /toolbox
ENTRYPOINT [ "/bin/bash", "-c"]
