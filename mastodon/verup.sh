#!/bin/bash

sed -i "" -e "s/image: .*mastodon:.*/image: ghcr.io\/mastodon\/mastodon:v${1}/g" *.yaml
