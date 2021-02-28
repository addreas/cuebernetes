package kube

context: *"nucles" | string

k: [string]: [string]: metadata: labels: "cue": "true"

k: StatefulSet: [Name=string]: spec: serviceName: Name

k: ["Deployment" | "StatefulSet"]: [string]: {
	_selector: _
	metadata: labels: _selector
	spec: {
		replicas: *1 | int
		selector: matchLabels: _selector
		template: {
			metadata: labels:                            _selector
			spec: containers: [...{ports: [...{protocol: *"TCP" | "UDP"}]}]
		}
	}
}

k: Service: [string]: {
	_selector: _
	metadata: labels: _selector
	spec: {
		selector: _selector
		ports: [...{protocol: *"TCP" | "UDP"}]
	}
}

k: ServiceMonitor: [string]: {
	_selector: _
	metadata: labels: _selector
	spec: selector: matchLabels: _selector
}


resources: {
	apiVersion: "v1"
	kind: "List"
	items: [ for resourceType in k for resource in resourceType {resource}]
}
