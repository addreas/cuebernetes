package kube

import json656e63 "encoding/json"

k: ConfigMap: "grafana-dashboard-qbittorrent": {
	metadata: labels: grafana_dashboard: "grrr"
	data: {
		"qbittorrent.json": json656e63.Marshal(_cue_qbittorrent_json)
		let _cue_qbittorrent_json = {
			"__inputs": []
			"__requires": [
				{
					type:    "panel"
					id:      "gauge"
					name:    "Gauge"
					version: ""
				},
				{
					type:    "grafana"
					id:      "grafana"
					name:    "Grafana"
					version: "7.2.2"
				},
				{
					type:    "panel"
					id:      "grafana-piechart-panel"
					name:    "Pie Chart"
					version: "1.6.1"
				},
				{
					type:    "panel"
					id:      "graph"
					name:    "Graph"
					version: ""
				},
				{
					type:    "datasource"
					id:      "prometheus"
					name:    "Prometheus"
					version: "1.0.0"
				},
				{
					type:    "panel"
					id:      "stat"
					name:    "Stat"
					version: ""
				},
			]
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
			id:           null
			iteration:    1603732792335
			links: []
			panels: [
				{
					datasource: "prometheus"
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: [
								{
									from:  ""
									id:    0
									text:  "Online"
									to:    ""
									type:  1
									value: "1"
								},
								{
									from:  ""
									id:    1
									text:  "Offline"
									to:    ""
									type:  1
									value: "0"
								},
								{
									from:  ""
									id:    2
									text:  "Unknown"
									to:    ""
									type:  1
									value: "null"
								},
							]
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "yellow"
										value: null
									},
									{
										color: "semi-dark-red"
										value: 0
									},
									{
										color: "semi-dark-green"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 0
						y: 0
					}
					id: 2
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
						textMode: "auto"
					}
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "qbittorrent_up"
							format:       "time_series"
							instant:      false
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Qbittorrent Status"
					transformations: []
					type: "stat"
				},
				{
					datasource: "prometheus"
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: [
								{
									from:  ""
									id:    0
									text:  "Connected"
									to:    ""
									type:  1
									value: "1"
								},
								{
									from:  ""
									id:    1
									text:  "Disconnected"
									to:    ""
									type:  1
									value: "0"
								},
								{
									from:  ""
									id:    2
									text:  "Firewalled"
									to:    ""
									type:  1
									value: "-1"
								},
							]
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "yellow"
										value: null
									},
									{
										color: "dark-red"
										value: 0
									},
									{
										color: "semi-dark-green"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 3
						y: 0
					}
					id: 3
					options: {
						colorMode:   "value"
						graphMode:   "none"
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
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "qbittorrent_connected - qbittorrent_firewalled"
							format:       "time_series"
							instant:      true
							interval:     ""
							legendFormat: "Status"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Bittorrent network"
					transformations: []
					type: "stat"
				},
				{
					datasource: "prometheus"
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: [
								{
									from:  ""
									id:    1
									text:  "No DHT"
									to:    ""
									type:  1
									value: "0"
								},
								{
									from:  ""
									id:    2
									text:  "Firewalled"
									to:    ""
									type:  1
									value: "-1"
								},
							]
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "yellow"
										value: null
									},
									{
										color: "dark-red"
										value: 0
									},
									{
										color: "semi-dark-green"
										value: 100
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 6
						y: 0
					}
					id: 13
					options: {
						colorMode:   "value"
						graphMode:   "none"
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
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "qbittorrent_dht_nodes"
							instant:      true
							interval:     ""
							legendFormat: "DHT nodes"
							refId:        "B"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "DHT nodes"
					transformations: []
					type: "stat"
				},
				{
					datasource: "prometheus"
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
								]
							}
							unit: "decbytes"
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 9
						y: 0
					}
					id: 5
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
						textMode: "auto"
					}
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "increase(qbittorrent_dl_info_data_total[100y])"
							instant:      false
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Data downloaded"
					type:      "stat"
				},
				{
					datasource: "prometheus"
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
								]
							}
							unit: "decbytes"
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 12
						y: 0
					}
					id: 6
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
						textMode: "auto"
					}
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "increase(qbittorrent_up_info_data_total[100y])"
							instant:      false
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Data uploaded"
					type:      "stat"
				},
				{
					datasource: "prometheus"
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
								]
							}
							unit: "none"
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 15
						y: 0
					}
					id: 7
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
						textMode: "auto"
					}
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "increase(qbittorrent_up_info_data_total[100y]) / increase(qbittorrent_dl_info_data_total[100y])"
							instant:      false
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Accumulated ratio"
					type:      "stat"
				},
				{
					datasource: "prometheus"
					fieldConfig: {
						defaults: {
							custom: {}
							decimals: 1
							mappings: []
							max: 48000000
							min: 0
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "dark-red"
										value: null
									},
									{
										color: "dark-green"
										value: 8000000
									},
								]
							}
							unit: "binBps"
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 18
						y: 0
					}
					id: 16
					options: {
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"last",
							]
							fields: ""
							values: false
						}
						showThresholdLabels:  false
						showThresholdMarkers: true
					}
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "rate(qbittorrent_dl_info_data_total[1m])"
							instant:      false
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Download speed"
					type:      "gauge"
				},
				{
					datasource: "prometheus"
					fieldConfig: {
						defaults: {
							custom: {}
							decimals: 1
							mappings: [
								{
									from: ""
									id:   1
									text: ""
									to:   ""
									type: 1
								},
							]
							max: 18000000
							min: 0
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "dark-red"
										value: null
									},
									{
										color: "dark-green"
										value: 4000000
									},
								]
							}
							unit: "binBps"
						}
						overrides: []
					}
					gridPos: {
						h: 4
						w: 3
						x: 21
						y: 0
					}
					id: 17
					options: {
						orientation: "auto"
						reduceOptions: {
							calcs: [
								"last",
							]
							fields: ""
							values: false
						}
						showThresholdLabels:  false
						showThresholdMarkers: true
					}
					pluginVersion: "7.2.2"
					targets: [
						{
							expr:         "rate(qbittorrent_up_info_data_total[1m])"
							hide:         false
							instant:      false
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Upload speed"
					type:      "gauge"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 24
						x: 0
						y: 4
					}
					hiddenSeries: false
					id:           15
					legend: {
						avg:     false
						current: false
						max:     false
						min:     false
						show:    true
						total:   false
						values:  false
					}
					lines:         true
					linewidth:     1
					nullPointMode: "null"
					options: alertThreshold: true
					percentage:    false
					pluginVersion: "7.2.2"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "rate(qbittorrent_dl_info_data_total[1m])"
							interval:     ""
							legendFormat: "Download"
							refId:        "A"
						},
						{
							expr:         "rate(qbittorrent_up_info_data_total[1m])"
							interval:     ""
							legendFormat: "Upload"
							refId:        "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Transfer ratio"
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
							format:  "binBps"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "binBps"
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
					bars:         true
					cacheTimeout: null
					dashLength:   10
					dashes:       false
					datasource:   "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 14
						x: 0
						y: 14
					}
					hiddenSeries: false
					id:           11
					interval:     null
					legend: {
						alignAsTable: true
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 0
					links: []
					nullPointMode: "null as zero"
					options: alertThreshold: true
					percentage:    false
					pluginVersion: "7.2.2"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: true
					targets: [
						{
							expr:         "sum(qbittorrent_torrents_count{category=~\"${categories}\", status!=\"complete\"}) by (status)"
							interval:     ""
							legendFormat: "{{status}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Torrents by status"
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
							format:  "short"
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
					breakPoint:   "50%"
					cacheTimeout: null
					combine: {
						label:     "Others"
						threshold: 0
					}
					datasource: "prometheus"
					fieldConfig: {
						defaults: {
							custom: {
								align:      null
								filterable: false
							}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "green"
										value: null
									},
								]
							}
						}
						overrides: []
					}
					fontSize: "80%"
					format:   "short"
					gridPos: {
						h: 10
						w: 10
						x: 14
						y: 14
					}
					id:       12
					interval: null
					legend: {
						percentage: true
						show:       true
						sideWidth:  null
						values:     true
					}
					legendType: "Right side"
					links: []
					nullPointMode: "connected"
					pieType:       "donut"
					pluginVersion: "7.2.0"
					strokeWidth:   1
					targets: [
						{
							expr:         "sum(qbittorrent_torrents_count{category=~\"${categories}\",status!=\"complete\"}) by (category)"
							interval:     ""
							legendFormat: "{{category}}"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Torrents by categories"
					type:      "grafana-piechart-panel"
					valueName: "current"
				},
			]
			refresh:       "30s"
			schemaVersion: 26
			style:         "dark"
			tags: []
			templating: list: [
				{
					allValue: ".*"
					current: {}
					datasource: "prometheus"
					definition: "label_values(qbittorrent_torrents_count, category)"
					hide:       0
					includeAll: true
					label:      "Categories"
					multi:      true
					name:       "categories"
					options: []
					query:          "label_values(qbittorrent_torrents_count, category)"
					refresh:        1
					regex:          ""
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
				from: "now-5m"
				to:   "now"
			}
			timepicker: {}
			timezone: ""
			title:    "Qbittorrent"
			uid:      "eKyTETFMk"
			version:  40
		}
	}
}
