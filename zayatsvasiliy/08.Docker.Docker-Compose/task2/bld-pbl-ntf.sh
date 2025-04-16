#!/bin/bash


IMAGE_NAME="app_task2"
TAG="latest"

GITHUB_USER="zayatsvasiliy"
GHCR_IMAGE="ghcr.io/$GITHUB_USER/$IMAGE_NAME:$TAG"

SLACK_WEBHOOK_URL=""

function notify_slack {
  local stage=$1
  local status=$2
  local color=$([ "$status" == "success" ] && echo "good" || echo "danger")
  local text="*$stage* — *${status}* for image *${IMAGE_NAME}:${TAG}*"

  curl -s -X POST -H 'Content-type: application/json' --data "{
    \"attachments\": [{
      \"color\": \"${color}\",
      \"text\": \"${text}\"
    }]
  }" $SLACK_WEBHOOK_URL > /dev/null
}

echo "Build: $IMAGE_NAME:$TAG"
if docker build -t $IMAGE_NAME:$TAG .; then
  echo "Build ok"
  notify_slack "Docker Build" "success"
else
  echo "Build error"
  notify_slack "Docker Build" "failed"
  exit 1
fi

docker tag $IMAGE_NAME:$TAG $GHCR_IMAGE


echo " sign in ghcr.io"
echo $CR_PAT | docker login ghcr.io -u $GITHUB_USER --password-stdin
if [ $? -ne 0 ]; then
  echo "error GHCR"
  notify_slack "Login to GHCR" "failed"
  exit 1
fi

echo " publich GHCR: $GHCR_IMAGE"
if docker push $GHCR_IMAGE; then
  echo "publicsh ok"
  notify_slack "Publish to GHCR" "success"
else
  echo "publish error"
  notify_slack "Publish to GHCR" "failed"
  exit 1
fi
