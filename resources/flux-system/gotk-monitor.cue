package kube

k: PodMonitor: "gotk-monitor": {
	apiVersion: "monitoring.coreos.com/v1"
	kind:       "PodMonitor"
	metadata: {
		name:      "gotk-monitor"
		namespace: "flux-system"
	}
	spec: {
		podMetricsEndpoints: [{
			port:     "http-prom"
			interval: "60s"
		}]
		selector: matchExpressions: [{
			key:      "app"
			operator: "In"
			values: [
				"source-controller",
				"kustomize-controller",
				"helm-controller",
				"notification-controller",
			]
		}]
	}
}
k: RoleBinding: "prometheus-k8s": {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBinding"
	metadata: {
		name:      "prometheus-k8s"
		namespace: "flux-system"
	}
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "prometheus-k8s"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "prometheus-k8s"
		namespace: "monitoring"
	}]
}
k: Role: "prometheus-k8s": {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "Role"
	metadata: {
		name:      "prometheus-k8s"
		namespace: "flux-system"
	}
	rules: [{
		apiGroups: [
			"",
		]
		resources: [
			"services",
			"endpoints",
			"pods",
		]
		verbs: [
			"get",
			"list",
			"watch",
		]
	}, {
		apiGroups: [
			"extensions",
		]
		resources: [
			"ingresses",
		]
		verbs: [
			"get",
			"list",
			"watch",
		]
	}]
}