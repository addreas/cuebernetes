package kube

k: CronJob: "cronjob-simple": {
	spec: {
		schedule: "*/1 * * * *"
		jobTemplate: spec: template: spec: {
			containers: [{
				args: [
					"/bin/sh",
					"-c",
					"date; echo Hello from the Kubernetes cluster cronjob",
				]
				image: "busybox"
				name:  "cronjob-simple-container"
			}]
			restartPolicy: "OnFailure"
		}
	}
}