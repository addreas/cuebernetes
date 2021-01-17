package kube

k: Pod: "pods-multi-container-pod": {
	spec: containers: [{
		image: "busybox"
		command: [
			"sleep",
			"3600",
		]
		name: "pods-multi-container-container-1"
	}, {
		image: "busybox"
		command: [
			"sleep",
			"3601",
		]
		name: "pods-multi-container-container-2"
	}]
}
