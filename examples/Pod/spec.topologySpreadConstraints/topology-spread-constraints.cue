package kube

k: Pod: "topology-spread-constraints-pod": {
	metadata: {
		labels: label1: "value1"
	}
	spec: {
		topologySpreadConstraints: [{
			maxSkew:           1
			topologyKey:       "zone"
			whenUnsatisfiable: "DoNotSchedule"
			labelSelector: matchLabels: label1: "value1"
		}]
		containers: [{
			name:  "pause"
			image: "k8s.gcr.io/pause:3.1"
		}]
	}
}
