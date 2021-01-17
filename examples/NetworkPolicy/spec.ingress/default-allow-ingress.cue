package kube

k: NetworkPolicy: "network-policy-default-allow-ingress": {
	spec: {
		podSelector: {}
		ingress: [ {}]
		policyTypes: ["Ingress"]
	}
}
