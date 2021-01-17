package kube

k: NetworkPolicy: "network-policy-default-deny-egress": {
	spec: {
		podSelector: {}
		policyTypes: ["Egress"]
	}
}
