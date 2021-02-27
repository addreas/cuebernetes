// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// ServiceSpec Configuration of a service
//
// swagger:model ServiceSpec
#ServiceSpec: {
	// List of backend addresses
	"backend-addresses": [...null | #BackendAddress] @go(BackendAddresses,[]*BackendAddress)

	// flags
	flags?: null | #ServiceSpecFlags @go(Flags,*ServiceSpecFlags)

	// Frontend address
	// Required: true
	"frontend-address"?: null | #FrontendAddress @go(FrontendAddress,*FrontendAddress)

	// Unique identification
	id?: int64 @go(ID)
}

// ServiceSpecFlags Optional service configuration flags
//
// swagger:model ServiceSpecFlags
#ServiceSpecFlags: {
	// Service health check node port
	healthCheckNodePort?: uint16 @go(HealthCheckNodePort)

	// Service name  (e.g. Kubernetes service name)
	name?: string @go(Name)

	// Service namespace  (e.g. Kubernetes namespace)
	namespace?: string @go(Namespace)

	// Service traffic policy
	// Enum: [Cluster Local]
	trafficPolicy?: string @go(TrafficPolicy)

	// Service type
	// Enum: [ClusterIP NodePort ExternalIPs HostPort LoadBalancer LocalRedirect]
	type?: string @go(Type)
}

// ServiceSpecFlagsTrafficPolicyCluster captures enum value "Cluster"
#ServiceSpecFlagsTrafficPolicyCluster: "Cluster"

// ServiceSpecFlagsTrafficPolicyLocal captures enum value "Local"
#ServiceSpecFlagsTrafficPolicyLocal: "Local"

// ServiceSpecFlagsTypeClusterIP captures enum value "ClusterIP"
#ServiceSpecFlagsTypeClusterIP: "ClusterIP"

// ServiceSpecFlagsTypeNodePort captures enum value "NodePort"
#ServiceSpecFlagsTypeNodePort: "NodePort"

// ServiceSpecFlagsTypeExternalIPs captures enum value "ExternalIPs"
#ServiceSpecFlagsTypeExternalIPs: "ExternalIPs"

// ServiceSpecFlagsTypeHostPort captures enum value "HostPort"
#ServiceSpecFlagsTypeHostPort: "HostPort"

// ServiceSpecFlagsTypeLoadBalancer captures enum value "LoadBalancer"
#ServiceSpecFlagsTypeLoadBalancer: "LoadBalancer"

// ServiceSpecFlagsTypeLocalRedirect captures enum value "LocalRedirect"
#ServiceSpecFlagsTypeLocalRedirect: "LocalRedirect"
