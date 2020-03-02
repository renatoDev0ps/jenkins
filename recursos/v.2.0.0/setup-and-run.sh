#!/bin/env bash

dockerhub_user=renatodevops

jenkins_port=8080
image_name=devops-jenkins
image_version=2.0.0
container_name=md-jenkins

docker pull jenkins:2.222-jdk11

if [ ! -d downloads ]; then
  mkdir downloads
  curl -o downloads/jdk