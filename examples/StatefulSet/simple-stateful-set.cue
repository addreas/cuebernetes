package kube

k: Service: "simple-stateful-set": {
	metadata: {
		labels: app: "nginx"
	}
	spec: {
		clusterIP: "None"
		ports: [{
			name: "web"
			port: 80
		}]
		selector: app: "nginx"
	}
}
k: StatefulSet: "simple-stateful-set": {
	spec: {
		replicas: 3 // the default is 1
		selector: {
			matchLabels: app: "nginx"
		} // has to match .spec.template.metadata.labels
		template: {
			metadata: labels: app: "nginx" // has to match .spec.selector.matchLabels
			spec: {
				terminationGracePeriodSeconds: 10
				containers: [{
					image: "nginx"
					name:  "nginx"
					ports: [{
						containerPort: 80
						name:          "web"
					}]
					volumeMounts: [{
						mountPath: "/usr/share/nginx/html"
						name:      "www"
					}]
				}]
			}
		}
		volumeClaimTemplates: [{
			metadata: name: "www"
			spec: {
				accessModes: ["ReadWriteOnce"]
				resources: requests: storage: "1Gi"
				storageClassName: "my-storage-class"
			}
		}]
	}
}
