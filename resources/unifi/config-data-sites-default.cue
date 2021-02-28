package kube

import json656e63 "encoding/json"

k: ConfigMap: "config-data-sites-default": data: {
	"config.gateway.json": json656e63.Marshal(_cue_config_gateway_json)
	let _cue_config_gateway_json = {
		system: "static-host-mapping": "host-name": {
			"setup.ubnt.com": {
				alias: ["setup"]
				inet: ["192.168.1.1"]
			}
			"nucles.localdomain": {
				alias: ["nucles"]
				inet: ["192.168.1.10"]
			}
		}
	}
}
