package kube

k: Service: "service-external-name-service": {
	spec: {
		type:         "ExternalName"
		externalName: "my.database.example.com"
	}
}
