FROM alpine:3.13.5
WORKDIR /toolbox

# Install alpine packages
RUN apk update && apk add --no-cache sudo=1.9.5p2-r0 bash=5.1.0-r0 curl=7.76.1-r0 git=2.30.2-r0 npm=14.16.1-r1 yarn=1.22.10-r0 unzip=6.0-r8 python3=3.8.8-r0 py3-pip=20.3.4-r0 && rm -rf /var/cache/apk/*

# Install required npm packages
RUN yarn global add @angular/cli @vue/cli

# Install pip dependencies
RUN pip3 install --no-cache-dir flask-now==0.2.2

ENTRYPOINT [ "/bin/bash", "-c"]