package kube

k: Pod: "pods-simple-pod": {
	spec: containers: [{
		command: [
			"sleep",
			"3600",
		]
		image: "busybox"
		name:  "pods-simple-container"
	}]
}
