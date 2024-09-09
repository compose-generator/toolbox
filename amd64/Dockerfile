# Copyright © 2021-2022 Compose Generator Contributors
# All rights reserved.

FROM alpine:3.20.3

# Install alpine packages
RUN apk update && apk add --no-cache sudo=1.9.13_p3-r2 bash=5.2.15-r5 curl=8.2.1-r0 git=2.40.1-r0 npm=9.6.6-r0 yarn=1.22.19-r0 \
    unzip=6.0-r14 python3=3.11.4-r0 py3-pip=23.1.2-r0 rust=1.71.1-r0 ruby=3.2.2-r0 ruby-dev=3.2.2-r0 ruby-etc=3.2.2-r0 make=4.4.1-r1 \
    zlib-dev=1.2.13-r1 icu-libs=73.2-r2 krb5-libs=1.20.1-r1 libgcc=12.2.1_git20220924-r10 libintl=0.21.1-r7 libssl1.1=1.1.1u-r1 libstdc++=12.2.1_git20220924-r10 \
    && rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn config set network-timeout 600000 -g && yarn global add @angular/cli @vue/cli create-react-app@5.0.1 express-generator && yarn cache clean --all

# Install pip dependencies
RUN pip3 install --no-cache-dir flask-now==0.2.2 django==4.2.4

# Install gem packages
RUN gem install rails:7.0.7.2 && gem cleanup

# Install golang
RUN apk add --no-cache --virtual .build-deps gcc=12.2.1_git20220924-r10 musl-dev=1.2.4-r1 go=1.20.7-r0 openssl=3.1.2-r0 \
    && rm -rf /var/cache/apk/* \
    && curl -sSL -o go.tar.gz https://golang.org/dl/go1.21.0.src.tar.gz \
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
