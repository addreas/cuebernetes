package kube

k: ClusterRoleBinding: "cluster-role-binding-clusterrolebinding-simple": {
	subjects: [{
		kind:     "Group"
		name:     "manager" // Name is case sensitive
		apiGroup: "rbac.authorization.k8s.io"
	}]
	roleRef: {
		kind:     "ClusterRole"
		name:     "cluster-role-binding-clusterrole-simple"
		apiGroup: "rbac.authorization.k8s.io"
	}
}
k: ClusterRole: "cluster-role-binding-clusterrole-simple": {
	rules: [{
		apiGroups: [""]
		// at the HTTP level, the name of the resource for accessing Secret
		// objects is "secrets"
		resources: ["secrets"]
		verbs: ["get", "watch", "list"]
	}]
}
