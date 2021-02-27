// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/jetstack/cert-manager/pkg/apis/certmanager/v1

package v1

import "time"

// minimum permitted certificate duration by cert-manager
#MinimumCertificateDuration: time.#Duration & 3600000000000

// default certificate duration if Issuer.spec.duration is not set
#DefaultCertificateDuration: time.#Duration & 7776000000000000

// minimum certificate duration before certificate expiration
#MinimumRenewBefore: time.#Duration & 300000000000

// Default duration before certificate expiration if  Issuer.spec.renewBefore is not set
#DefaultRenewBefore: time.#Duration & 2592000000000000

// Default index key for the Secret reference for Token authentication
#DefaultVaultTokenAuthSecretKey: "token"

// Default mount path location for Kubernetes ServiceAccount authentication
// (/v1/auth/kubernetes). The endpoint will then be called at `/login`, so
// left as the default, `/v1/auth/kubernetes/login` will be called.
#DefaultVaultKubernetesAuthMountPath: "/v1/auth/kubernetes"
