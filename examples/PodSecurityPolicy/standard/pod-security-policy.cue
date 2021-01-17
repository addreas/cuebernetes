package kube

k: Namespace: "pod-security-policy-psp-namespace": {
	// https://kubernetes.io/docs/concepts/policy/pod-security-policy/

	apiVersion: "v1"
	kind:       "Namespace"
	metadata: name: "pod-security-policy-psp-namespace"
}
k: PodSecurityPolicy: "pod-security-policy-psp": {
	apiVersion: "policy/v1beta1"
	kind:       "PodSecurityPolicy"
	metadata: name: "pod-security-policy-psp"
	spec: {
		privileged: false // Don't allow privileged pods!
		seLinux: {
			rule: "RunAsAny"
		}
		supplementalGroups: rule: "RunAsAny"
		runAsUser: rule: "RunAsAny"
		fsGroup: rule: "RunAsAny"
		volumes: [
			"*",
		]
	}
}
k: ServiceAccount: "pod-security-policy-user": {
	apiVersion: "v1"
	kind:       "ServiceAccount"
	metadata: {
		name:      "pod-security-policy-user"
		namespace: "pod-security-policy-psp-namespace"
	}
}
k: RoleBinding: "pod-security-policy-psp-user-editor": {
	apiVersion: "rbac.authorization.k8s.io/v1"
	kind:       "RoleBinding"
	metadata: {
		name:      "pod-security-policy-psp-user-editor"
		namespace: "pod-security-policy-psp-namespace"
	}
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "ClusterRole"
		name:     "edit"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "pod-security-policy-psp-namespace"
		namespace: "pod-security-policy-psp-namespace"
	}]
}
k: Pod: "pause-unprivileged": {
	apiVersion: "v1"
	kind:       "Pod"
	metadata: {
		namespace: "pod-security-policy-psp-namespace"
	}
	spec: containers: [{
		name:  "pause"
		image: "k8s.gcr.io/pause"
	}]
}
k: Pod: "pause-privileged": {
	apiVersion: "v1"
	kind:       "Pod"
	metadata: {
		namespace: "pod-security-policy-psp-namespace"
	}
	spec: containers: [{
		name:  "pause"
		image: "k8s.gcr.io/pause"
		securityContext: privileged: true
	}]
}
