package kube

k: Pod: "pods-liveness-exec-pod": {
	spec: containers: [{
		args: [
			"/bin/sh",
			"-c",
			"touch /tmp/healthy; sleep 30; rm -rf /tmp/healthy; sleep 600",
		]
		image: "busybox"
		livenessProbe: {
			exec: command: [
				"cat",
				"/tmp/healthy",
			]
			initialDelaySeconds: 5
			periodSeconds:       5
		}
		name: "pods-liveness-exec-container"
	}]
}
