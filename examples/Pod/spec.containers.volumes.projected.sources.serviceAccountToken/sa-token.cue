package kube

k: Pod: "volumes-sa-token-pod": {
	spec: {
		containers: [{
			name:  "container-test"
			image: "busybox"
			volumeMounts: [{
				mountPath: "/service-account"
				name:      "volumes-sa-token-volume"
				readOnly:  true
			}]
		}]
		volumes: [{
			name: "volumes-sa-token-volume"
			projected: sources: [{
				serviceAccountToken: {
					audience:          "api"
					expirationSeconds: 3600
					path:              "token"
				}
			}]
		}]
	}
}
