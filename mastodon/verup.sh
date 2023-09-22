#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd -P)"
echo $DIR
cd $DIR || exit
echo "verup start! target version: ${1}"

kube=$(which kubectl)
if [ -z "$kube" ]; then
    echo "kubectl not found. set /snap/bin/kubectl"
    $kube="/snap/bin/kubectl"
fi
echo $kube

sed -i "" -e "s/image: .*mastodon:.*/image: ghcr.io\/mastodon\/mastodon:${1}/g" *.yaml
find ./*.yaml -print0 | xargs -0 -I {} $kube apply -f {}

# test
# find ./*.yaml -print0 | xargs -0 -I {} sh -c "echo {}"
