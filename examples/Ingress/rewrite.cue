package kube

k: Ingress: "ingress-rewrite": {
	metadata: {
		annotations: "nginx.ingress.kubernetes.io/rewrite-target": "/"
	}
	spec: rules: [{
		http: paths: [{
			path:     "/rewritepath"
			pathType: "Prefix"
			backend: service: {
				name: "testsvc"
				port: number: 80
			}
		}]
	}]
}
