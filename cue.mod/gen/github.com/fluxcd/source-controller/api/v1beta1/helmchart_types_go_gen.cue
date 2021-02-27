// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/fluxcd/source-controller/api/v1beta1

package v1beta1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"github.com/fluxcd/pkg/apis/meta"
)

#HelmChartKind: "HelmChart"

// HelmChartSpec defines the desired state of a Helm chart.
#HelmChartSpec: {
	// The name or path the Helm chart is available at in the SourceRef.
	// +required
	chart: string @go(Chart)

	// The chart version semver expression, ignored for charts from GitRepository
	// and Bucket sources. Defaults to latest when omitted.
	// +kubebuilder:default:=*
	// +optional
	version?: string @go(Version)

	// The reference to the Source the chart is available at.
	// +required
	sourceRef: #LocalHelmChartSourceReference @go(SourceRef)

	// The interval at which to check the Source for updates.
	// +required
	interval: metav1.#Duration @go(Interval)

	// Alternative values file to use as the default chart values, expected to be a
	// relative path in the SourceRef. Ignored when omitted.
	// +optional
	valuesFile?: string @go(ValuesFile)

	// This flag tells the controller to suspend the reconciliation of this source.
	// +optional
	suspend?: bool @go(Suspend)
}

// LocalHelmChartSourceReference contains enough information to let you locate
// the typed referenced object at namespace level.
#LocalHelmChartSourceReference: {
	// APIVersion of the referent.
	// +optional
	apiVersion?: string @go(APIVersion)

	// Kind of the referent, valid values are ('HelmRepository', 'GitRepository',
	// 'Bucket').
	// +kubebuilder:validation:Enum=HelmRepository;GitRepository;Bucket
	// +required
	kind: string @go(Kind)

	// Name of the referent.
	// +required
	name: string @go(Name)
}

// HelmChartStatus defines the observed state of the HelmChart.
#HelmChartStatus: {
	// ObservedGeneration is the last observed generation.
	// +optional
	observedGeneration?: int64 @go(ObservedGeneration)

	// Conditions holds the conditions for the HelmChart.
	// +optional
	conditions?: [...metav1.#Condition] @go(Conditions,[]metav1.Condition)

	// URL is the download link for the last chart pulled.
	// +optional
	url?: string @go(URL)

	// Artifact represents the output of the last successful chart sync.
	// +optional
	artifact?: null | #Artifact @go(Artifact,*Artifact)

	meta.#ReconcileRequestStatus
}

// ChartPullFailedReason represents the fact that the pull of the Helm chart
// failed.
#ChartPullFailedReason: "ChartPullFailed"

// ChartPullSucceededReason represents the fact that the pull of the Helm chart
// succeeded.
#ChartPullSucceededReason: "ChartPullSucceeded"

// ChartPackageFailedReason represent the fact that the package of the Helm
// chart failed.
#ChartPackageFailedReason: "ChartPackageFailed"

// ChartPackageSucceededReason represents the fact that the package of the Helm
// chart succeeded.
#ChartPackageSucceededReason: "ChartPackageSucceeded"

// HelmChart is the Schema for the helmcharts API
#HelmChart: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #HelmChartSpec     @go(Spec)
	status?:   #HelmChartStatus   @go(Status)
}

// HelmChartList contains a list of HelmChart
#HelmChartList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#HelmChart] @go(Items,[]HelmChart)
}