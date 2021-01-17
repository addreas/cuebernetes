package kube

k: Pod: "debug-network-pod": {
	spec: containers: [{
		command: [
			"sleep",
			"3600",
		]
		image: "praqma/network-multitool"
		name:  "debug-network-container"
	}]
}
