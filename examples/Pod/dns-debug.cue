package kube

k: Pod: "pod-dns-debug": {
	spec: containers: [{
		command: [
			"sleep",
			"3600",
		]
		image: "gcr.io/kubernetes-e2e-test-images/dnsutils:1.3"
		name:  "dnsutils"
	}]
}
