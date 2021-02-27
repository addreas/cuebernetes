// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/bitnami-labs/sealed-secrets/pkg/apis/sealed-secrets/v1alpha1

package v1alpha1

// The StrictScope pins the sealed secret to a specific namespace and a specific name.
#StrictScope: #SealingScope & 0

// The NamespaceWideScope only pins a sealed secret to a specific namespace.
#NamespaceWideScope: #SealingScope & 1

// The ClusterWideScope allows the sealed secret to be unsealed in any namespace of the cluster.
#ClusterWideScope: #SealingScope & 2

// The DefaultScope is currently the StrictScope.
#DefaultScope: #SealingScope & 0

// SealedSecretExpansion has methods to work with SealedSecrets resources.
#SealedSecretExpansion: _

// SealingScope is an enum that declares the mobility of a sealed secret by defining
// in which scopes
#SealingScope: int // #enumSealingScope

#enumSealingScope:
	#StrictScope |
	#NamespaceWideScope |
	#ClusterWideScope |
	#DefaultScope
