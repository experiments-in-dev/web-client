#!/bin/bash

STAGE=$STAGE;
GH_WEB_CLIENT_TOKEN=$GH_WEB_CLIENT_TOKEN

echo "Starting provisioning script."

if [ -z "$STAGE" ]; then
    echo "STAGE environment variable must be defined: ${STAGE}"
    exit 1;
fi

if [ -z "$GH_WEB_CLIENT_TOKEN" ]; then
    echo "GH_WEB_CLIENT_TOKEN environment variable must be defined: ${GH_WEB_CLIENT_TOKEN}"
    exit 1;
fi

echo "Provisioning ${STAGE}-web-client environment"

aws cloudformation create-stack --stack-name ${STAGE}-web-client \
 --template-body file://./cloudformation/web-client.yml \
 --parameters  ParameterKey=GithubAccessToken,ParameterValue=${GH_WEB_CLIENT_TOKEN} ParameterKey=Stage,ParameterValue=${STAGE} \
 --capabilities CAPABILITY_NAMED_IAM
