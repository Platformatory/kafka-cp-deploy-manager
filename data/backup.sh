#!/bin/bash

set -ex

if [ $# -ne 2 ]; then
  echo usage: $0 jenkins_home backup_folder
  exit 1
fi

# Jenkins home folder
JENKINS_HOME=$1
# folder name where backup will be stored
BACKUP_FOLDER=$2

mkdir -p "${BACKUP_FOLDER}"

rsync -av --delete \
--exclude="jobConfigHistory" \
--exclude="war" \
--exclude="config-history" \
--exclude=".hudson" \
--exclude=".ivy2" \
--exclude=".m2" \
--exclude="lost+found" \
--exclude="fingerprints" \
--exclude="jobs/*/*/*/builds" \
--exclude="log" \
--exclude="logs" \
--exclude="workspace" \
--exclude="backups" \
--prune-empty-dirs \
${JENKINS_HOME}/ "${BACKUP_FOLDER}"

## example to use in build execute shell
# set -ex
# $JENKINS_HOME/jenkins-backup.sh $JENKINS_HOME backup-folder
