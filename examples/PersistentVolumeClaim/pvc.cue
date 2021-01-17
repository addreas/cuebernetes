package kube

k: PersistentVolumeClaim: "persistent-volume-claim": {
	spec: {
		accessModes: [
			"ReadWriteOnce",
		]
		resources: requests: storage: "5Gi"
		selector: matchLabels: pv:    "local"
		storageClassName: "hostpath"
	}
}
