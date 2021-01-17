package kube

k: DaemonSet: "fluentd-elasticsearch": {
	spec: {
		selector: matchLabels: name: "fluentd-elasticsearch"
		template: {
			metadata: labels: name: "fluentd-elasticsearch"
			spec: {
				tolerations: [{
					// this toleration is to have the daemonset runnable on master nodes
					// remove it if your masters can't run pods
					effect: "NoSchedule"
					key:    "node-role.kubernetes.io/master"
				}]
				containers: [{
					image: "quay.io/fluentd_elasticsearch/fluentd:v2.5.2"
					name:  "fluentd-elasticsearch"
				}]
				terminationGracePeriodSeconds: 30
			}
		}
	}
}
