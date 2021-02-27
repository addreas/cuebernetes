// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// EndpointChangeRequest Structure which contains the mutable elements of an Endpoint.
//
//
// swagger:model EndpointChangeRequest
#EndpointChangeRequest: {
	// addressing
	addressing?: null | #AddressPair @go(Addressing,*AddressPair)

	// ID assigned by container runtime
	"container-id"?: string @go(ContainerID)

	// Name assigned to container
	"container-name"?: string @go(ContainerName)

	// datapath configuration
	"datapath-configuration"?: null | #EndpointDatapathConfiguration @go(DatapathConfiguration,*EndpointDatapathConfiguration)

	// ID of datapath tail call map
	"datapath-map-id"?: int64 @go(DatapathMapID)

	// Docker endpoint ID
	"docker-endpoint-id"?: string @go(DockerEndpointID)

	// Docker network ID
	"docker-network-id"?: string @go(DockerNetworkID)

	// MAC address
	"host-mac"?: string @go(HostMac)

	// Local endpoint ID
	id?: int64 @go(ID)

	// Index of network device
	"interface-index"?: int64 @go(InterfaceIndex)

	// Name of network device
	"interface-name"?: string @go(InterfaceName)

	// Kubernetes namespace name
	"k8s-namespace"?: string @go(K8sNamespace)

	// Kubernetes pod name
	"k8s-pod-name"?: string @go(K8sPodName)

	// Labels describing the identity
	labels?: #Labels @go(Labels)

	// MAC address
	mac?: string @go(Mac)

	// Process ID of the workload belonging to this endpoint
	pid?: int64 @go(Pid)

	// Whether policy enforcement is enabled or not
	"policy-enabled"?: bool @go(PolicyEnabled)

	// Current state of endpoint
	// Required: true
	state: #EndpointState @go(State)

	// Whether to build an endpoint synchronously
	//
	"sync-build-endpoint"?: bool @go(SyncBuildEndpoint)
}