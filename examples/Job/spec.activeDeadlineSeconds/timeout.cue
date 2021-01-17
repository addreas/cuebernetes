package kube

k: Job: "jobs-timeout-job": {
	spec: {
		activeDeadlineSeconds: 100
		template: spec: {
			restartPolicy: "Never"
			containers: [{
				command: ["perl", "-Mbignum=bpi", "-wle", "print bpi(2000)"]
				image: "perl"
				name:  "jobs-timeout-container"
			}]
		}
	}
}
