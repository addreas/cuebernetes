package kube

import json656e63 "encoding/json"

k: NetworkAttachmentDefinition: "macvlan-conf": {
	spec: {
		config: json656e63.Marshal(_cue_config)
		let _cue_config = {
			cniVersion: "0.3.0"
			type:       "macvlan"
			master:     "eno1"
			mode:       "bridge"
			ipam: type: "dhcp"
		}
	}
}
