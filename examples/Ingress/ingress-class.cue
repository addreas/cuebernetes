package kube

k: IngressClass: "external-lb": {
	spec: {
		controller: "example.com/ingress-controller"
		parameters: {
			apiGroup: "k8s.example.com/v1alpha"
			kind:     "IngressParameters"
			name:     "external-lb"
		}
	}
}
