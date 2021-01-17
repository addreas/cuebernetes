package kube

k: Service: "service-simple-service": {
	spec: {
		selector: app: "service-simple-app"
		ports: [{
			port:       80
			targetPort: 8080
		}]
	}
}
