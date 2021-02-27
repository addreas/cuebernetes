// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// AddressPair Addressing information of an endpoint
//
// swagger:model AddressPair
#AddressPair: {
	// IPv4 address
	ipv4?: string @go(IPV4)

	// UUID of IPv4 expiration timer
	"ipv4-expiration-uuid"?: string @go(IPV4ExpirationUUID)

	// IPv6 address
	ipv6?: string @go(IPV6)

	// UUID of IPv6 expiration timer
	"ipv6-expiration-uuid"?: string @go(IPV6ExpirationUUID)
}