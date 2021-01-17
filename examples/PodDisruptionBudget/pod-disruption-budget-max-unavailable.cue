package kube

k: PodDisruptionBudget: "pod-disruption-budget-max-unavailable-simple": {
	spec: {
		maxUnavailable: "10%"
		selector: matchLabels: app: "app-simple"
	}
}
