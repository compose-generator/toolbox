FROM alpine:3.14.2

# Install alpine packages
RUN apk update && apk add --no-cache sudo=1.9.7_p1-r1 bash=5.1.4-r0 curl=7.78.0-r0 git=2.32.0-r0 npm=7.17.0-r0 yarn=1.22.10-r0 \
    unzip=6.0-r9 python3=3.9.5-r1 py3-pip=20.3.4-r1 rust=1.52.1-r1 ruby=2.7.4-r0 ruby-dev=2.7.4-r0 ruby-etc=2.7.4-r0 make=4.3-r0 \
    zlib-dev=1.2.11-r3 icu-libs=67.1-r2 krb5-libs=1.18.4-r0 libgcc=10.3.1_git20210424-r2 libintl=0.21-r0 libssl1.1=1.1.1l-r0 libstdc++=10.3.1_git20210424-r2 \
    && rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn global add @angular/cli @vue/cli create-react-app && yarn cache clean --all

# Install pip dependencies
RUN pip3 install --no-cache-dir flask-now==0.2.2 django==3.2.7

# Install gem packages
RUN gem install rails:6.1.4.1 && gem cleanup

# Install golang
RUN apk add --no-cache --virtual .build-deps gcc=10.3.1_git20210424-r2 musl-dev=1.2.2-r3 go=1.16.7-r0 openssl=1.1.1l-r0 \
    && rm -rf /var/cache/apk/* \
    && curl -sSL -o go.tar.gz https://golang.org/dl/go1.17.src.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz && rm go.tar.gz
WORKDIR /usr/local/go/src/
RUN ./make.bash && apk del .build-deps
ENV PATH="/usr/local/go/bin:$PATH"
ENV GOPATH=/opt/go/
ENV PATH=$PATH:$GOPATH/bin

# Install dotnet
RUN curl -sSL -o dotnet-install.sh https://dot.net/v1/dotnet-install.sh && chmod +x dotnet-install.sh && bash dotnet-install.sh && rm dotnet-install.sh
ENV PATH "/root/.dotnet:${PATH}"

WORKDIR /toolbox
ENTRYPOINT [ "/bin/bash", "-c"]