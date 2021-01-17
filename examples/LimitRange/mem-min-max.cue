package kube

k: LimitRange: "limit-range-mem-min-max": {
	spec: limits: [{
		max: memory: "1Gi"
		min: memory: "500Mi"
		type: "Container"
	}]
}
