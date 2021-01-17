package kube

k: Job: "jobs-simple-job": {
	spec: template: spec: {
		restartPolicy: "Never"
		containers: [{
			command: ["perl", "-Mbignum=bpi", "-wle", "print bpi(2000)"]
			image: "perl"
			name:  "jobs-simple-container"
		}]
	}
}
