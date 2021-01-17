package kube

k: Pod: "pods-image-pull-secrets-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "pods-image-pull-secrets-container"
		}]
		imagePullSecrets: [{
			name: "regcred"
		}]
	}
}
