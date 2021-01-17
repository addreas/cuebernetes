package kube

k: PodSecurityPolicy: "pod-security-policy-privileged-psp": {
	// This is the least restrictive policy you can create, equivalent to not using
	// the pod security policy admission controller
	// https://kubernetes.io/docs/concepts/policy/pod-security-policy/#example-policies
	apiVersion: "policy/v1beta1"
	kind:       "PodSecurityPolicy"
	metadata: {
		name: "pod-security-policy-privileged-psp"
		annotations: "seccomp.security.alpha.kubernetes.io/allowedProfileNames": "*"
	}
	spec: {
		privileged:               true
		allowPrivilegeEscalation: true
		allowedCapabilities: [
			"*",
		]
		volumes: [
			"*",
		]
		hostNetwork: true
		hostPorts: [{
			min: 0
			max: 65535
		}]
		hostIPC: true
		hostPID: true
		runAsUser: rule: "RunAsAny"
		seLinux: rule: "RunAsAny"
		supplementalGroups: rule: "RunAsAny"
		fsGroup: rule: "RunAsAny"
	}
}
