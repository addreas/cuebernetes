package kube

k: Deployment: "deployments-simple-deployment-deployment": {
	spec: {
		replicas: 2
		selector: matchLabels: app: "deployments-simple-deployment-app"
		template: {
			metadata: labels: app: "deployments-simple-deployment-app"
			spec: containers: [{
				name:  "busybox"
				image: "busybox"
				command: [
					"sleep",
					"3600",
				]
			}]
		}
	}
}
