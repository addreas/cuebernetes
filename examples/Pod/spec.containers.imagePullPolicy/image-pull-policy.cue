package kube

k: Pod: "pods-image-pull-policy-pod": {
	spec: containers: [{
		command: [
			"sleep",
			"3600",
		]
		image:           "busybox"
		imagePullPolicy: "IfNotPresent"
		name:            "pods-image-pull-policy-container"
	}]
}
