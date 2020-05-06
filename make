#!/bin/bash

action=$1
version=$2
image_name="ansible-az"
image_tag="$image_name:$version"
image_latest="$image_name:latest"
docker_repo="ilyatek/ansible-az"

if [ "$action" == "build" ]; then
    
    docker build --build-arg BUILD_DATE=`date -u +”%H:%M:%S-%d/%m/%Y”` --build-arg VERSION=$version -t $image_tag -t $image_latest .

elif [ "$action" == "push" ]; then
    
    docker tag $image_tag $docker_repo:$version
    docker tag $image_latest $docker_repo:latest
    docker push $docker_repo:$version
    docker push $docker_repo:latest

fi