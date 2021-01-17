package kube

k: StorageClass: "storage-class-simple": {
	provisioner:       "kubernetes.io/no-provisioner"
	volumeBindingMode: "WaitForFirstConsumer"
}
