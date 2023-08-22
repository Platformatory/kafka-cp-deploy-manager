FROM jenkins/jenkins:lts-jdk11

USER root
# Utils
RUN apt-get update && apt-get install wget curl git vim rsync -y -qq
# Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
# Yq
RUN wget https://github.com/mikefarah/yq/releases/download/v4.34.2/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

USER jenkins
