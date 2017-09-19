FROM jenkins/jenkins:2.78-alpine

MAINTAINER "dmknopp"
LABEL Description="Jenkins to run against node projects"

ENV WORKING_DIRECTORY /var/jenkins_home
WORKDIR $WORKING_DIRECTORY

USER root

# Install packages
ENV ANGULAR_CLI_VERSION=1.4.2

RUN apk update && \
    apk add --no-cache nodejs && \
    apk add --no-cache libsass && \
    npm i -g npm && \
    npm i -g @angular/cli@^${ANGULAR_CLI_VERSION} && \
    npm i -g typescript ts-node tslint jasmine-ts nyc && \
    npm i -g multi-file-swagger json2yaml swagger

RUN rm -rf /var/cache/apk/* \
    rm -rf /usr/share/man && \
    rm -rf /tmp/*

USER $user