package kube

import yaml656e63 "encoding/yaml"

k: Secret: "simple-secret-secret": {
	type: "Opaque"
	stringData: {
		"config.yaml": yaml656e63.Marshal(_cue_config_yaml)
		let _cue_config_yaml = {
			password: "apassword"
			username: "ausername"
		}
	}
}
k: Secret: "simple-secret-secret-2": {
	type: "Opaque"
	stringData: {
		"config.yaml": yaml656e63.Marshal(_cue_xconfig_yaml)
		let _cue_xconfig_yaml = {
			password: "apassword"
			username: "ausername"
		}
	}
}
k: Pod: "simple-secret-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "simple-secret-container"
			volumeMounts: [{
				name:      "simple-secret-volume"
				mountPath: "/etc/simple-secret"
			}, {
				name:      "simple-secret-volume"
				mountPath: "/etc/simple-secret2"
			}]
		}]
		volumes: [{
			name: "simple-secret-volume"
			secret: secretName: "simple-secret-secret"
		}]
	}
}
