#!/bin/bash

set -e -u

for model in $MODELS; do
  echo "Building $model runtime image"
  docker build -t $model --build-arg model=$model .
  echo "Pushing $model to Docker Hub"
  docker tag $model $USER_NAME/$model
  docker push $USER_NAME/$model
done 
