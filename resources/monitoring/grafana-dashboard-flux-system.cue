package kube

import json656e63 "encoding/json"

k: ConfigMap: "grafana-dashboard-flux-system": {
	metadata: {
		labels: grafana_dashboard: "flux-system"
		annotations: "github.com": "fluxcd/flux2/manifests/monitoring/grafana/dashboards"
	}
	data: {
		"gotk-cluster.json": json656e63.Marshal(_cue_gotk_cluster_json)
		let _cue_gotk_cluster_json = {
			annotations: list: [
				{
					builtIn:    1
					datasource: "-- Grafana --"
					enable:     true
					hide:       true
					iconColor:  "rgba(0, 211, 255, 1)"
					name:       "Annotations & Alerts"
					type:       "dashboard"
				},
			]
			editable:     true
			gnetId:       null
			graphTooltip: 0
			iteration:    1602679512025
			links: []
			panels: [
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							decimals: 0
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "red"
										value: 100
									},
								]
							}
							unit: "short"
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 0
						y: 0
					}
					id: 24
					options: {
						colorMode:   "value"
						graphMode:   "none"
						justifyMode: "auto"
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"last",
							]
							fields: ""
							values: false
						}
						textMode: "value"
					}
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "count(gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"True\",kind=~\"Kustomization|HelmRelease\"})\n-\nsum(gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"Deleted\",kind=~\"Kustomization|HelmRelease\"})"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Cluster Reconcilers"
					type:      "stat"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							decimals: 0
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "red"
										value: null
									},
								]
							}
							unit: "short"
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 6
						y: 0
					}
					id: 28
					options: {
						colorMode:   "value"
						graphMode:   "area"
						justifyMode: "auto"
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"last",
							]
							fields: ""
							values: false
						}
						textMode: "value"
					}
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "sum(gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"False\",kind=~\"Kustomization|HelmRelease\"})"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Failing Reconcilers"
					type:      "stat"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							decimals: 0
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "red"
										value: 100
									},
								]
							}
							unit: "short"
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 12
						y: 0
					}
					id: 29
					options: {
						colorMode:   "value"
						graphMode:   "none"
						justifyMode: "auto"
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"last",
							]
							fields: ""
							values: false
						}
						textMode: "value"
					}
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "count(gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"True\",kind=~\"GitRepository|HelmRepository|Bucket\"})\n-\nsum(gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"Deleted\",kind=~\"GitRepository|HelmRepository|Bucket\"})"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Kubernetes Manifests Sources"
					type:      "stat"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							decimals: 0
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "red"
										value: null
									},
								]
							}
							unit: "short"
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 18
						y: 0
					}
					id: 30
					options: {
						colorMode:   "value"
						graphMode:   "area"
						justifyMode: "auto"
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"last",
							]
							fields: ""
							values: false
						}
						textMode: "value"
					}
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "sum(gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"False\",kind=~\"GitRepository|HelmRepository|Bucket\"})"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Failing Sources"
					type:      "stat"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "green"
										value: null
									},
									{
										color: "#EAB839"
										value: 1
									},
									{
										color: "red"
										value: 61
									},
								]
							}
							unit: "s"
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 12
						x: 0
						y: 5
					}
					id: 8
					options: {
						displayMode: "gradient"
						orientation: "horizontal"
						reduceOptions: {
							calcs: [
								"mean",
							]
							fields: ""
							values: false
						}
						showUnfilled: true
					}
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "  sum(rate(gotk_reconcile_duration_seconds_sum{namespace=~\"$namespace\",kind=~\"Kustomization|HelmRelease\"}[5m])) by (kind)\n/\n  sum(rate(gotk_reconcile_duration_seconds_count{namespace=~\"$namespace\",kind=~\"Kustomization|HelmRelease\"}[5m])) by (kind)"
							interval:     ""
							legendFormat: "{{kind}}"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Reconciler ops avg. duration"
					type:      "bargauge"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "green"
										value: null
									},
									{
										color: "#EAB839"
										value: 1
									},
									{
										color: "red"
										value: 61
									},
								]
							}
							unit: "s"
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 12
						x: 12
						y: 5
					}
					id: 31
					options: {
						displayMode: "gradient"
						orientation: "horizontal"
						reduceOptions: {
							calcs: [
								"mean",
							]
							fields: ""
							values: false
						}
						showUnfilled: true
					}
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "  sum(rate(gotk_reconcile_duration_seconds_sum{namespace=~\"$namespace\",kind=~\"GitRepository|HelmRepository|Bucket\"}[5m])) by (kind)\n/\n  sum(rate(gotk_reconcile_duration_seconds_count{namespace=~\"$namespace\",kind=~\"GitRepository|HelmRepository|Bucket\"}[5m])) by (kind)"
							interval:     ""
							legendFormat: "{{kind}}"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Source ops avg. duration"
					type:      "bargauge"
				},
				{
					collapsed:  false
					datasource: "${DS_PROMETHEUS}"
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 9
					}
					id: 15
					panels: []
					title: "Status"
					type:  "row"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {
								align:      null
								filterable: true
							}
							mappings: [
								{
									from:  ""
									id:    1
									text:  "Ready"
									to:    ""
									type:  1
									value: "0"
								},
								{
									from:  ""
									id:    2
									text:  "Not Ready"
									to:    ""
									type:  1
									value: "1"
								},
							]
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "blue"
										value: 0
									},
									{
										color: "red"
										value: 1
									},
								]
							}
						}
						overrides: [
							{
								matcher: {
									id:      "byName"
									options: "Status"
								}
								properties: [
									{
										id:    "custom.displayMode"
										value: "color-background"
									},
								]
							},
						]
					}
					gridPos: {
						h: 8
						w: 12
						x: 0
						y: 10
					}
					id: 33
					options: showHeader: true
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"False\",kind=~\"Kustomization|HelmRelease\"}"
							format:       "table"
							instant:      true
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Cluster reconciliation readiness "
					transformations: [
						{
							id: "organize"
							options: {
								excludeByName: {
									Time:                 true
									"__name__":           true
									app:                  true
									instance:             true
									job:                  true
									kubernetes_namespace: true
									kubernetes_pod_name:  true
									namespace:            true
									pod_template_hash:    true
									status:               true
									type:                 true
								}
								indexByName: {}
								renameByName: {
									Value: "Status"
									kind:  "Kind"
									name:  "Name"
								}
							}
						},
					]
					type: "table"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {
								align:      null
								filterable: true
							}
							mappings: [
								{
									from:  ""
									id:    1
									text:  "Ready"
									to:    ""
									type:  1
									value: "0"
								},
								{
									from:  ""
									id:    2
									text:  "Not Ready"
									to:    ""
									type:  1
									value: "1"
								},
							]
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "blue"
										value: 0
									},
									{
										color: "red"
										value: 1
									},
								]
							}
						}
						overrides: [
							{
								matcher: {
									id:      "byName"
									options: "Status"
								}
								properties: [
									{
										id:    "custom.displayMode"
										value: "color-background"
									},
								]
							},
						]
					}
					gridPos: {
						h: 8
						w: 12
						x: 12
						y: 10
					}
					id: 34
					options: showHeader: true
					pluginVersion: "7.2.1"
					targets: [
						{
							expr:         "gotk_reconcile_condition{namespace=~\"$namespace\",type=\"Ready\",status=\"False\",kind=~\"GitRepository|HelmRepository|Bucket\"}"
							format:       "table"
							instant:      true
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Source acquisition readiness "
					transformations: [
						{
							id: "organize"
							options: {
								excludeByName: {
									Time:                 true
									"__name__":           true
									app:                  true
									instance:             true
									job:                  true
									kubernetes_namespace: true
									kubernetes_pod_name:  true
									namespace:            true
									pod_template_hash:    true
									status:               true
									type:                 true
								}
								indexByName: {}
								renameByName: {
									Value: "Status"
									kind:  "Kind"
									name:  "Name"
								}
							}
						},
					]
					type: "table"
				},
				{
					collapsed:  false
					datasource: "${DS_PROMETHEUS}"
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 18
					}
					id: 17
					panels: []
					title: "Timing"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 8
						w: 24
						x: 0
						y: 19
					}
					hiddenSeries: false
					id:           27
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          false
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					options: alertThreshold: true
					percentage:    false
					pluginVersion: "7.2.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "  sum(rate(gotk_reconcile_duration_seconds_sum{namespace=~\"$namespace\",kind=~\"Kustomization|HelmRelease\"}[5m])) by (kind, name)\n/\n  sum(rate(gotk_reconcile_duration_seconds_count{namespace=~\"$namespace\",kind=~\"Kustomization|HelmRelease\"}[5m])) by (kind, name)"
							hide:         false
							interval:     ""
							legendFormat: "{{kind}}/{{name}}"
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Cluster reconciliation duration"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							format:  "s"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "short"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 8
						w: 24
						x: 0
						y: 27
					}
					hiddenSeries: false
					id:           35
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          false
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					options: alertThreshold: true
					percentage:    false
					pluginVersion: "7.2.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "  sum(rate(gotk_reconcile_duration_seconds_sum{namespace=~\"$namespace\",kind=~\"GitRepository|HelmRepository|Bucket\"}[5m])) by (kind, name)\n/\n  sum(rate(gotk_reconcile_duration_seconds_count{namespace=~\"$namespace\",kind=~\"GitRepository|HelmRepository|Bucket\"}[5m])) by (kind, name)"
							hide:         false
							interval:     ""
							legendFormat: "{{kind}}/{{name}}"
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Source acquisition duration"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							format:  "s"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "short"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
			]
			refresh:       "10s"
			schemaVersion: 26
			style:         "light"
			tags: [
				"gitops-toolkit",
			]
			templating: list: [
				{
					current: {
						selected: false
						text:     "prometheus"
						value:    "prometheus"
					}
					hide:       2
					includeAll: false
					label:      null
					multi:      false
					name:       "DS_PROMETHEUS"
					options: []
					query:       "prometheus"
					refresh:     1
					regex:       ""
					skipUrlSync: false
					type:        "datasource"
				},
				{
					allValue: ".*"
					current: {
						selected: false
						text:     "All"
						value:    "$__all"
					}
					datasource: "$DS_PROMETHEUS"
					definition: "gotk_reconcile_condition"
					hide:       0
					includeAll: true
					label:      null
					multi:      false
					name:       "namespace"
					options: []
					query:          "gotk_reconcile_condition"
					refresh:        2
					regex:          "/.*namespace=\"([^\"]*).*/"
					skipUrlSync:    false
					sort:           5
					tagValuesQuery: ""
					tags: []
					tagsQuery: ""
					type:      "query"
					useTags:   false
				},
			]
			time: {
				from: "now-15m"
				to:   "now"
			}
			timepicker: refresh_intervals: [
				"10s",
				"30s",
				"1m",
				"5m",
				"15m",
				"30m",
				"1h",
				"2h",
				"1d",
			]
			timezone: ""
			title:    "Flux Cluster Stats"
			uid:      "flux-cluster"
			version:  1
		}

		"gotk-controll-plane.json": json656e63.Marshal(_cue_gotk_controll_plane_json)
		let _cue_gotk_controll_plane_json = {
			annotations: list: [
				{
					builtIn:    1
					datasource: "-- Grafana --"
					enable:     true
					hide:       true
					iconColor:  "rgba(0, 211, 255, 1)"
					name:       "Annotations & Alerts"
					type:       "dashboard"
				},
			]
			editable:     true
			gnetId:       null
			graphTooltip: 0
			iteration:    1596541513301
			links: []
			panels: [
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							decimals: 0
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "red"
										value: 100
									},
								]
							}
							unit: "short"
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 0
						y: 0
					}
					id: 24
					options: {
						colorMode:   "value"
						graphMode:   "none"
						justifyMode: "auto"
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"last",
							]
							fields: ""
							values: false
						}
						textMode: "value"
					}
					pluginVersion: "7.1.1"
					targets: [
						{
							expr:         "sum(go_info{kubernetes_namespace=\"$namespace\",kubernetes_pod_name=~\".*-controller-.*\"})"
							interval:     ""
							legendFormat: "pods"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Controllers"
					type:      "stat"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "#EAB839"
										value: 50
									},
									{
										color: "red"
										value: 100
									},
								]
							}
							unit: "s"
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 6
						y: 0
					}
					id: 23
					options: {
						colorMode:   "value"
						graphMode:   "area"
						justifyMode: "auto"
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"lastNotNull",
							]
							fields: ""
							values: false
						}
						textMode: "auto"
					}
					pluginVersion: "7.1.1"
					targets: [
						{
							expr:         "max(workqueue_longest_running_processor_seconds{kubernetes_namespace=\"$namespace\",kubernetes_pod_name=~\".*-controller-.*\"})"
							hide:         false
							interval:     ""
							legendFormat: "seconds"
							refId:        "B"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Max Work Queue"
					type:      "stat"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "#EAB839"
										value: 500000000
									},
									{
										color: "red"
										value: 900000000
									},
								]
							}
							unit: "decbits"
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 12
						y: 0
					}
					id: 25
					options: {
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"lastNotNull",
							]
							fields: ""
							values: false
						}
						showThresholdLabels:  false
						showThresholdMarkers: true
					}
					pluginVersion: "7.1.1"
					targets: [
						{
							expr:         "sum(go_memstats_alloc_bytes{kubernetes_namespace=\"$namespace\",kubernetes_pod_name=~\".*-controller-.*\"})"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Memory"
					type:      "gauge"
				},
				{
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: {
							custom: align: null
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "blue"
										value: null
									},
									{
										color: "#EAB839"
										value: 50
									},
									{
										color: "red"
										value: 100
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 5
						w: 6
						x: 18
						y: 0
					}
					id: 26
					options: {
						colorMode:   "value"
						graphMode:   "area"
						justifyMode: "auto"
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"mean",
							]
							fields: ""
							values: false
						}
						textMode: "auto"
					}
					pluginVersion: "7.1.1"
					targets: [
						{
							expr:         "sum(rate(rest_client_requests_total{kubernetes_namespace=\"$namespace\",kubernetes_pod_name=~\".*-controller-.*\"}[1m]))"
							interval:     ""
							legendFormat: "requests"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "API Requests"
					type:      "stat"
				},
				{
					collapsed:  false
					datasource: "${DS_PROMETHEUS}"
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 5
					}
					id: 15
					panels: []
					title: "Resource Usage"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 8
						w: 12
						x: 0
						y: 6
					}
					hiddenSeries: false
					id:           8
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "histogram_quantile(0.50, sum(rate(rest_client_request_latency_seconds_bucket{kubernetes_namespace=\"$namespace\"}[5m])) by (le))"
							interval:     ""
							legendFormat: "P50"
							refId:        "A"
						},
						{
							expr:         "histogram_quantile(0.90, sum(rate(rest_client_request_latency_seconds_bucket{kubernetes_namespace=\"$namespace\"}[5m])) by (le))"
							hide:         true
							interval:     ""
							legendFormat: "P90"
							refId:        "B"
						},
						{
							expr:         "histogram_quantile(0.99, sum(rate(rest_client_request_latency_seconds_bucket{kubernetes_namespace=\"$namespace\"}[5m])) by (le))"
							hide:         false
							interval:     ""
							legendFormat: "P99"
							refId:        "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Kubernetes API Requests Duration"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:912"
							format:    "s"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:913"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					decimals:    null
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 8
						w: 12
						x: 12
						y: 6
					}
					hiddenSeries: false
					id:           21
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "sum(rate(rest_client_requests_total{kubernetes_namespace=\"$namespace\"}[1m]))"
							hide:         false
							interval:     ""
							legendFormat: "total"
							refId:        "A"
						},
						{
							expr:         "sum(rate(rest_client_requests_total{kubernetes_namespace=\"$namespace\",code!~\"2..\"}[1m]))"
							hide:         false
							interval:     ""
							legendFormat: "errors"
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Kubernetes API Requests"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:912"
							decimals:  null
							format:    "short"
							label:     ""
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:913"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "${DS_PROMETHEUS}"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 11
						w: 12
						x: 0
						y: 14
					}
					hiddenSeries: false
					id:           11
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						show:         true
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:         "rate(process_cpu_seconds_total{kubernetes_namespace=\"$namespace\",kubernetes_pod_name=~\".*-controller-.*\"}[1m])"
							interval:     ""
							legendFormat: "{{kubernetes_pod_name}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "CPU Usage"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:93"
							format:    "s"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:94"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "${DS_PROMETHEUS}"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 11
						w: 12
						x: 12
						y: 14
					}
					hiddenSeries: false
					id:           13
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						show:         true
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:         "rate(go_memstats_alloc_bytes_total{kubernetes_namespace=\"$namespace\",kubernetes_pod_name=~\".*-controller-.*\"}[1m])"
							hide:         false
							interval:     ""
							legendFormat: "{{kubernetes_pod_name}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Memory Usage"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:93"
							decimals:  0
							format:    "bytes"
							label:     ""
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:94"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					collapsed:  false
					datasource: "${DS_PROMETHEUS}"
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 25
					}
					id: 17
					panels: []
					title: "Reconciliation Stats"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "${DS_PROMETHEUS}"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 8
						w: 24
						x: 0
						y: 26
					}
					hiddenSeries: false
					id:           27
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "workqueue_longest_running_processor_seconds{name=\"kustomization\"}"
							hide:         false
							interval:     ""
							legendFormat: "kustomizations"
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Cluster Reconciliation Duration"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:912"
							format:    "s"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:913"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:        true
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					decimals:    2
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 9
						w: 12
						x: 0
						y: 34
					}
					hiddenSeries: false
					id:           2
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:         false
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: true
					targets: [
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"kustomization\",result!=\"error\"}[1m])) by (controller)"
							format:       "time_series"
							interval:     ""
							legendFormat: "successful reconciliations "
							refId:        "A"
						},
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"kustomization\",result=\"error\"}[1m])) by (controller)"
							format:       "time_series"
							interval:     ""
							legendFormat: "failed reconciliations "
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Cluster Reconciliations ops/min"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:1171"
							format:    "opm"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:1172"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:        true
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					decimals:    2
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 9
						w: 12
						x: 12
						y: 34
					}
					hiddenSeries: false
					id:           4
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:         false
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: true
					targets: [
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"gitrepository\",result!=\"error\"}[1m]))"
							format:       "time_series"
							interval:     ""
							legendFormat: "successful git pulls"
							refId:        "A"
						},
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"gitrepository\",result=\"error\"}[1m]))"
							format:       "time_series"
							interval:     ""
							legendFormat: "failed git pulls"
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Git Sources ops/min"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:285"
							format:    "opm"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:286"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					collapsed:  false
					datasource: "${DS_PROMETHEUS}"
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 43
					}
					id: 19
					panels: []
					title: "Helm Stats"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "${DS_PROMETHEUS}"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 8
						w: 24
						x: 0
						y: 44
					}
					hiddenSeries: false
					id:           9
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    true
						show:         false
						total:        false
						values:       true
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null as zero"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "histogram_quantile(0.50, sum(rate(controller_runtime_reconcile_time_seconds_bucket{controller=\"helmrelease\"}[5m])) by (le))"
							hide:         true
							interval:     ""
							legendFormat: "P50"
							refId:        "A"
						},
						{
							expr:         "histogram_quantile(0.90, sum(rate(controller_runtime_reconcile_time_seconds_bucket{controller=\"helmrelease\"}[5m])) by (le))"
							hide:         true
							interval:     ""
							legendFormat: "P90"
							refId:        "B"
						},
						{
							expr:         "histogram_quantile(0.99, sum(rate(controller_runtime_reconcile_time_seconds_bucket{controller=\"helmrelease\"}[5m])) by (le))"
							hide:         false
							interval:     ""
							legendFormat: "P99"
							refId:        "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Helm Release Duration"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:1612"
							format:    "s"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:1613"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:        true
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					decimals:    2
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 9
						w: 12
						x: 0
						y: 52
					}
					hiddenSeries: false
					id:           5
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:         false
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: true
					targets: [
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"helmrelease\",result!=\"error\"}[1m])) by (controller)"
							format:       "time_series"
							interval:     ""
							legendFormat: "successful reconciliations "
							refId:        "A"
						},
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"helmrelease\",result=\"error\"}[1m])) by (controller)"
							format:       "time_series"
							interval:     ""
							legendFormat: "failed reconciliations "
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Helm Releases ops/min"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:1102"
							format:    "opm"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:1103"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:        true
					dashLength:  10
					dashes:      false
					datasource:  "${DS_PROMETHEUS}"
					decimals:    2
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 9
						w: 12
						x: 12
						y: 52
					}
					hiddenSeries: false
					id:           6
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:         false
					linewidth:     1
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.1"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: true
					targets: [
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"helmchart\",result!=\"error\"}[1m])) by (controller)"
							format:       "time_series"
							interval:     ""
							legendFormat: "successful chart pulls"
							refId:        "A"
						},
						{
							expr:         "sum(increase(controller_runtime_reconcile_total{controller=\"helmchart\",result=\"error\"}[1m])) by (controller)"
							format:       "time_series"
							interval:     ""
							legendFormat: "failed chart pulls"
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Helm Charts ops/min"
					tooltip: {
						shared:     true
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "time"
						name:    null
						show:    true
						values: []
					}
					yaxes: [
						{
							$$hashKey: "object:1892"
							format:    "opm"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:1893"
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
			]
			refresh:       "10s"
			schemaVersion: 26
			style:         "light"
			tags: [
				"gitops-toolkit",
			]
			templating: list: [
				{
					current: {
						selected: false
						text:     "Prometheus"
						value:    "Prometheus"
					}
					hide:       2
					includeAll: false
					label:      null
					multi:      false
					name:       "DS_PROMETHEUS"
					options: []
					query:       "prometheus"
					refresh:     1
					regex:       ""
					skipUrlSync: false
					type:        "datasource"
				},
				{
					allValue: null
					current: {
						selected: false
						text:     "flux-system"
						value:    "flux-system"
					}
					datasource: "${DS_PROMETHEUS}"
					definition: "workqueue_work_duration_seconds_count"
					hide:       0
					includeAll: false
					label:      null
					multi:      false
					name:       "namespace"
					options: []
					query:          "workqueue_work_duration_seconds_count"
					refresh:        2
					regex:          "/.*namespace=\"([^\"]*).*/"
					skipUrlSync:    false
					sort:           0
					tagValuesQuery: ""
					tags: []
					tagsQuery: ""
					type:      "query"
					useTags:   false
				},
			]
			time: {
				from: "now-15m"
				to:   "now"
			}
			timepicker: refresh_intervals: [
				"10s",
				"30s",
				"1m",
				"5m",
				"15m",
				"30m",
				"1h",
				"2h",
				"1d",
			]
			timezone: ""
			title:    "GitOps Toolkit Control Plane"
			uid:      "gitops-toolkit-control-plane"
			version:  1
		}
	}
}
