#!/bin/sh


## Step 1: build image
echo "BUILD DOCKER IMAGE \n"
docker build -t ghcr.io/fajar-islami/karsajobs:latest

# Step 2 : showing all docker images
echo 'SHOWING ALL DOCKER IMAGES \n'
docker images

echo 'PUSHING DOCKER IMAGE TO GITHUB PACKAGES \n'
# Login Docker
make dockerlogin

# Step 4 : Push Image to github package
make dockerpush
