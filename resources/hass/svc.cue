package kube

k: Service: hass2: {
	metadata: {
		labels: app: "hass"
	}
	spec: {
		ports: [{
			name: "http"
			port: 8123
		}]
		selector: app: "hass"
	}
}
k: ServiceMonitor: hass: {
	spec: {
		endpoints: [{
			port:     "http"
			interval: "60s"
			path:     "/api/prometheus"
		}]
		selector: matchLabels: app: "hass"
	}
}
