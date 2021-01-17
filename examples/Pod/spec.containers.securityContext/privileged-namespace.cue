package kube

k: Pod: "privileged-namespace-pod": {
	spec: {
		hostPID:     true
		hostIPC:     true
		hostNetwork: true
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "privileged-namespace-container"
			securityContext: privileged: true
		}]
	}
}
