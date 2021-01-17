package kube

k: NetworkPolicy: "network-policy-default-deny-ingress": {
	spec: {
		podSelector: {}
		policyTypes: ["Ingress"]
	}
}
