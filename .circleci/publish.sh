#!/usr/bin/env bash

set -e

if [ ! -z "$CIRCLE_TAG" ]; then
    echo "===========> Create Github release"
    curl -L -O 'https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_linux_amd64.zip'
    unzip ghr_v0.5.4_linux_amd64.zip -d .
    sudo chmod +x ghr
    ./ghr \
        -t "$GITHUB_TOKEN" \
        -u "$CIRCLE_PROJECT_USERNAME" \
        -r "$CIRCLE_PROJECT_REPONAME" \
        -c "$CIRCLE_SHA1" \
        -delete \
        "$CIRCLE_TAG" artifacts/apk
fi

