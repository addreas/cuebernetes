package kube

k: Pod: "volumes-subpathexpr-pod": {
	spec: {
		containers: [{
			command: ["sleep", "3600"]
			env: [{
				name: "POD_NAME"
				valueFrom: fieldRef: {
					apiVersion: "v1"
					fieldPath:  "metadata.name"
				}
			}]
			image: "busybox"
			name:  "volumes-subpathexpr-container"
			volumeMounts: [{
				name:        "volumes-subpathexpr-volume"
				mountPath:   "/logs"
				subPathExpr: "$(POD_NAME)"
			}]
		}]
		restartPolicy: "Never"
		volumes: [{
			name: "volumes-subpathexpr-volume"
			hostPath: path: "/var/log/pods"
		}]
	}
}
