// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/pkg/k8s/apis/cilium.io/v2

package v2

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"github.com/cilium/cilium/api/v1/models"
	"github.com/cilium/cilium/pkg/node/addressing"
	eniTypes "github.com/cilium/cilium/pkg/aws/eni/types"
	azureTypes "github.com/cilium/cilium/pkg/azure/types"
	ipamTypes "github.com/cilium/cilium/pkg/ipam/types"
)

// CiliumEndpoint is the status of a Cilium policy rule.
#CiliumEndpoint: {
	metav1.#TypeMeta

	// +deepequal-gen=false
	metadata: metav1.#ObjectMeta @go(ObjectMeta)

	// +kubebuilder:validation:Optional
	status: #EndpointStatus @go(Status)
}

// EndpointStatus is the status of a Cilium endpoint.
#EndpointStatus: {
	// ID is the cilium-agent-local ID of the endpoint.
	id?: int64 @go(ID)

	// Controllers is the list of failing controllers for this endpoint.
	controllers?: #ControllerList @go(Controllers)

	// ExternalIdentifiers is a set of identifiers to identify the endpoint
	// apart from the pod name. This includes container runtime IDs.
	"external-identifiers"?: null | models.#EndpointIdentifiers @go(ExternalIdentifiers,*models.EndpointIdentifiers)

	// Health is the overall endpoint & subcomponent health.
	health?: null | models.#EndpointHealth @go(Health,*models.EndpointHealth)

	// Identity is the security identity associated with the endpoint
	identity?: null | #EndpointIdentity @go(Identity,*EndpointIdentity)

	// Log is the list of the last few warning and error log entries
	log?: [...null | models.#EndpointStatusChange] @go(Log,[]*models.EndpointStatusChange)

	// Networking is the networking properties of the endpoint.
	//
	// +kubebuilder:validation:Optional
	networking?: null | #EndpointNetworking @go(Networking,*EndpointNetworking)

	// Encryption is the encryption configuration of the node
	//
	// +kubebuilder:validation:Optional
	encryption?:                 #EncryptionSpec        @go(Encryption)
	policy?:                     null | #EndpointPolicy @go(Policy,*EndpointPolicy)
	"visibility-policy-status"?: null | string          @go(VisibilityPolicyStatus,*string)

	// State is the state of the endpoint.
	//
	// +kubebuilder:validation:Enum=creating;waiting-for-identity;not-ready;waiting-to-regenerate;regenerating;restoring;ready;disconnecting;disconnected;invalid
	state?:         string             @go(State)
	"named-ports"?: models.#NamedPorts @go(NamedPorts)
}

#EndpointStatusLogEntries: 5

// ControllerList is a list of ControllerStatus.
#ControllerList: [...#ControllerStatus]

// ControllerStatus is the status of a failing controller.
#ControllerStatus: {
	// Name is the name of the controller
	name?: string @go(Name)

	// Configuration is the controller configuration
	configuration?: null | models.#ControllerStatusConfiguration @go(Configuration,*models.ControllerStatusConfiguration)

	// Status is the status of the controller
	status?: #ControllerStatusStatus @go(Status)

	// UUID is the UUID of the controller
	uuid?: string @go(UUID)
}

// ControllerStatusStatus is the detailed status section of a controller.
#ControllerStatusStatus: {
	"consecutive-failure-count"?: int64  @go(ConsecutiveFailureCount)
	"failure-count"?:             int64  @go(FailureCount)
	"last-failure-msg"?:          string @go(LastFailureMsg)
	"last-failure-timestamp"?:    string @go(LastFailureTimestamp)
	"last-success-timestamp"?:    string @go(LastSuccessTimestamp)
	"success-count"?:             int64  @go(SuccessCount)
}

// EndpointPolicy represents the endpoint's policy by listing all allowed
// ingress and egress identities in combination with L4 port and protocol.
#EndpointPolicy: {
	ingress?: null | #EndpointPolicyDirection @go(Ingress,*EndpointPolicyDirection)
	egress?:  null | #EndpointPolicyDirection @go(Egress,*EndpointPolicyDirection)
}

// EndpointPolicyDirection is the list of allowed identities per direction.
#EndpointPolicyDirection: {
	enforcing: bool                 @go(Enforcing)
	allowed?:  #AllowedIdentityList @go(Allowed)
	denied?:   #DenyIdentityList    @go(Denied)

	// Deprecated
	removing?: #AllowedIdentityList @go(Removing)

	// Deprecated
	adding?: #AllowedIdentityList @go(Adding)
}

// IdentityTuple specifies a peer by identity, destination port and protocol.
#IdentityTuple: {
	identity?: uint64 @go(Identity)
	"identity-labels"?: {[string]: string} @go(IdentityLabels,map[string]string)
	"dest-port"?: uint16 @go(DestPort)
	protocol?:    uint8  @go(Protocol)
}

// IdentityList is a list of IdentityTuple.
#IdentityList: [...#IdentityTuple]

// AllowedIdentityList is a list of IdentityTuples that species peers that are
// allowed.
#AllowedIdentityList: #IdentityList

// DenyIdentityList is a list of IdentityTuples that species peers that are
// denied.
#DenyIdentityList: #IdentityList

// EndpointIdentity is the identity information of an endpoint.
#EndpointIdentity: {
	// ID is the numeric identity of the endpoint
	id?: int64 @go(ID)

	// Labels is the list of labels associated with the identity
	labels?: [...string] @go(Labels,[]string)
}

// CiliumIdentity is a CRD that represents an identity managed by Cilium.
// It is intended as a backing store for identity allocation, acting as the
// global coordination backend, and can be used in place of a KVStore (such as
// etcd).
// The name of the CRD is the numeric identity and the labels on the CRD object
// are the the kubernetes sourced labels seen by cilium. This is currently the
// only label source possible when running under kubernetes. Non-kubernetes
// labels are filtered but all labels, from all sources, are places in the
// SecurityLabels field. These also include the source and are used to define
// the identity.
// The labels under metav1.ObjectMeta can be used when searching for
// CiliumIdentity instances that include particular labels. This can be done
// with invocations such as:
//   kubectl get ciliumid -l 'foo=bar'
// Each node using a ciliumidentity updates the status field with it's name and
// a timestamp when it first allocates or uses an identity, and periodically
// after that. It deletes its entry when no longer using this identity.
// cilium-operator uses the list of nodes in status to reference count
// users of this identity, and to expire stale usage.
#CiliumIdentity: {
	metav1.#TypeMeta

	// +deepequal-gen=false
	metadata: metav1.#ObjectMeta @go(ObjectMeta)

	// SecurityLabels is the source-of-truth set of labels for this identity.
	"security-labels": {[string]: string} @go(SecurityLabels,map[string]string)
}

// CiliumIdentityList is a list of CiliumIdentity objects.
#CiliumIdentityList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)

	// Items is a list of CiliumIdentity
	items: [...#CiliumIdentity] @go(Items,[]CiliumIdentity)
}

// AddressPair is is a par of IPv4 and/or IPv6 address.
#AddressPair: {
	ipv4?: string @go(IPV4)
	ipv6?: string @go(IPV6)
}

// AddressPairList is a list of address pairs.
#AddressPairList: [...null | #AddressPair]

// EndpointNetworking is the addressing information of an endpoint.
#EndpointNetworking: {
	// IP4/6 addresses assigned to this Endpoint
	addressing: #AddressPairList @go(Addressing)

	// NodeIP is the IP of the node the endpoint is running on. The IP must
	// be reachable between nodes.
	node?: string @go(NodeIP)
}

// CiliumEndpointList is a list of CiliumEndpoint objects.
#CiliumEndpointList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)

	// Items is a list of CiliumEndpoint
	items: [...#CiliumEndpoint] @go(Items,[]CiliumEndpoint)
}

// CiliumNode represents a node managed by Cilium. It contains a specification
// to control various node specific configuration aspects and a status section
// to represent the status of the node.
#CiliumNode: {
	metav1.#TypeMeta

	// +deepequal-gen=false
	metadata: metav1.#ObjectMeta @go(ObjectMeta)

	// Spec defines the desired specification/configuration of the node.
	spec: #NodeSpec @go(Spec)

	// Status defines the realized specification/configuration and status
	// of the node.
	//
	// +kubebuilder:validation:Optional
	status?: #NodeStatus @go(Status)
}

// NodeAddress is a node address.
#NodeAddress: {
	// Type is the type of the node address
	type?: addressing.#AddressType @go(Type)

	// IP is an IP of a node
	ip?: string @go(IP)
}

// NodeSpec is the configuration specific to a node.
#NodeSpec: {
	// InstanceID is the identifier of the node. This is different from the
	// node name which is typically the FQDN of the node. The InstanceID
	// typically refers to the identifier used by the cloud provider or
	// some other means of identification.
	"instance-id"?: string @go(InstanceID)

	// Addresses is the list of all node addresses.
	//
	// +kubebuilder:validation:Optional
	addresses?: [...#NodeAddress] @go(Addresses,[]NodeAddress)

	// HealthAddressing is the addressing information for health connectivity
	// checking.
	//
	// +kubebuilder:validation:Optional
	health?: #HealthAddressingSpec @go(HealthAddressing)

	// Encryption is the encryption configuration of the node.
	//
	// +kubebuilder:validation:Optional
	encryption?: #EncryptionSpec @go(Encryption)

	// ENI is the AWS ENI specific configuration.
	//
	// +kubebuilder:validation:Optional
	eni?: eniTypes.#ENISpec @go(ENI)

	// Azure is the Azure IPAM specific configuration.
	//
	// +kubebuilder:validation:Optional
	azure?: azureTypes.#AzureSpec @go(Azure)

	// IPAM is the address management specification. This section can be
	// populated by a user or it can be automatically populated by an IPAM
	// operator.
	//
	// +kubebuilder:validation:Optional
	ipam?: ipamTypes.#IPAMSpec @go(IPAM)

	// NodeIdentity is the Cilium numeric identity allocated for the node, if any.
	//
	// +kubebuilder:validation:Optional
	nodeidentity?: uint64 @go(NodeIdentity)
}

// HealthAddressingSpec is the addressing information required to do
// connectivity health checking.
#HealthAddressingSpec: {
	// IPv4 is the IPv4 address of the IPv4 health endpoint.
	//
	// +kubebuilder:validation:Optional
	ipv4?: string @go(IPv4)

	// IPv6 is the IPv6 address of the IPv4 health endpoint.
	//
	// +kubebuilder:validation:Optional
	ipv6?: string @go(IPv6)
}

// EncryptionSpec defines the encryption relevant configuration of a node.
#EncryptionSpec: {
	// Key is the index to the key to use for encryption or 0 if encryption is
	// disabled.
	//
	// +kubebuilder:validation:Optional
	key?: int @go(Key)
}

// NodeStatus is the status of a node.
#NodeStatus: {
	// ENI is the AWS ENI specific status of the node.
	//
	// +kubebuilder:validation:Optional
	eni?: eniTypes.#ENIStatus @go(ENI)

	// Azure is the Azure specific status of the node.
	//
	// +kubebuilder:validation:Optional
	azure?: azureTypes.#AzureStatus @go(Azure)

	// IPAM is the IPAM status of the node.
	//
	// +kubebuilder:validation:Optional
	ipam?: ipamTypes.#IPAMStatus @go(IPAM)
}

// CiliumNodeList is a list of CiliumNode objects.
#CiliumNodeList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)

	// Items is a list of CiliumNode
	items: [...#CiliumNode] @go(Items,[]CiliumNode)
}