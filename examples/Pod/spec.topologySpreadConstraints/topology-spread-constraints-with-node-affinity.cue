package kube

k: Pod: "topology-spread-constraints-with-node-affinity-pod": {
	metadata: {
		labels: label1: "value1"
	}
	spec: {
		topologySpreadConstraints: [{
			labelSelector: matchLabels: label1: "value1"
			maxSkew:           1
			topologyKey:       "zone"
			whenUnsatisfiable: "DoNotSchedule"
		}]
		affinity: nodeAffinity: requiredDuringSchedulingIgnoredDuringExecution: nodeSelectorTerms: [{
			matchExpressions: [{
				key:      "zone"
				operator: "NotIn"
				values: [
					"zoneC",
				]
			}]
		}]
		containers: [{
			name:  "pause"
			image: "k8s.gcr.io/pause:3.1"
		}]
	}
}
