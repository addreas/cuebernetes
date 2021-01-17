package kube

k: Pod: "dns-config-policy-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "dns-config-policy-container"
		}]
		hostNetwork: true
		dnsPolicy:   "ClusterFirstWithHostNet"
	}
}
