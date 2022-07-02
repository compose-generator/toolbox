# Copyright © 2021-2022 Compose Generator Contributors
# All rights reserved.

FROM alpine:3.16.0

# Install alpine packages
RUN apk update && apk add --no-cache sudo=1.9.10-r0 bash=5.1.16-r2 curl=7.83.1-r2 git=2.36.1-r0 npm=8.10.0-r0 yarn=1.22.19-r0 \
    unzip=6.0-r9 python3=3.10.4-r0 py3-pip=22.1.1-r0 rust=1.60.0-r2 ruby=3.1.2-r0 ruby-dev=3.1.2-r0 ruby-etc=3.1.2-r0 make=4.3-r0 \
    zlib-dev=1.2.12-r1 icu-libs=71.1-r2 krb5-libs=1.19.3-r0 libgcc=11.2.1_git20220219-r2 libintl=0.21-r2 libssl1.1=1.1.1o-r0 libstdc++=11.2.1_git20220219-r2 \
    && rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn config set network-timeout 600000 -g && yarn global add @angular/cli @vue/cli create-react-app@5.0.1 express-generator && yarn cache clean --all

# Install pip dependencies
RUN pip3 install --no-cache-dir flask-now==0.2.2 django==4.0.5

# Install gem packages
RUN gem install rails:7.0.3 && gem cleanup

# Install golang
RUN apk add --no-cache --virtual .build-deps gcc=11.2.1_git20220219-r2 musl-dev=1.2.3-r0 go=1.18.2-r0 openssl=1.1.1p-r0 \
    && rm -rf /var/cache/apk/* \
    && curl -sSL -o go.tar.gz https://golang.org/dl/go1.18.src.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz
WORKDIR /usr/local/go/src/
RUN ./make.bash && apk del .build-deps
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH=/opt/go/
ENV PATH=$PATH:$GOPATH/bin

WORKDIR /toolbox
ENTRYPOINT [ "/bin/bash", "-c"]
