package kube

k: Service: "headless-service-normal-service": {
	spec: {
		selector: app: "headless-service-app"
		ports: [{
			port:       80
			targetPort: 3000
		}]
	}
}
k: Service: "headless-service-headless-service": {
	spec: {
		clusterIP: "None" // This marks this service out as a headless service
		selector: {
			app: "headless-service-app"
		}
		ports: [{
			port:       80
			targetPort: 3000
		}]
	}
}
k: Deployment: "headless-service-deployment": {
	metadata: {
		labels: app: "headless-service-app"
	}
	spec: {
		replicas: 2
		selector: matchLabels: app: "headless-service-app"
		template: {
			metadata: labels: app: "headless-service-app"
			spec: containers: [{
				command: [
					"sleep",
					"3600",
				]
				image: "busybox"
				name:  "headless-service-app"
				ports: [{
					containerPort: 3000
				}]
			}]
		}
	}
}
k: Pod: "headless-service-dnsutils-pod": {
	spec: containers: [{
		command: [
			"sleep",
			"3600",
		]
		image: "gcr.io/kubernetes-e2e-test-images/dnsutils:1.3"
		name:  "dnsutils"
	}]
}
