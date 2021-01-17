package kube

k: Role: "rbac-role-role": {
	rules: [{
		apiGroups: [""] // "" indicates the core API group
		resources: ["pods"]
		verbs: ["get", "watch", "list"]
	}]
}
