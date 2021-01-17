package kube

k: Service: "service-external-ips-service": {
	spec: {
		selector: app: "MyApp"
		ports: [{
			name:       "http"
			port:       80
			targetPort: 9376
		}]
		externalIPs: ["80.11.12.10"]
	}
}
