package kube

k: Service: "service-load-balancer-service": {
	spec: {
		selector: app: "MyApp"
		ports: [{
			port:       80
			targetPort: 9376
		}]
		type: "LoadBalancer"
	}
}
