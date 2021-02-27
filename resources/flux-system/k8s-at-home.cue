package kube

k: HelmRepository: "k8s-at-home": {
	apiVersion: "source.toolkit.fluxcd.io/v1beta1"
	kind:       "HelmRepository"
	metadata: {
		name:      "k8s-at-home"
		namespace: "flux-system"
	}
	spec: {
		interval: "1h"
		url:      "https://k8s-at-home.com/charts/"
	}
}