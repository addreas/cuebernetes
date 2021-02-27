// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// TraceTo trace to
//
// swagger:model TraceTo
#TraceTo: {
	// List of Layer 4 port and protocol pairs which will be used in communication
	// from the source identity to the destination identity.
	//
	dports: [...null | #Port] @go(Dports,[]*Port)

	// labels
	labels?: #Labels @go(Labels)
}