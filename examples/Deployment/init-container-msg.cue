package kube

k: Deployment: "init-container-msg-deployment": {
	spec: {
		selector: matchLabels: app: "init-container-msg-app"
		template: {
			metadata: labels: app: "init-container-msg-app"
			spec: {
				initContainers: [{
					command: [
						"/bin/sh",
						"-c",
						"echo 'message from init' > /init-container-msg-mount-path/this",
					]
					image: "busybox"
					name:  "init-container-msg-container-init"
					volumeMounts: [{
						mountPath: "/init-container-msg-mount-path"
						name:      "init-container-msg-volume"
					}]
				}]
				containers: [{
					command: [
						"/bin/sh",
						"-c",
						"while true; do cat /init-container-msg-mount-path/this; sleep 5; done",
					]
					image: "busybox"
					name:  "init-container-msg-container-main"
					volumeMounts: [{
						mountPath: "/init-container-msg-mount-path"
						name:      "init-container-msg-volume"
					}]
				}]
				volumes: [{
					emptyDir: {}
					name: "init-container-msg-volume"
				}]
			}
		}
	}
}
