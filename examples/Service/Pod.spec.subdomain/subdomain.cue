package kube

k: Service: "subdomain-simple-subdomain-service": {
	spec: {
		clusterIP: "None" // A headless service
		ports: [{
			name:       "subdomain-simple-port-name" // Actually, no port is needed.
			port:       1234
			targetPort: 1234
		}]
		selector: name: "subdomain-simple-selector"
	}
}
k: Pod: "subdomain-simple-pod-1": {
	metadata: {
		labels: name: "subdomain-simple-selector"
	}
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "subdomain-simple-container-1"
		}]
		hostname:  "subdomain-simple-hostname-1"
		subdomain: "subdomain-simple-subdomain-service"
	}
}
k: Pod: "subdomain-simple-pod-2": {
	metadata: {
		labels: name: "subdomain-simple-selector"
	}
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "subdomain-simple-container-2"
		}]
		hostname:  "subdomain-simple-hostname-2"
		subdomain: "subdomain-simple-subdomain-service"
	}
}
