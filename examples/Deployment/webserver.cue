package kube

k: Deployment: "webserver-simple-deployment": {
	spec: {
		replicas: 2
		selector: matchLabels: app: "webserver-simple-app"
		template: {
			metadata: labels: app: "webserver-simple-app"
			spec: containers: [{
				name:  "webserver-simple-container"
				image: "python:3"
				command: [
					"python",
					"-m",
					"http.server",
				]
				ports: [{
					containerPort: 8000
				}]
			}]
		}
	}
}
k: Service: "webserver-simple-service": {
	spec: {
		selector: app: "webserver-simple-app"
		ports: [{
			port:       80
			targetPort: 8000
		}]
	}
}
