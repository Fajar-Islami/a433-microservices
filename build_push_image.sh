#!/bin/sh
echo "BUILD DOCKER IMAGE"
docker build -t dicoding-proyek-pertama:v1 .

echo 'SHOWING ALL DOCKER IMAGES'
docker images

echo "CREATE IMAGE TAGGING FOR GITHUB PACKAGES"
docker tag dicoding-proyek-pertama:v1 ghcr.io/fajar-islami/dicoding-proyek-pertama:v1


echo "PUSHING DOCKER IMAGE TO GITHUB"
echo $CR_PAT | docker login ghcr.io
docker push ghcr.io/fajar-islami/dicoding-proyek-pertama:v1
