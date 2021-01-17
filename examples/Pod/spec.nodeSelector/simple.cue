package kube

k: Pod: "pod-node-selector-simple": {
	spec: {
		containers: [{
			command: ["sleep", "3600"]
			image: "busybox"
			name:  "pod-node-selector-simple-container"
		}]
		nodeSelector: "node-role.kubernetes.io/master": ""
	}
}
