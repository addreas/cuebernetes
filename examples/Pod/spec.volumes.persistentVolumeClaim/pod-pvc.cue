package kube

k: Pod: "volume-pvc": {
	spec: {
		containers: [{
			name:  "frontend"
			image: "nginx"
			volumeMounts: [{
				mountPath: "/usr/share/nginx/html"
				name:      "volume-pvc"
			}]
		}]
		volumes: [{
			name: "volume-pvc"
			persistentVolumeClaim: claimName: "persitent-volume-claim"
		}]
	}
}
