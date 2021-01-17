package kube

k: PersistentVolume: "volumes-local-persistent-volume": {
	metadata: {
		labels: pv: "local"
	}
	spec: {
		capacity: storage: "5Gi"
		volumeMode: "Filesystem"
		accessModes: [
			"ReadWriteOnce",
		]
		persistentVolumeReclaimPolicy: "Delete"
		storageClassName:              "hostpath"
		local: path: "/mnt/disks/ssd1"
		nodeAffinity: required: nodeSelectorTerms: [{
			matchExpressions: [{
				key:      "kubernetes.io/hostname"
				operator: "In"
				values: ["docker-desktop"]
			}]
		}]
	}
}
