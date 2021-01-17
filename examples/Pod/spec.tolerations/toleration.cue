package kube

k: Pod: "pod-toleration": {
	spec: {
		containers: [{
			command: ["sleep", "3600"]
			image: "busybox"
			name:  "pod-toleration-container"
		}]
		tolerations: [{
			key:      "" // empty means match all taint keys
			operator: "Exists"
		}]
	}
}
