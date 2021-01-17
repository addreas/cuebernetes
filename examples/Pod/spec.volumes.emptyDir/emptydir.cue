package kube

k: Pod: "volumes-emptydir-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "volumes-emptydir-container"
			volumeMounts: [{
				mountPath: "/volumes-emptydir-mount-path"
				name:      "volumes-emptydir-volume"
			}]
		}]
		volumes: [{
			name: "volumes-emptydir-volume"
			emptyDir: {}
		}]
	}
}