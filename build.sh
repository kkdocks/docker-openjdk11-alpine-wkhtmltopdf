#!/usr/bin/env bash

docker build -t nekoimi/openjdk:11-alpine3.10-wkhtmltopdf .

docker push nekoimi/openjdk:11-alpine3.10-wkhtmltopdf

docker run --rm -v /mnt/c/Users/nekoimi/Developer/docker_projects/Nekoimi/kkdocks/docker-openjdk11-alpine-wkhtmltopdf/tmp:/opt nekoimi/openjdk:11-alpine3.10-wkhtmltopdf wkhtmltopdf -O Landscape --enable-local-file-access /opt/demo.html /opt/demo.pdf



