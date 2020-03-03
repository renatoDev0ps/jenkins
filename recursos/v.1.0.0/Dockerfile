FROM jenkins/jenkins:2.223-jdk11
USER root
RUN apt-get update && apt-get install -y make git
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup
USER jenkins
RUN echo 2.223-jdk11 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo 2.223-jdk11 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_HOME /usr/local/openjdk-11
COPY --chown=jenkins:jenkins config_jenkins /var/jenkins_home