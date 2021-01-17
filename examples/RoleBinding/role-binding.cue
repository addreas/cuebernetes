package kube

k: RoleBinding: "rbac-role-binding-role-binding": {
	subjects: [{
		// You can specify more than one "subject"
		kind:     "User"
		name:     "jane" // "name" is case sensitive
		apiGroup: "rbac.authorization.k8s.io"
	}]
	roleRef: {
		// "roleRef" specifies the binding to a Role / ClusterRole
		kind: "Role" // this must be Role or ClusterRole
		// this must match the name of the Role or ClusterRole you wish to bind to
		name:     "rbac-role-binding-role"
		apiGroup: "rbac.authorization.k8s.io"
	}
}
k: Role: "rbac-role-binding-role": {
	rules: [{
		apiGroups: [""] // "" indicates the core API group
		resources: ["pods"]
		verbs: ["get", "watch", "list"]
	}]
}
