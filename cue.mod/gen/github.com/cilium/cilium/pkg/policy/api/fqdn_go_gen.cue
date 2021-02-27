// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/cilium/cilium/pkg/policy/api

package api

#FQDNSelector: {
	// MatchName matches literal DNS names. A trailing "." is automatically added
	// when missing.
	//
	// +kubebuilder:validation:Pattern=`^([-a-zA-Z0-9_]+[.]?)+$`
	matchName?: string @go(MatchName)

	// MatchPattern allows using wildcards to match DNS names. All wildcards are
	// case insensitive. The wildcards are:
	// - "*" matches 0 or more DNS valid characters, and may occur anywhere in
	// the pattern. As a special case a "*" as the leftmost character, without a
	// following "." matches all subdomains as well as the name to the right.
	// A trailing "." is automatically added when missing.
	//
	// Examples:
	// `*.cilium.io` matches subomains of cilium at that level
	//   www.cilium.io and blog.cilium.io match, cilium.io and google.com do not
	// `*cilium.io` matches cilium.io and all subdomains 1 level below
	//   www.cilium.io, blog.cilium.io and cilium.io match, google.com does not
	// sub*.cilium.io matches subdomains of cilium where the subdomain component
	// begins with "sub"
	//   sub.cilium.io and subdomain.cilium.io match, www.cilium.io,
	//   blog.cilium.io, cilium.io and google.com do not
	//
	// +kubebuilder:validation:Pattern=`^([-a-zA-Z0-9_*]+[.]?)+$`
	matchPattern?: string @go(MatchPattern)
}

// PortRuleDNS is a list of allowed DNS lookups.
#PortRuleDNS: #FQDNSelector

// FQDNSelectorSlice is a wrapper type for []FQDNSelector to make is simpler to
// bind methods.
#FQDNSelectorSlice: [...#FQDNSelector]