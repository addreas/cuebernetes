package kube

k: Pod: "pod-node-affinity": {
	spec: {
		affinity: nodeAffinity: requiredDuringSchedulingIgnoredDuringExecution: nodeSelectorTerms: [{
			matchExpressions: [{
				key:      "kubernetes.io/hostname"
				operator: "Exists"
			}]
		}]
		containers: [{
			command: ["sleep", "3600"]
			name:  "pod-node-affinity-container"
			image: "busybox"
		}]
	}
}
