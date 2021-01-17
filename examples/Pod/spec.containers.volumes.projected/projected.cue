package kube

k: Pod: "volumes-projected-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "volumes-projected-container"
			volumeMounts: [{
				name:      "volumes-projected-volume-mount"
				mountPath: "/volumes-projected-volume-path"
				readOnly:  true
			}]
		}]
		volumes: [{
			name: "volumes-projected-volume-mount"
			projected: sources: [{
				secret: {
					items: [{
						key:  "username"
						path: "my-group/my-username"
						mode: 511
					}]
					name: "volumes-projected-secret"
				}
			}, {
				downwardAPI: items: [{
					path: "labels"
					fieldRef: fieldPath: "metadata.labels"
				}, {
					path: "cpu_limit"
					resourceFieldRef: {
						containerName: "container-test"
						resource:      "limits.cpu"
					}
				}]
			}, {
				configMap: {
					items: [{
						key:  "config"
						path: "my-group/my-config"
					}]
					name: "volumes-projected-configmap"
				}
			}]
		}]
	}
}
