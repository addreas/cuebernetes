package kube

k: Service: "multi-port-service-service": {
	spec: {
		selector: app: "MyApp"
		ports: [{
			name:       "http"
			port:       80
			targetPort: 8080
		}, {
			name:       "https"
			port:       443
			targetPort: 8443
		}]
	}
}
