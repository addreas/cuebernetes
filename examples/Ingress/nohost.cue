package kube

k: Ingress: "name-virtual-host-ingress": {
	spec: rules: [{
		host: "first.bar.com"
		http: paths: [{
			backend: service: {
				name: "testsvc1"
				port: number: 80
			}
		}]
	}, {
		host: "second.foo.com"
		http: paths: [{
			backend: service: {
				name: "testsvc2"
				port: number: 80
			}
		}]
	}, {
		// No host supplied here
		http: {
			paths: [{
				backend: service: {
					name: "testsvc3"
					port: number: 80
				}
			}]
		}
	}]
}
