package kube

k: PodSecurityPolicy: "pod-security-policy-restricted-psp": {
	// This is an example of a restrictive policy that requires users to run as an
	// unprivileged user, blocks possible escalations to root, and requires use of
	// several security mechanisms.
	apiVersion: "policy/v1beta1"
	kind:       "PodSecurityPolicy"
	metadata: {
		name: "pod-security-policy-restricted-psp"
		annotations: {
			"seccomp.security.alpha.kubernetes.io/allowedProfileNames": "docker/default,runtime/default"
			"apparmor.security.beta.kubernetes.io/allowedProfileNames": "runtime/default"
			"seccomp.security.alpha.kubernetes.io/defaultProfileName":  "runtime/default"
			"apparmor.security.beta.kubernetes.io/defaultProfileName":  "runtime/default"
		}
	}
	spec: {
		allowedHostPaths: [{
			// This allows "/foo", "/foo/", "/foo/bar" etc., but
			// disallows "/fool", "/etc/foo" etc.
			// "/foo/../" is never valid.
			pathPrefix: "/foo"
			readOnly:   true
		}] // only allow read-only mounts
		allowPrivilegeEscalation: false
		// This is redundant with non-root + disallow privilege escalation,
		// but we can provide it for defense in depth.
		fsGroup: {
			rule: "MustRunAs"
			ranges: [{
				// Forbid adding the root group.
				min: 1
				max: 65535
			}]
		}
		hostIPC:                false
		hostNetwork:            false
		hostPID:                false
		privileged:             false
		readOnlyRootFilesystem: false
		// Required to prevent escalations to root.
		requiredDropCapabilities: [
			"ALL",
		]
		runAsUser: {
			// Require the container to run without root privileges.
			rule: "MustRunAsNonRoot"
		}
		seLinux: {
			// This policy assumes the nodes are using AppArmor rather than SELinux.
			rule: "RunAsAny"
		}
		supplementalGroups: {
			rule: "MustRunAs"
			ranges: [{
				// Forbid adding the root group.
				min: 1
				max: 65535
			}]
		}
		// Allow core volume types.
		volumes: [
			"configMap",
			"emptyDir",
			"projected",
			"secret",
			"downwardAPI",
			"persistentVolumeClaim",
		]
	}
}
