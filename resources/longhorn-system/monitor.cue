package kube

k: ServiceMonitor: "longhorn-prometheus-servicemonitor": {
	_selector: "app": "longhorn-manager"
	spec: endpoints: [{
		port: "manager"
	}]
}

k: PrometheusRule: "prometheus-longhorn-rules": {
	metadata: {
		labels: {
			prometheus: "longhorn"
			role:       "alert-rules"
		}
	}
	spec: groups: [{
		name: "longhorn.rules"
		rules: [{
			alert: "LonghornVolumeUsageCritical"
			annotations: {
				description: "Longhorn volume {{$labels.volume}} on {{$labels.node}} is at {{$value}}% used for more than 5 minutes."

				summary: "Longhorn volume capacity is over 90% used."
			}
			expr: "100 * (longhorn_volume_usage_bytes / longhorn_volume_capacity_bytes) > 90"
			for:  "5m"
			labels: {
				issue:    "Longhorn volume {{$labels.volume}} usage on {{$labels.node}} is critical."
				severity: "critical"
			}
		}, {
			alert: "LonghornVolumeActualSpaceUsedWarning"
			annotations: {
				description: "The actual space used by Longhorn volume {{$labels.volume}} on {{$labels.node}} is at {{$value}}% capacity for more than 5 minutes."

				summary: "The actual used space of Longhorn volume is over 90% of the capacity."
			}
			expr: "(longhorn_volume_actual_size_bytes / longhorn_volume_capacity_bytes) * 100 > 90"
			for:  "5m"
			labels: {
				issue:    "The actual used space of Longhorn volume {{$labels.volume}} on {{$labels.node}} is high."
				severity: "warning"
			}
		}, {
			alert: "LonghornVolumeStatusCritical"
			annotations: {
				description: "Longhorn volume {{$labels.volume}} on {{$labels.node}} is Fault for more than 2 minutes."

				summary: "Longhorn volume {{$labels.volume}} is Fault"
			}
			expr: "longhorn_volume_robustness == 3"
			for:  "5m"
			labels: {
				issue:    "Longhorn volume {{$labels.volume}} is Fault."
				severity: "critical"
			}
		}, {
			alert: "LonghornVolumeStatusWarning"
			annotations: {
				description: "Longhorn volume {{$labels.volume}} on {{$labels.node}} is Degraded for more than 5 minutes."

				summary: "Longhorn volume {{$labels.volume}} is Degraded"
			}
			expr: "longhorn_volume_robustness == 2"
			for:  "5m"
			labels: {
				issue:    "Longhorn volume {{$labels.volume}} is Degraded."
				severity: "warning"
			}
		}, {
			alert: "LonghornNodeStorageWarning"
			annotations: {
				description: "The used storage of node {{$labels.node}} is at {{$value}}% capacity for more than 5 minutes."

				summary: "The used storage of node is over 70% of the capacity."
			}
			expr: "(longhorn_node_storage_usage_bytes / longhorn_node_storage_capacity_bytes) * 100 > 70"
			for:  "5m"
			labels: {
				issue:    "The used storage of node {{$labels.node}} is high."
				severity: "warning"
			}
		}, {
			alert: "LonghornDiskStorageWarning"
			annotations: {
				description: "The used storage of disk {{$labels.disk}} on node {{$labels.node}} is at {{$value}}% capacity for more than 5 minutes."

				summary: "The used storage of disk is over 70% of the capacity."
			}
			expr: "(longhorn_disk_usage_bytes / longhorn_disk_capacity_bytes) * 100 > 70"
			for:  "5m"
			labels: {
				issue:    "The used storage of disk {{$labels.disk}} on node {{$labels.node}} is high."
				severity: "warning"
			}
		}, {
			alert: "LonghornNodeDown"
			annotations: {
				description: "There are {{$value}} Longhorn nodes which have been offline for more than 5 minutes."
				summary:     "Longhorn nodes is offline"
			}
			expr: "longhorn_node_total - (count(longhorn_node_status{condition=\"ready\"}==1) OR on() vector(0))"
			for:  "5m"
			labels: {
				issue:    "There are {{$value}} Longhorn nodes are offline"
				severity: "critical"
			}
		}, {
			alert: "LonghornIntanceManagerCPUUsageWarning"
			annotations: {
				description: "Longhorn instance manager {{$labels.instance_manager}} on {{$labels.node}} has CPU Usage / CPU request is {{$value}}% for more than 5 minutes."

				summary: "Longhorn instance manager {{$labels.instance_manager}} on {{$labels.node}} has CPU Usage / CPU request is over 300%."
			}
			expr: "(longhorn_instance_manager_cpu_usage_millicpu/longhorn_instance_manager_cpu_requests_millicpu) * 100 > 300"
			for:  "5m"
			labels: {
				issue:    "Longhorn instance manager {{$labels.instance_manager}} on {{$labels.node}} consumes 3 times the CPU request."
				severity: "warning"
			}
		}, {
			alert: "LonghornNodeCPUUsageWarning"
			annotations: {
				description: "Longhorn node {{$labels.node}} has CPU Usage / CPU capacity is {{$value}}% for more than 5 minutes."

				summary: "Longhorn node {{$labels.node}} experiences high CPU pressure for more than 5m."
			}
			expr: "(longhorn_node_cpu_usage_millicpu / longhorn_node_cpu_capacity_millicpu) * 100 > 90"
			for:  "5m"
			labels: {
				issue:    "Longhorn node {{$labels.node}} experiences high CPU pressure."
				severity: "warning"
			}
		}]
	}]
}

k: RoleBinding: "prometheus-k8s": {
	roleRef: {
		apiGroup: "rbac.authorization.k8s.io"
		kind:     "Role"
		name:     "prometheus-k8s"
	}
	subjects: [{
		kind:      "ServiceAccount"
		name:      "prometheus-k8s"
		namespace: "monitoring"
	}]
}

k: Role: "prometheus-k8s": rules: [{
	apiGroups: [
		"",
	]
	resources: [
		"services",
		"endpoints",
		"pods",
	]
	verbs: [
		"get",
		"list",
		"watch",
	]
}, {
	apiGroups: [
		"extensions",
	]
	resources: [
		"ingresses",
	]
	verbs: [
		"get",
		"list",
		"watch",
	]
}]
