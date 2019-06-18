#!/bin/bash

STAGE=$STAGE;
S3_BUCKET=$S3_BUCKET
DISTRIBUTION=$DISTRIBUTION

if [ -z "$STAGE" ]; then
    echo "STAGE environment variable must be defined: ${STAGE}"
    exit 1;
fi

if [ -z "$S3_BUCKET" ]; then
    echo "S3_BUCKET environment variable must be defined: ${S3_BUCKET}"
    exit 1;
fi



# copy the contents of /build to S3
aws s3 cp --recursive --acl public-read ./build s3://${S3_BUCKET}/

# set the cache-control headers for service-worker.js to prevent
# browser caching
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./build/service-worker.js s3://${S3_BUCKET}/

# set the cache-control headers for index.html to prevent
# browser caching
aws s3 cp --acl public-read --cache-control="max-age=0, no-cache, no-store, must-revalidate" ./build/index.html s3://${S3_BUCKET}/

# invalidate the CloudFront cache for index.html and service-worker.js
# to force CloudFront to update its edge locations with the new versions
aws cloudfront create-invalidation --distribution-id ${DISTRIBUTION} --paths /index.html /service-worker.js