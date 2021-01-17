package kube

import (
	apps_v1 "k8s.io/api/apps/v1"
	batch_v1 "k8s.io/api/batch/v1"
	batch_v2alpha1 "k8s.io/api/batch/v2alpha1"
	core_v1 "k8s.io/api/core/v1"
	discovery_v1beta1 "k8s.io/api/discovery/v1beta1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	networking_v1 "k8s.io/api/networking/v1"
	policy_v1beta1 "k8s.io/api/policy/v1beta1"
	rbac_v1 "k8s.io/api/rbac/v1"
	storage_v1 "k8s.io/api/storage/v1"
)

k: close({
	for ApiVersion, kinds in _kubernetesAPIs {
		for Kind, Type in kinds {
			"\(Kind)": [Name=string]: Type & {
				apiVersion: ApiVersion
				kind:       Kind
				metadata: metav1.#ObjectMeta & {
					name: Name
				}
			}
		}
	}
})

_kubernetesAPIs: {
	"v1": {
		Namespace:             core_v1.#Namespace
		ConfigMap:             core_v1.#ConfigMap
		Endpoints:             core_v1.#Endpoints
		Secret:                core_v1.#Secret
		Service:               core_v1.#Service
		ServiceAccount:        core_v1.#ServiceAccount
		Pod:                   core_v1.#Pod
		PersistentVolume:      core_v1.#PersistentVolume
		PersistentVolumeClaim: core_v1.#PersistentVolumeClaim
		LimitRange:            core_v1.#LimitRange
		ResourceQuota:         core_v1.#ResourceQuota
	}

	"apps/v1": {
		DaemonSet:   apps_v1.#DaemonSet
		Deployment:  apps_v1.#Deployment
		StatefulSet: apps_v1.#StatefulSet
	}

	"batch/v2alpha1": {
		Job:     batch_v1.#Job
		CronJob: batch_v2alpha1.#CronJob
	}

	"discovery.k8s.io/v1beta1": EndpointSlice: discovery_v1beta1.#EndpointSlice

	"networking.k8s.io/v1": {
		Ingress:       networking_v1.#Ingress
		IngressClass:  networking_v1.#IngressClass
		NetworkPolicy: networking_v1.#NetworkPolicy
	}

	"policy/v1beta1": {
		PodDisruptionBudget: policy_v1beta1.#PodDisruptionBudget
		PodSecurityPolicy:   policy_v1beta1.#PodSecurityPolicy
	}

	"rbac.authorization.k8s.io/v1": {
		Role:               rbac_v1.#Role
		RoleBinding:        rbac_v1.#RoleBinding
		ClusterRole:        rbac_v1.#ClusterRole
		ClusterRoleBinding: rbac_v1.#ClusterRoleBinding
	}

	"storage.k8s.io/v1": StorageClass: storage_v1.#StorageClass
}
