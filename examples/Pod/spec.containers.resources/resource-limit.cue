package kube

k: Pod: "resource-limit-pod": {
	spec: containers: [{
		name:  "resource-limit-container"
		image: "busybox"
		args: [
			"sleep",
			"600",
		]
		resources: limits: {
			cpu:    "30m"
			memory: "200Mi"
		}
	}]
}
