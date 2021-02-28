package kube

k: GitRepository: "flux-system": spec: {
	interval: "1m0s"
	ref: branch: "main"
	secretRef: name: "flux-system"
	url: "ssh://git@github.com/addreas/homelab"
}

k: Kustomization: "flux-system": spec: {
	interval: "10m0s"
	path:     "./resources"
	prune:    true
	sourceRef: {
		kind: "GitRepository"
		name: "flux-system"
	}
	validation: "client"
}
