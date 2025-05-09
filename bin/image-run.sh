#!/bin/bash

# Load environment variables
source $(dirname "$0")/environment.sh

# Validate required environment variables
: "${VERSION:?Usage: VERSION=1.0.0 BOILERPLATES_DATABASE_DSN='your-dsn' BOILERPLATES_HTTP_SERVER_ADDRESS='your-http-address' BOILERPLATES_GRPC_SERVER_ADDRESS='your-grpc-address' BOILERPLATES_IMAGE_NAME=your-image-name bash bin/image-run.sh}" \
  "${BOILERPLATES_DATABASE_DSN:?Usage: VERSION=1.0.0 BOILERPLATES_DATABASE_DSN='your-dsn' BOILERPLATES_HTTP_SERVER_ADDRESS='your-http-address' BOILERPLATES_GRPC_SERVER_ADDRESS='your-grpc-address' BOILERPLATES_IMAGE_NAME=your-image-name bash bin/image-run.sh}" \
  "${BOILERPLATES_HTTP_SERVER_ADDRESS:?Usage: VERSION=1.0.0 BOILERPLATES_DATABASE_DSN='your-dsn' BOILERPLATES_HTTP_SERVER_ADDRESS='your-http-address' BOILERPLATES_GRPC_SERVER_ADDRESS='your-grpc-address' BOILERPLATES_IMAGE_NAME=your-image-name bash bin/image-run.sh}" \
  "${BOILERPLATES_GRPC_SERVER_ADDRESS:?Usage: VERSION=1.0.0 BOILERPLATES_DATABASE_DSN='your-dsn' BOILERPLATES_HTTP_SERVER_ADDRESS='your-http-address' BOILERPLATES_GRPC_SERVER_ADDRESS='your-grpc-address' BOILERPLATES_IMAGE_NAME=your-image-name bash bin/image-run.sh}" \
  "${BOILERPLATES_IMAGE_NAME:?Usage: VERSION=1.0.0 BOILERPLATES_DATABASE_DSN='your-dsn' BOILERPLATES_HTTP_SERVER_ADDRESS='your-http-address' BOILERPLATES_GRPC_SERVER_ADDRESS='your-grpc-address' BOILERPLATES_IMAGE_NAME=your-image-name bash bin/image-run.sh}"

# Run Docker image
echo "#:[.'.]:> Running Docker image version: $VERSION"
docker run --rm \
  -e BOILERPLATES_DATABASE_DSN="$BOILERPLATES_DATABASE_DSN" \
  -e BOILERPLATES_HTTP_SERVER_ADDRESS="$BOILERPLATES_HTTP_SERVER_ADDRESS" \
  -e BOILERPLATES_GRPC_SERVER_ADDRESS="$BOILERPLATES_GRPC_SERVER_ADDRESS" \
  -p "$BOILERPLATES_HTTP_SERVER_ADDRESS:$BOILERPLATES_HTTP_SERVER_ADDRESS" \
  -p "$BOILERPLATES_GRPC_SERVER_ADDRESS:$BOILERPLATES_GRPC_SERVER_ADDRESS" \
  "$BOILERPLATES_IMAGE_NAME:$VERSION"
echo "#:[.'.]:> Docker image $BOILERPLATES_IMAGE_NAME:$VERSION ran successfully! 🚀"