package kube

import yaml656e63 "encoding/yaml"

k: Secret: "simple-secret-secret-key-ref-secret": {
	type: "Opaque"
	stringData: {
		"config.yaml": yaml656e63.Marshal(_cue_config_yaml)
		let _cue_config_yaml = {
			password: "apassword"
			username: "ausername"
		}
	}
}
k: Pod: "simple-secret-secret-key-ref-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "simple-secret-secret-key-ref-container"
			env: [{
				name: "simple-secret-secret-key-ref-env"
				valueFrom: secretKeyRef: {
					name: "simple-secret-secret-key-ref-secret"
					key:  "config.yaml"
				}
			}]
			// this volume mount is not required, but demonstrates that the secret can
			// be mounted both as an env var and as a file
			volumeMounts: [{
				name:      "simple-secret-secret-key-ref-volume"
				mountPath: "/etc/simple-secret"
			}]
		}]
		volumes: [{
			name: "simple-secret-secret-key-ref-volume"
			secret: secretName: "simple-secret-secret-key-ref-secret"
		}]
	}
}
