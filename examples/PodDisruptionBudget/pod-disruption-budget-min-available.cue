package kube

k: PodDisruptionBudget: "pod-disruption-budget-min-available-simple": {
	spec: {
		minAvailable: 2
		selector: matchLabels: app: "app-simple"
	}
}
