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