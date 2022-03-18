# Copyright © 2021-2022 Compose Generator Contributors
# All rights reserved.

FROM alpine:3.15.0

# Install alpine packages
RUN apk update && apk add --no-cache sudo=1.9.8_p2-r1 bash=5.1.16-r0 curl=7.80.0-r0 git=2.34.1-r0 npm=8.1.3-r0 yarn=1.22.17-r0 \
    unzip=6.0-r9 python3=3.9.7-r4 py3-pip=20.3.4-r1 rust=1.56.1-r0 ruby=3.0.3-r0 ruby-dev=3.0.3-r0 ruby-etc=3.0.3-r0 make=4.3-r0 \
    zlib-dev=1.2.11-r3 icu-libs=69.1-r1 krb5-libs=1.19.2-r4 libgcc=10.3.1_git20211027-r0 libintl=0.21-r0 libssl1.1=1.1.1n-r0 libstdc++=10.3.1_git20211027-r0 \
    && rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn config set network-timeout 600000 -g && yarn global add @angular/cli @vue/cli create-react-app express-generator && yarn cache clean --all

# Install pip dependencies
RUN pip3 install --no-cache-dir flask-now==0.2.2 django==4.0.3

# Install gem packages
RUN gem install rails:7.0.2.3 && gem cleanup

# Install golang
RUN apk add --no-cache --virtual .build-deps gcc=10.3.1_git20211027-r0 musl-dev=1.2.2-r7 go=1.17.4-r0 openssl=1.1.1n-r0 \
    && rm -rf /var/cache/apk/* \
    && curl -sSL -o go.tar.gz https://golang.org/dl/go1.18.src.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz
WORKDIR /usr/local/go/src/
RUN ./make.bash && apk del .build-deps
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH=/opt/go/
ENV PATH=$PATH:$GOPATH/bin

# Install dotnet
RUN curl -sSL -o dotnet-install.sh https://dot.net/v1/dotnet-install.sh && chmod +x dotnet-install.sh && bash dotnet-install.sh && rm dotnet-install.sh
ENV PATH "/root/.dotnet:${PATH}"
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

WORKDIR /toolbox
ENTRYPOINT [ "/bin/bash", "-c"]
