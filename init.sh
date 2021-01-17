#!/bin/bash

GO_PKG_URLS=(
    k8s.io/api/core/v1
    k8s.io/api/apps/v1
    k8s.io/api/rbac/v1
    k8s.io/api/batch/v2alpha1
    k8s.io/api/storage/v1
    k8s.io/api/policy/v1beta1
    k8s.io/api/networking/v1
    k8s.io/api/discovery/v1beta1
    k8s.io/apimachinery/pkg/apis/meta/v1
)

go mod init github.com/addreas/cuebernetes
cue mod init github.com/addreas/cuebernetes

for URL in ${GO_PKG_URLS[@]}; do
    printf "$URL..."
    go get $URL
    cue get go $URL
    printf "done\n"
done

cue import -p kube -l '"k"' -l 'kind' -l metadata.name -f -R ./**/*.yaml
