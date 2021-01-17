package kube

k: NetworkPolicy: "network-policy-default-deny-all": {
	spec: {
		podSelector: {}
		policyTypes: [
			"Ingress",
			"Egress",
		]
	}
}
