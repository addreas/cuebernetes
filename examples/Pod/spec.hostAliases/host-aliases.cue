package kube

k: Pod: "pods-host-aliases-pod": {
	spec: {
		hostAliases: [{
			ip: "127.0.0.1"
			hostnames: [
				"foo.local",
				"bar.local",
			]
		}, {
			ip: "10.1.2.3"
			hostnames: [
				"foo.remote",
				"bar.remote",
			]
		}]
		containers: [{
			name:  "cat-hosts"
			image: "busybox"
			command: [
				"cat",
			]
			args: ["/etc/hosts"]
		}]
	}
}
