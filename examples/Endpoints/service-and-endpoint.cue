package kube

k: Service: "service-and-endpoint": {
	spec: ports: [{
		port:       80
		targetPort: 9376
	}]
}
k: Endpoints: "service-and-endpoint": {
	subsets: [{
		addresses: [{
			ip: "192.0.2.42"
		}]
		ports: [{
			port: 9376
		}]
	}]
}
