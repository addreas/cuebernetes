// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// Policy Policy definition
//
// swagger:model Policy
#Policy: {
	// Policy definition as JSON.
	policy?: string @go(Policy)

	// Revision number of the policy. Incremented each time the policy is
	// changed in the agent's repository
	//
	revision?: int64 @go(Revision)
}