package kube

k: Service: "service-node-port-service": {
	spec: {
		type: "NodePort"
		selector: app: "MyApp"
		ports: [{
			port:       80 // By default and for convenience, the `targetPort` is set to the same value as the `port` field.
			targetPort: 80 // Optional field.
			nodePort:   30007
		}]
	}
}
