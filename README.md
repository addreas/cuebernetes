# [CUE](https://cuelang.org/) kubernetes example repo
The [kubernetes tutorial](https://github.com/cuelang/cue/blob/master/doc/tutorial/kubernetes/README.md) is probably required reading for this repo to make sense.

This is initially based on a `cue import -p kube -l '"k"' -l 'kind' -l metadata.name -f -R ./**/*.yaml` of [this repo](https://github.com/ContainerSolutions/kubernetes-examples/) containing kubernetes examle resources. Some `apiVersion`s have been bumped and changes/removals have been made to allow it to `cue vet` properly.

While this representative of what a repo setup like this could _perform_ like with CUE, it doesn't demonstrate a reasonable way of organizing resources. A folder structure based on clusters, namespaces, and applications allows for relevant constraints at each level which is a lot more useful. Reorganization of this repo might happen at some point.

## Scale
Counting resources using `cue export -e k ./... | jq -r '.[][].metadata.name' | wc -l` gets 198 for this repo which `cue vet`s in 7.8s on the same machine that `cue vet`s a "real" 548 resource repo in 23.8s. Duplicating the resources, perhaps unsurprisingly, gets twice the run time in both cases. The larger contains a bunch of CRDs in `kube_defs.cue` making it closer to 200 lines, but this seems to have a relatively insignificant impact.

## Issues
Adding this constraint that defaults the namespace for all resources makes running any tool (`cue cmd`) practically impossible because of extremely high cpu/memory usage.
```cue
k: [string]: [string]: metadata: namespace: *"cuebernetes" | string
```

Running `cue trim` fails on the `Namespace` resources. Namespaces only exist in the `Namespace` and `PodSecurityPolicy` examples, so these are not trimed for now.
