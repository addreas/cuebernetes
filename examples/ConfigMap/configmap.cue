package kube

k: Pod: "volumes-configmap-pod": {
	spec: {
		containers: [{
			command: [
				"sleep",
				"3600",
			]
			image: "busybox"
			name:  "volumes-configmap-pod-container"
			volumeMounts: [{
				name:      "volumes-configmap-volume"
				mountPath: "/etc/config"
			}]
		}]
		volumes: [{
			name: "volumes-configmap-volume"
			configMap: {
				name: "volumes-configmap-configmap"
				items: [{
					key:  "game.properties"
					path: "configmap-volume-path"
				}]
			}
		}]
	}
}
k: ConfigMap: "volumes-configmap-configmap": {
	data: {
		"game.properties": """
			enemies=aliens
			lives=3
			enemies.cheat=true
			enemies.cheat.level=noGoodRotten

			"""

		"ui.properties": """
			color.good=purple
			color.bad=yellow

			"""
	}
}
