package kube

k: Ingress: simple: {
	// Requires an appropriate ingress controller to exist on the cluster for this to take effect

	apiVersion: "networking.k8s.io/v1"
	kind:       "Ingress"
	metadata: {
		name: "simple"
		annotations: "nginx.ingress.kubernetes.io/rewrite-target": "/"
	}
	spec: rules: [{
		http: paths: [{
			path:     "/testpath"
			pathType: "Prefix"
			backend: service: {
				name: "test"
				port: number: 80
			}
		}]
	}]
}
