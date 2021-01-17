package kube

k: ResourceQuota: "resource-quotas-quotas-pods-high": {
	spec: {
		hard: {
			cpu:    "1000"
			memory: "200Gi"
			pods:   "10"
		}
		scopeSelector: matchExpressions: [{
			operator:  "In"
			scopeName: "PriorityClass"
			values: ["high"]
		}]
	}
}
k: ResourceQuota: "resource-quotas-quotas-pods-medium": {
	spec: {
		hard: {
			cpu:    "10"
			memory: "20Gi"
			pods:   "10"
		}
		scopeSelector: matchExpressions: [{
			operator:  "In"
			scopeName: "PriorityClass"
			values: ["medium"]
		}]
	}
}
k: ResourceQuota: "resource-quotas-quotas-pods-low": {
	spec: {
		hard: {
			cpu:    "5"
			memory: "10Gi"
			pods:   "10"
		}
		scopeSelector: matchExpressions: [{
			operator:  "In"
			scopeName: "PriorityClass"
			values: ["low"]
		}]
	}
}
