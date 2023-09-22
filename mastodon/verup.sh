#!/bin/bash

sed -i "" -e "s/image: .*mastodon:.*/image: ghcr.io\/mastodon\/mastodon:${1}/g" *.yaml
find ./*.yaml -print0 | xargs -0 -I {} kubectl apply -f {}

# test
# find ./*.yaml -print0 | xargs -0 -I {} sh -c "echo {}"
