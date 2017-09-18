FROM jenkins/jenkins:2.78-alpine

MAINTAINER "dmknopp"
LABEL Description="Jenkins to run against node projects"

ENV WORKING_DIRECTORY /var/jenkins_home
WORKDIR $WORKING_DIRECTORY

USER root

RUN apk update && \
    apk add nodejs && \
    npm i -g npm && \
    npm i -g multi-file-swagger && \
    npm i -g json2yaml && \
    npm i -g swagger && \
    npm i -g angular-cli

RUN rm -rf /var/cache/apk/* \
    rm -rf /usr/share/man && \
    rm -rf /tmp/*

USER $user