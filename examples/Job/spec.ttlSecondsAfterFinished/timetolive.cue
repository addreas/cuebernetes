package kube

k: Job: "jobs-timetolive-job": {
	spec: {
		ttlSecondsAfterFinished: 100
		template: spec: {
			containers: [{
				command: ["perl", "-Mbignum=bpi", "-wle", "print bpi(2000)"]
				image: "perl"
				name:  "jobs-timetolive-container"
			}]
			restartPolicy: "Never"
		}
	}
}
