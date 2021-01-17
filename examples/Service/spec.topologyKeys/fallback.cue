package kube

k: Service: "service-topolgies-fallback-service": {
	spec: {
		selector: app: "my-app"
		ports: [{
			port:       80
			targetPort: 9376
		}]
		topologyKeys: [
			"kubernetes.io/hostname",
			"topology.kubernetes.io/zone",
			"topology.kubernetes.io/region",
			"*",
		]
	}
}
