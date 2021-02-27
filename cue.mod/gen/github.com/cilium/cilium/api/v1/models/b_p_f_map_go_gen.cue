// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/api/v1/models

package models

// BPFMap BPF map definition and content
//
// swagger:model BPFMap
#BPFMap: {
	// Contents of cache
	cache: [...null | #BPFMapEntry] @go(Cache,[]*BPFMapEntry)

	// Path to BPF map
	path?: string @go(Path)
}