package kube

k: Ingress: "ingress-fanout": {
	metadata: {
		annotations: "nginx.ingress.kubernetes.io/rewrite-target": "/"
	}
	spec: rules: [{
		host: "foo.bar.com"
		http: paths: [{
			path: "/path1"
			backend: service: {
				name: "testsvc1"
				port: number: 4201
			}
		}, {
			path: "/path2"
			backend: service: {
				name: "testsvc2"
				port: number: 4202
			}
		}]
	}]
}
