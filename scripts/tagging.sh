#!/bin/bash

# Check if tag version is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <version> [--re]"
    echo "Example: $0 v1.0.0 [--re]"
    exit 1
fi

VERSION=$1
RE_TAG=false

# Check for --re option
if [ "$2" = "--re" ]; then
    RE_TAG=true
fi

# If --re option is provided, delete existing tag first
if [ "$RE_TAG" = true ]; then
    echo "Removing existing tag $VERSION..."
    git tag -d $VERSION 2>/dev/null || true
    git push origin :refs/tags/$VERSION 2>/dev/null || true
fi

# Create and push new tag
echo "Creating tag $VERSION..."
git tag -a $VERSION -m "Release $VERSION"
git push origin $VERSION

echo "Tag $VERSION has been $([ "$RE_TAG" = true ] && echo "re-" || echo "")created and pushed."
