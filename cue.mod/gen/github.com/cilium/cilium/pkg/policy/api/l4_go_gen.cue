// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/pkg/policy/api

package api

import "github.com/cilium/cilium/pkg/policy/api/kafka"

// L4Proto is a layer 4 protocol name
#L4Proto: string // #enumL4Proto

#enumL4Proto:
	#ProtoTCP |
	#ProtoUDP |
	#ProtoAny

#ProtoTCP:        #L4Proto & "TCP"
#ProtoUDP:        #L4Proto & "UDP"
#ProtoAny:        #L4Proto & "ANY"
#PortProtocolAny: "0/ANY"

// PortProtocol specifies an L4 port with an optional transport protocol
#PortProtocol: {
	// Port is an L4 port number. For now the string will be strictly
	// parsed as a single uint16. In the future, this field may support
	// ranges in the form "1024-2048
	// Port can also be a port name, which must contain at least one [a-z],
	// and may also contain [0-9] and '-' anywhere except adjacent to another
	// '-' or in the beginning or the end.
	//
	// +kubebuilder:validation:Pattern=`^(6553[0-5]|655[0-2][0-9]|65[0-4][0-9]{2}|6[0-4][0-9]{3}|[1-5][0-9]{4}|[0-9]{1,4})|([a-zA-Z0-9]-?)*[a-zA-Z](-?[a-zA-Z0-9])*$`
	port: string @go(Port)

	// Protocol is the L4 protocol. If omitted or empty, any protocol
	// matches. Accepted values: "TCP", "UDP", ""/"ANY"
	//
	// Matching on ICMP is not supported.
	//
	// Named port specified for a container may narrow this down, but may not
	// contradict this.
	//
	// +kubebuilder:validation:Enum=TCP;UDP;ANY
	// +kubebuilder:validation:Optional
	protocol?: #L4Proto @go(Protocol)
}

// Secret is a reference to a secret, backed by k8s or local file system.
#Secret: {
	// Namespace is the namespace in which the secret exists. Context of use
	// determines the default value if left out (e.g., "default").
	//
	// +kubebuilder:validation:Optional
	namespace?: string @go(Namespace)

	// Name is the name of the secret.
	//
	// +kubebuilder:validation:Required
	name: string @go(Name)
}

// TLSContext provides TLS configuration via reference to either k8s secrets
// or via filepath. If both are set, directory is given priority over
// k8sSecrets.
#TLSContext: {
	// Secret is the secret that contains the certificates and private key for
	// the TLS context.
	// By default, Cilium will search in this secret for the following items:
	//  - 'ca.crt'  - Which represents the trusted CA to verify remote source.
	//  - 'tls.crt' - Which represents the public key certificate.
	//  - 'tls.key' - Which represents the private key matching the public key
	//                certificate.
	//
	// +kubebuilder:validation:Required
	secret?: null | #Secret @go(Secret,*Secret)

	// TrustedCA is the file name or k8s secret item name for the trusted CA.
	// If omitted, 'ca.crt' is assumed, if it exists. If given, the item must
	// exist.
	//
	// +kubebuilder:validation:Optional
	trustedCA?: string @go(TrustedCA)

	// Certificate is the file name or k8s secret item name for the certificate
	// chain. If omitted, 'tls.crt' is assumed, if it exists. If given, the
	// item must exist.
	//
	// +kubebuilder:validation:Optional
	certificate?: string @go(Certificate)

	// PrivateKey is the file name or k8s secret item name for the private key
	// matching the certificate chain. If omitted, 'tls.key' is assumed, if it
	// exists. If given, the item must exist.
	//
	// +kubebuilder:validation:Optional
	privateKey?: string @go(PrivateKey)
}

// PortRule is a list of ports/protocol combinations with optional Layer 7
// rules which must be met.
#PortRule: {
	// Ports is a list of L4 port/protocol
	//
	// +kubebuilder:validation:Optional
	ports?: [...#PortProtocol] @go(Ports,[]PortProtocol)

	// TerminatingTLS is the TLS context for the connection terminated by
	// the L7 proxy.  For egress policy this specifies the server-side TLS
	// parameters to be applied on the connections originated from the local
	// endpoint and terminated by the L7 proxy. For ingress policy this specifies
	// the server-side TLS parameters to be applied on the connections
	// originated from a remote source and terminated by the L7 proxy.
	//
	// +kubebuilder:validation:Optional
	terminatingTLS?: null | #TLSContext @go(TerminatingTLS,*TLSContext)

	// OriginatingTLS is the TLS context for the connections originated by
	// the L7 proxy.  For egress policy this specifies the client-side TLS
	// parameters for the upstream connection originating from the L7 proxy
	// to the remote destination. For ingress policy this specifies the
	// client-side TLS parameters for the connection from the L7 proxy to
	// the local endpoint.
	//
	// +kubebuilder:validation:Optional
	originatingTLS?: null | #TLSContext @go(OriginatingTLS,*TLSContext)

	// Rules is a list of additional port level rules which must be met in
	// order for the PortRule to allow the traffic. If omitted or empty,
	// no layer 7 rules are enforced.
	//
	// +kubebuilder:validation:Optional
	rules?: null | #L7Rules @go(Rules,*L7Rules)
}

// PortDenyRule is a list of ports/protocol that should be used for deny
// policies. This structure lacks the L7Rules since it's not supported in deny
// policies.
#PortDenyRule: {
	// Ports is a list of L4 port/protocol
	//
	// +kubebuilder:validation:Optional
	ports?: [...#PortProtocol] @go(Ports,[]PortProtocol)
}

// L7Rules is a union of port level rule types. Mixing of different port
// level rule types is disallowed, so exactly one of the following must be set.
// If none are specified, then no additional port level rules are applied.
#L7Rules: {
	// HTTP specific rules.
	//
	// +kubebuilder:validation:Optional
	http?: [...#PortRuleHTTP] @go(HTTP,[]PortRuleHTTP)

	// Kafka-specific rules.
	//
	// +kubebuilder:validation:Optional
	"kafka"?: [...kafka.#PortRule] @go(Kafka,[]kafka.PortRule)

	// DNS-specific rules.
	//
	// +kubebuilder:validation:Optional
	dns?: [...#PortRuleDNS] @go(DNS,[]PortRuleDNS)

	// Name of the L7 protocol for which the Key-value pair rules apply.
	//
	// +kubebuilder:validation:Optional
	l7proto?: string @go(L7Proto)

	// Key-value pair rules.
	//
	// +kubebuilder:validation:Optional
	l7?: [...#PortRuleL7] @go(L7,[]PortRuleL7)
}

// PortRules is a slice of PortRule.
#PortRules: [...#PortRule]

// PortDenyRules is a slice of PortDenyRule.
#PortDenyRules: [...#PortDenyRule]

// Ports is an interface that should be used by all implementations of the
// PortProtocols.
#Ports: _

// PortsIterator is an interface that should be implemented by structures that
// can iterate over a list of Ports interfaces.
#PortsIterator: _