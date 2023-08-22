# Intro

Jenkins package for running and testing Confluent Kafka pipelines.


# How to setup?

## Step 1: build the custom container image


```sh
$ docker build -t jenkins:pf .
```


## Step 2: run the custom container image

```sh
$ mkdir data
$ docker run -p 8080:8080 -p 50000:50000 -v $(pwd)/data:/var/jenkins_home jenkins:pf
```


## Step 3: Access the UI

Open [http://localhost:8080](http://localhost:8080) and use `admin` as the username and `admin123` as password to login to the Jenkins UI.



# Prerequistes

## Github repo

## Github private token


## Ansible

## ssh key

## Kubernetes

## kubeconfig


# Running pipelines

## Ansible collection download

### Parameters

## Ansible install

## CP oprator prerequisite

## CP operator install

## CP operator upgrade

## CFK install
