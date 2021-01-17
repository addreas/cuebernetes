package kube

k: Secret: "ingress-tls-secret": {
	data: {
		// Data here as a placeholder - it's just a base64-encoded 'a'
		"tls.crt": 'a'
		"tls.key": 'a'
	}
	type: "kubernetes.io/tls"
}
k: Ingress: "ingress-tls": {
	spec: {
		tls: [{
			hosts: [
				"sslexample.foo.com",
			]
			secretName: "ingress-tls-secret"
		}]
		rules: [{
			host: "sslexample.foo.com"
			http: paths: [{
				path: "/"
				backend: service: {
					name: "testsvc1"
					port: number: 80
				}
			}]
		}]
	}
}
