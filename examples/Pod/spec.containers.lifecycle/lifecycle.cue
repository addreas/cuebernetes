package kube

k: Pod: "lifecycle-pod": {
	spec: containers: [{
		image: "nginx"
		lifecycle: {
			postStart: exec: command: ["/bin/sh", "-c", "echo Hello from the postStart handler > /usr/share/message"]
			preStop: exec: command: ["/bin/sh", "-c", "nginx -s quit; while killall -0 nginx; do sleep 1; done"]
		}
		name: "lifecycle-container"
	}]
}
