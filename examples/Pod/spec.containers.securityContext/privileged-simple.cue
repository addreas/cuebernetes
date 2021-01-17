package kube

k: Pod: "privileged-simple-pod": {
	spec: containers: [{
		command: [
			"sleep",
			"3600",
		]
		image: "busybox"
		name:  "privileged-simple-pod"
		securityContext: privileged: true
	}]
}
