FROM jenkins/jenkins:2.223-jdk11

LABEL Author="Renato do Nascimento Oliveira"

ARG master_image_version="v.2.0.0"
ENV master_image_version $master_image_version

USER jenkins
# RUN echo 2.223-jdk11 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
# RUN echo 2.223-jdk11 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
# Plugins Setup
 COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
 RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# Auto Configuration Script
COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/
COPY config/*.properties ${JENKINS_HOME}/config/