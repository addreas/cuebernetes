package kube

k: ClusterRole: "cluster-role-simple": {
	rules: [{
		apiGroups: [""]
		// at the HTTP level, the name of the resource for accessing Secret
		// objects is "secrets"
		resources: ["secrets"]
		verbs: ["get", "watch", "list"]
	}]
}
