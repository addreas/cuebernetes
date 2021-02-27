package kube

k: Service: bitwarden: {
	metadata: {
		labels: app: "bitwarden"
	}
	spec: {
		ports: [{
			name: "http"
			port: 8080
		}, {
			name: "websocket"
			port: 3012
		}]
		type: "ClusterIP"
		selector: app: "bitwarden"
	}
}
