// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// EndpointPolicyEnabled Whether policy enforcement is enabled (ingress, egress, both or none)
//
// swagger:model EndpointPolicyEnabled
#EndpointPolicyEnabled: string // #enumEndpointPolicyEnabled

#enumEndpointPolicyEnabled:
	#EndpointPolicyEnabledNone |
	#EndpointPolicyEnabledIngress |
	#EndpointPolicyEnabledEgress |
	#EndpointPolicyEnabledBoth |
	#EndpointPolicyEnabledAuditIngress |
	#EndpointPolicyEnabledAuditEgress |
	#EndpointPolicyEnabledAuditBoth

// EndpointPolicyEnabledNone captures enum value "none"
#EndpointPolicyEnabledNone: #EndpointPolicyEnabled & "none"

// EndpointPolicyEnabledIngress captures enum value "ingress"
#EndpointPolicyEnabledIngress: #EndpointPolicyEnabled & "ingress"

// EndpointPolicyEnabledEgress captures enum value "egress"
#EndpointPolicyEnabledEgress: #EndpointPolicyEnabled & "egress"

// EndpointPolicyEnabledBoth captures enum value "both"
#EndpointPolicyEnabledBoth: #EndpointPolicyEnabled & "both"

// EndpointPolicyEnabledAuditIngress captures enum value "audit-ingress"
#EndpointPolicyEnabledAuditIngress: #EndpointPolicyEnabled & "audit-ingress"

// EndpointPolicyEnabledAuditEgress captures enum value "audit-egress"
#EndpointPolicyEnabledAuditEgress: #EndpointPolicyEnabled & "audit-egress"

// EndpointPolicyEnabledAuditBoth captures enum value "audit-both"
#EndpointPolicyEnabledAuditBoth: #EndpointPolicyEnabled & "audit-both"
