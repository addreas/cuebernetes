// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/fluxcd/helm-controller/api/v2beta1

package v2beta1

// ReleasedCondition represents the status of the last release attempt
// (install/upgrade/test) against the latest desired state.
#ReleasedCondition: "Released"

// TestSuccessCondition represents the status of the last test attempt against
// the latest desired state.
#TestSuccessCondition: "TestSuccess"

// RemediatedCondition represents the status of the last remediation attempt
// (uninstall/rollback) due to a failure of the last release attempt against the
// latest desired state.
#RemediatedCondition: "Remediated"

// InstallSucceededReason represents the fact that the Helm install for the
// HelmRelease succeeded.
#InstallSucceededReason: "InstallSucceeded"

// InstallFailedReason represents the fact that the Helm install for the
// HelmRelease failed.
#InstallFailedReason: "InstallFailed"

// UpgradeSucceededReason represents the fact that the Helm upgrade for the
// HelmRelease succeeded.
#UpgradeSucceededReason: "UpgradeSucceeded"

// UpgradeFailedReason represents the fact that the Helm upgrade for the
// HelmRelease failed.
#UpgradeFailedReason: "UpgradeFailed"

// TestSucceededReason represents the fact that the Helm tests for the
// HelmRelease succeeded.
#TestSucceededReason: "TestSucceeded"

// TestFailedReason represents the fact that the Helm tests for the HelmRelease
// failed.
#TestFailedReason: "TestFailed"

// RollbackSucceededReason represents the fact that the Helm rollback for the
// HelmRelease succeeded.
#RollbackSucceededReason: "RollbackSucceeded"

// RollbackFailedReason represents the fact that the Helm test for the
// HelmRelease failed.
#RollbackFailedReason: "RollbackFailed"

// UninstallSucceededReason represents the fact that the Helm uninstall for the
// HelmRelease succeeded.
#UninstallSucceededReason: "UninstallSucceeded"

// UninstallFailedReason represents the fact that the Helm uninstall for the
// HelmRelease failed.
#UninstallFailedReason: "UninstallFailed"

// ArtifactFailedReason represents the fact that the artifact download for the
// HelmRelease failed.
#ArtifactFailedReason: "ArtifactFailed"

// InitFailedReason represents the fact that the initialization of the Helm
// configuration failed.
#InitFailedReason: "InitFailed"

// GetLastReleaseFailedReason represents the fact that observing the last
// release failed.
#GetLastReleaseFailedReason: "GetLastReleaseFailed"