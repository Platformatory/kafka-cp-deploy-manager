FROM bitnami/kubectl:1.27 as kubectl

FROM jenkins/jenkins:lts-jdk11

USER root
# Utils
RUN apt-get update && apt-get install wget curl git vim rsync -y -qq
# Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
# Yq
RUN wget https://github.com/mikefarah/yq/releases/download/v4.34.2/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq

# kubectl
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

# ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && apt update && apt install ansible -y -qq

USER jenkins
