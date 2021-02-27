package kube

k: Service: "unifi-controller": {
	metadata: {
		labels: app: "unifi-controller"
	}
	spec: {
		ports: [{
			name: "https"
			port: 8443
		}, {
			name: "metrics"
			port: 9130
		}]
		selector: app: "unifi-controller"
	}
}
k: ServiceMonitor: "unifi-controller": {
	spec: {
		selector: matchLabels: app: "unifi-controller"
		endpoints: [{
			interval: "60s"
			port:     "metrics"
		}]
	}
}
