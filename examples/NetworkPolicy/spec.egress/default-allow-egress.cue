package kube

k: NetworkPolicy: "network-policy-allow-egress": {
	spec: {
		podSelector: {}
		egress: [ {}]
		policyTypes: ["Egress"]
	}
}
