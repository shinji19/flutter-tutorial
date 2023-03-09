FROM ubuntu:22.04

ARG flutter_version="3.7.7"
RUN apt update && apt install -y curl file git unzip xz-utils zip snapd

WORKDIR /
RUN curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${flutter_version}-stable.tar.xz &&\
    tar xf flutter_linux_${flutter_version}-stable.tar.xz &&\
    rm flutter_linux_${flutter_version}-stable.tar.xz
ENV PATH $PATH:/flutter/bin
RUN flutter precache

RUN apt install -y wget
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list &&\
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - &&\
    apt update && apt install -y google-chrome-stable
