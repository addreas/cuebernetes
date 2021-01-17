package kube

k: Pod: "memory-request-limit-pod": {
	spec: containers: [{
		command: ["sleep", "3600"]
		image: "busybox"
		name:  "memory-request-limit-container"
		resources: {
			limits: memory:   "200Mi"
			requests: memory: "100Mi"
		}
	}]
}
