package kube

k: Pod: "volumes-hostdir-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "volumes-hostdir-container"
			volumeMounts: [{
				mountPath: "/volumes-hostdir-mount-path"
				name:      "volumes-hostdir-volume"
			}]
		}]
		volumes: [{
			hostPath: {
				// directory location on host
				path: "/tmp"
			}
			name: "volumes-hostdir-volume"
		}]
	}
}
