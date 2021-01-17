package kube

k: Pod: "volumes-file-or-create-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			name:  "busybox"
			image: "busybox"
			volumeMounts: [{
				mountPath: "/var/local/aaa"
				name:      "volumes-file-or-create-dir"
			}, {
				mountPath: "/var/local/aaa/1.txt"
				name:      "volumes-file-or-create-file"
			}]
		}]
		volumes: [{
			name: "volumes-file-or-create-dir"
			hostPath: {
				// Ensure the file directory is created.
				path: "/var/local/aaa"
				type: "DirectoryOrCreate"
			}
		}, {
			name: "volumes-file-or-create-file"
			hostPath: {
				path: "/var/local/aaa/1.txt"
				type: "FileOrCreate"
			}
		}]
	}
}
