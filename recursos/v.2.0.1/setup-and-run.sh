#!/usr/bin/env bash

dockerhub_user=renatodevops

jenkins_port=8080
image_name=devops-jenkins
image_version=2.0.1
container_name=md-jenkins

docker pull jenkins:2.219

if [ ! -d downloads ]; then
    mkdir downloads
    curl -o downloads/jdk-8u212-linux-x64.tar.gz https://github.com/frekele/oracle-java/releases/download/8u212-b10/jdk-8u212-linux-x64.tar.gz
    curl -o downloads/jdk-7u80-linux-x64.tar.gz https://github.com/frekele/oracle-java/releases/download/7u80-b15/jdk-7u80-linux-x64.tar.gz
    curl -o downloads/apache-maven-3.6.3-bin.tar.gz http://mirror.vorboss.net/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
fi

docker stop ${container_name}

docker build --no-cache -t ${dockerhub_user}/${image_name}:${image_version} .

if [ ! -d m2deps ]; then
    mkdir m2deps
fi
if [ -d jobs ]; then
    rm -rf jobs
fi
if [ ! -d jobs ]; then
    mkdir jobs
fi

docker run -p ${jenkins_port}:8080 -d \
    -v `pwd`/downloads:/var/jenkins_home/downloads \
    -v `pwd`/jobs:/var/jenkins_home/jobs/ \
    -v `pwd`/m2deps:/var/jenkins_home/.m2/repository/ \
    -v $HOME/.ssh:/var/jenkins_home/.ssh/ \
    --rm --name ${container_name} \
    ${dockerhub_user}/${image_name}:${image_version}