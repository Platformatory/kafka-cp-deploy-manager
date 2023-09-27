#!/bin/bash

# Step 1: Copy the file from the source container to the local file system
docker cp "jenkins-cf_jenkins_1:/var/jenkins_home/.ssh/id_rsa.pub" "/tmp/tempfile"

# Step 2: Copy the file from the local file system to the destination container
docker cp "/tmp/tempfile" "cp-ansible-sandbox_kafka1_1:."
docker exec cp-ansible-sandbox_kafka1_1 -c "cat id_rsa.pub >> /root/.ssh/authorized_keys"

docker cp "/tmp/tempfile" "cp-ansible-sandbox_kafka1_2:."
docker exec cp-ansible-sandbox_kafka2_1 -c "cat id_rsa.pub >> /root/.ssh/authorized_keys"

docker cp "/tmp/tempfile" "cp-ansible-sandbox_kafka1_3:."
docker exec cp-ansible-sandbox_kafka3_1 -c "cat id_rsa.pub >> /root/.ssh/authorized_keys"

docker cp "/tmp/tempfile" "cp-ansible-sandbox_zookeeper1_1:."
docker exec cp-ansible-sandbox_zookeeper1_1 -c "cat id_rsa.pub >> /root/.ssh/authorized_keys"

docker cp "/tmp/tempfile" "cp-ansible-sandbox_zookeeper2_1:."
docker exec cp-ansible-sandbox_zookeeper2_1 -c "cat id_rsa.pub >> /root/.ssh/authorized_keys"

docker cp "/tmp/tempfile" "cp-ansible-sandbox_zookeeper3_1:."
docker exec cp-ansible-sandbox_zookeeper3_1 -c "cat id_rsa.pub >> /root/.ssh/authorized_keys"

docker cp "/tmp/tempfile" "cp-ansible-sandbox_control-center_1:."
docker exec cp-ansible-sandbox_control-center_1 -c "cat id_rsa.pub >> /root/.ssh/authorized_keys"

# Step 3: Remove the temporary file from the local file system
rm "/tmp/tempfile"

