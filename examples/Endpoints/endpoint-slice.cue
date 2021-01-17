package kube

k: EndpointSlice: "endpoint-slices": {
	addressType: "IPv4"
	ports: [{
		name:     "http"
		protocol: "TCP"
		port:     80
	}]
	endpoints: [{
		addresses: [
			"10.1.2.3",
		]
		conditions: ready: true
		hostname: "pod-1"
		topology: {
			"kubernetes.io/hostname":      "node-1"
			"topology.kubernetes.io/zone": "us-west2-a"
		}
	}]
}
