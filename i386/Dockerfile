# Copyright © 2021-2022 Compose Generator Contributors
# All rights reserved.

FROM alpine:3.16.2

# Install alpine packages
RUN apk update && apk add --no-cache sudo=1.9.10-r0 bash=5.1.16-r2 curl=7.83.1-r3 git=2.36.2-r0 npm=8.10.0-r0 yarn=1.22.19-r0 \
    unzip=6.0-r9 python3=3.10.5-r0 py3-pip=22.1.1-r0 rust=1.60.0-r2 ruby=3.1.2-r0 ruby-dev=3.1.2-r0 ruby-etc=3.1.2-r0 make=4.3-r0 \
    zlib-dev=1.2.12-r3 icu-libs=71.1-r2 krb5-libs=1.19.3-r0 libgcc=11.2.1_git20220219-r2 libintl=0.21-r2 libssl1.1=1.1.1q-r0 libstdc++=11.2.1_git20220219-r2 \
    && rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn config set network-timeout 600000 -g && yarn global add @angular/cli @vue/cli create-react-app@5.0.1 express-generator && yarn cache clean --all

# Install pip dependencies
RUN pip3 install --no-cache-dir flask-now==0.2.2 django==4.1.1

# Install gem packages
RUN gem install rails:7.0.4 && gem cleanup

# Install dotnet
RUN curl -sSL -o dotnet-install.sh https://dot.net/v1/dotnet-install.sh && chmod +x dotnet-install.sh && bash dotnet-install.sh && rm dotnet-install.sh
ENV PATH "/root/.dotnet:${PATH}"
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

WORKDIR /toolbox
ENTRYPOINT [ "/bin/bash", "-c"]
