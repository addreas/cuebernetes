package kube

import (
	json656e63 "encoding/json"
	yaml656e63 "encoding/yaml"
)

k: ConfigMap: "grafana-dashboard-longhorn": {
	metadata: {
		labels: grafana_dashboard: "longhorn"
		namespace: "monitoring"
	}
	data: {
		"longhorn.json": json656e63.Marshal(_cue_longhorn_json)
		let _cue_longhorn_json = {
			"__inputs": []
			"__requires": [
				{
					type:    "grafana"
					id:      "grafana"
					name:    "Grafana"
					version: "7.1.5"
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
				{
					type:    "panel"
					id:      "table"
					name:    "Table"
					version: ""
				},
				{
					type:    "panel"
					id:      "text"
					name:    "Text"
					version: "7.1.0"
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
			gnetId:       13032
			graphTooltip: 0
			id:           null
			links: []
			panels: [
				{
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 3
						w: 24
						x: 0
						y: 0
					}
					id: 4
					options: {
						content: "<div class=\"dashboard-header text-center\">\n<span>VOLUMES</span>\n</div>"
						mode:    "html"
					}
					pluginVersion: "7.1.0"
					timeFrom:      null
					timeShift:     null
					title:         ""
					transparent:   true
					type:          "text"
				},
				{
					datasource:  "prometheus"
					description: "The total number of volumes in the Longhorn storage system"
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
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 0
						y: 3
					}
					id: 8
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "count(longhorn_volume_capacity_bytes) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Total Number Of Volumes"
					type:      "stat"
				},
				{
					datasource:  "prometheus"
					description: "Healthy volumes are volumes that are attaching to a node and have the number of healthy replicas equals to the expected number of replicas."
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "red"
										value: null
									},
									{
										color: "green"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 4
						y: 3
					}
					id: 13
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "count(longhorn_volume_robustness==1) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Healthy Volumes"
					type:      "stat"
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "prometheus"
					description: yaml656e63.Marshal(_cue_description)
					let _cue_description = {
						"Note that Longhorn volume actual size is not the size of the filesystem inside a Longhorn volume.  See more at": "https://longhorn.io/docs/1.0.2/volumes-and-nodes/volume-size/#volume-actual-size"
					}
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 9
						w: 15
						x: 9
						y: 3
					}
					hiddenSeries: false
					id:           12
					legend: {
						alignAsTable: true
						avg:          false
						current:      true
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
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "( (avg by (volume) (longhorn_volume_actual_size_bytes))/ (avg by (volume) (longhorn_volume_capacity_bytes)) ) *100"
							interval:     ""
							legendFormat: "{{volume}}"
							refId:        "A"
						},
					]
					thresholds: [
						{
							$$hashKey: "object:649"
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     90
							yaxis:     "left"
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Volume Actual Size/Capacity"
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
							$$hashKey: "object:476"
							format:    "percent"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:477"
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
					datasource:  "prometheus"
					description: "Degraded volumes are volumes that have the number of healthy replicas smaller than the expected number of replicas. e.g. User creates a volume with 2 replicas but 1 replicas is failed."
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
										color: "orange"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 0
						y: 9
					}
					id: 15
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "count(longhorn_volume_robustness==2) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Degraded Volumes"
					type:      "stat"
				},
				{
					datasource:  "prometheus"
					description: "Fault volumes are volumes that doesn't have any healthy replica."
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
										color: "red"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 4
						y: 9
					}
					id: 16
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "count(longhorn_volume_robustness==3) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Fault Volumes"
					type:      "stat"
				},
				{
					datasource:  "prometheus"
					description: "The capacity of each Longhorn volume"
					fieldConfig: {
						defaults: {
							custom: {
								align:       null
								displayMode: "auto"
							}
							decimals: 1
							mappings: [
								{
									from:  ""
									id:    0
									text:  ""
									to:    ""
									type:  1
									value: ""
								},
							]
							min: 0
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "green"
										value: null
									},
								]
							}
							unit: "bytes"
						}
						overrides: [
							{
								matcher: {
									id:      "byName"
									options: "volume"
								}
								properties: [
									{
										id:    "custom.displayMode"
										value: "auto"
									},
								]
							},
							{
								matcher: {
									id:      "byName"
									options: "Capacity"
								}
								properties: [
									{
										id:    "custom.displayMode"
										value: "lcd-gauge"
									},
								]
							},
						]
					}
					gridPos: {
						h: 9
						w: 15
						x: 9
						y: 12
					}
					id: 10
					options: {
						frameIndex: 4
						showHeader: true
						sortBy: [
							{
								desc:        true
								displayName: "Capacity"
							},
						]
					}
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:           "avg by (volume) (longhorn_volume_capacity_bytes)"
							format:         "table"
							instant:        true
							interval:       ""
							intervalFactor: 1
							legendFormat:   "{{volume}}"
							refId:          "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Volume Capacity"
					transformations: [
						{
							id: "organize"
							options: {
								excludeByName: Time: true
								indexByName: {}
								renameByName: Value: "Capacity"
							}
						},
					]
					type: "table"
				},
				{
					datasource:  "prometheus"
					description: "Attached volumes are volumes that are currently attaching to a node"
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "red"
										value: null
									},
									{
										color: "green"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 0
						y: 15
					}
					id: 34
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "count(longhorn_volume_state==2) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Attached Volumes"
					type:      "stat"
				},
				{
					datasource:  "prometheus"
					description: "Detached volumes are volumes that aren't currently attaching to a node"
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
										color: "yellow"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 4
						y: 15
					}
					id: 14
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "count(longhorn_volume_state==3) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Detached Volumes"
					type:      "stat"
				},
				{
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 3
						w: 24
						x: 0
						y: 21
					}
					id: 6
					options: {
						content: "<div class=\"dashboard-header text-center\">\n<span>NODES</span>\n</div>"
						mode:    "html"
					}
					pluginVersion: "7.1.0"
					timeFrom:      null
					timeShift:     null
					title:         ""
					transparent:   true
					type:          "text"
				},
				{
					datasource:  "prometheus"
					description: "The total number of nodes in the Longhorn storage system"
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
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 0
						y: 24
					}
					id: 18
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "avg(longhorn_node_count_total) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Total Number Of Nodes"
					type:      "stat"
				},
				{
					datasource:  "prometheus"
					description: "Disabled nodes are nodes that are disabled by the user.  When users disable a node, Longhorn will not use the node's storage for replica scheduling. Note that Longhorn can still attach a volume to disabled nodes because the actual data of the volume could be on a different node."
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
										color: "yellow"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 4
						y: 24
					}
					id: 21
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "count(longhorn_node_status{condition=\"allowScheduling\"}==0) OR on() vector(0)"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Disabled Nodes"
					type:      "stat"
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "prometheus"
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 15
						x: 9
						y: 24
					}
					hiddenSeries: false
					id:           24
					legend: {
						alignAsTable: true
						avg:          false
						current:      true
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
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "(longhorn_node_storage_usage_bytes/longhorn_node_storage_capacity_bytes) * 100"
							interval:     ""
							legendFormat: "{{node}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Node Storage Usage/Capacity"
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
							$$hashKey: "object:530"
							format:    "percent"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:531"
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
					datasource:  "prometheus"
					description: "Schedulable nodes are nodes that Longhorn can use their storage for replica scheduling."
					fieldConfig: {
						defaults: {
							custom: {}
							mappings: []
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "red"
										value: null
									},
									{
										color: "green"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 0
						y: 30
					}
					id: 20
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "(count(longhorn_node_status{condition=\"schedulable\"}==1) OR on() vector(0)) - (count(longhorn_node_status{condition=\"allowScheduling\"}==0) OR on() vector(0))"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Schedulable Nodes"
					type:      "stat"
				},
				{
					datasource:  "prometheus"
					description: yaml656e63.Marshal(_cue_xdescription)
					let _cue_xdescription = {
						"Failed Nodes are nodes that Longhorn cannot attach volumes to and cannot schedule replicas onto. e.g": "when the nodes went down."
					}
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
										color: "red"
										value: 1
									},
								]
							}
						}
						overrides: []
					}
					gridPos: {
						h: 6
						w: 4
						x: 4
						y: 30
					}
					id: 22
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
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "(avg(longhorn_node_count_total) OR on() vector(0)) - (count(longhorn_node_status{condition=\"ready\"}==1) OR on() vector(0))"
							interval:     ""
							legendFormat: ""
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Number Of Failed Nodes"
					type:      "stat"
				},
				{
					datasource:  "prometheus"
					description: ""
					fieldConfig: {
						defaults: {
							custom: align: null
							decimals: 1
							mappings: []
							min: 0
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "green"
										value: null
									},
								]
							}
							unit: "bytes"
						}
						overrides: [
							{
								matcher: {
									id:      "byName"
									options: "Storage Capacity"
								}
								properties: [
									{
										id:    "custom.displayMode"
										value: "lcd-gauge"
									},
								]
							},
						]
					}
					gridPos: {
						h: 10
						w: 15
						x: 9
						y: 34
					}
					id: 23
					options: showHeader: true
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "longhorn_node_storage_capacity_bytes"
							format:       "table"
							instant:      true
							interval:     ""
							legendFormat: "{{node}}"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Node Capacity"
					transformations: [
						{
							id: "organize"
							options: {
								excludeByName: {
									Time:       true
									"__name__": true
									endpoint:   true
									instance:   true
									job:        true
									namespace:  true
									pod:        true
									service:    true
								}
								indexByName: {}
								renameByName: Value: "Storage Capacity"
							}
						},
					]
					type: "table"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					decimals:   0
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 8
						w: 8
						x: 0
						y: 36
					}
					hiddenSeries: false
					id:           26
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
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "count by (node) (longhorn_volume_state==2)"
							interval:     ""
							legendFormat: "{{node}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Number of Volumes Per Node"
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
							$$hashKey: "object:422"
							decimals:  0
							format:    "short"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:423"
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
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 3
						w: 24
						x: 0
						y: 44
					}
					id: 17
					options: {
						content: "<div class=\"dashboard-header text-center\">\n<span>DISKS</span>\n</div>"
						mode:    "html"
					}
					pluginVersion: "7.1.0"
					timeFrom:      null
					timeShift:     null
					title:         ""
					transparent:   true
					type:          "text"
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "prometheus"
					description: "The capacity of each Longhorn volume"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 12
						x: 0
						y: 47
					}
					hiddenSeries: false
					id:           32
					legend: {
						alignAsTable: true
						avg:          false
						current:      true
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
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "(longhorn_disk_usage_bytes/longhorn_disk_capacity_bytes)*100"
							interval:     ""
							legendFormat: "{{disk}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Disk Space Usage"
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
							$$hashKey: "object:530"
							format:    "percent"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:531"
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
					datasource:  "prometheus"
					description: ""
					fieldConfig: {
						defaults: {
							custom: align: null
							decimals: 1
							mappings: []
							min: 0
							thresholds: {
								mode: "absolute"
								steps: [
									{
										color: "green"
										value: null
									},
								]
							}
							unit: "bytes"
						}
						overrides: [
							{
								matcher: {
									id:      "byName"
									options: "Capacity"
								}
								properties: [
									{
										id:    "custom.displayMode"
										value: "lcd-gauge"
									},
								]
							},
						]
					}
					gridPos: {
						h: 10
						w: 12
						x: 12
						y: 47
					}
					id: 33
					options: showHeader: true
					pluginVersion: "7.1.5"
					targets: [
						{
							expr:         "longhorn_disk_capacity_bytes"
							format:       "table"
							instant:      true
							interval:     ""
							legendFormat: "{{disk}}"
							refId:        "A"
						},
					]
					timeFrom:  null
					timeShift: null
					title:     "Disk Capacity"
					transformations: [
						{
							id: "organize"
							options: {
								excludeByName: {
									Time:       true
									Value:      false
									"__name__": true
									disk:       false
									endpoint:   true
									instance:   true
									job:        true
									namespace:  true
									pod:        true
									service:    true
								}
								indexByName: {}
								renameByName: Value: "Capacity"
							}
						},
					]
					type: "table"
				},
				{
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 3
						w: 24
						x: 0
						y: 57
					}
					id: 5
					options: {
						content: "<div class=\"dashboard-header text-center\">\n<span>CPU & MEMORY</span>\n</div>"
						mode:    "html"
					}
					pluginVersion: "7.1.0"
					timeFrom:      null
					timeShift:     null
					title:         ""
					transparent:   true
					type:          "text"
				},
				{
					aliasColors: {}
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "prometheus"
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 12
						x: 0
						y: 60
					}
					hiddenSeries: false
					id:           36
					legend: {
						avg:     false
						current: false
						max:     false
						min:     false
						show:    true
						total:   false
						values:  false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "(longhorn_node_cpu_usage_millicpu / longhorn_node_cpu_capacity_millicpu) * 100"
							interval:     ""
							legendFormat: "{{node}}"
							refId:        "A"
						},
					]
					thresholds: [
						{
							$$hashKey: "object:1092"
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     80
							yaxis:     "left"
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Node CPU Usage/Capacity"
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
							$$hashKey: "object:865"
							decimals:  0
							format:    "percent"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:866"
							format:    "none"
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
					datasource:  "prometheus"
					description: ""
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 12
						x: 12
						y: 60
					}
					hiddenSeries: false
					id:           38
					legend: {
						avg:     false
						current: false
						max:     false
						min:     false
						show:    true
						total:   false
						values:  false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "( longhorn_node_memory_usage_bytes / longhorn_node_memory_capacity_bytes ) * 100"
							interval:     ""
							legendFormat: "{{node}}"
							refId:        "A"
						},
					]
					thresholds: [
						{
							$$hashKey: "object:1092"
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     80
							yaxis:     "left"
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Node Memory Usage/Capacity"
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
							$$hashKey: "object:865"
							decimals:  0
							format:    "percent"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:866"
							format:    "none"
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
					datasource:  "prometheus"
					decimals:    0
					description: "Instance managers are pods that contains the engine and replica processes of Longhorn volumes. See more at https://longhorn.io/docs/1.0.2/concepts/#11-the-longhorn-manager-and-the-longhorn-engine "
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 8
						x: 0
						y: 70
					}
					hiddenSeries: false
					id:           28
					legend: {
						avg:     false
						current: false
						max:     false
						min:     false
						show:    true
						total:   false
						values:  false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "longhorn_instance_manager_cpu_usage_millicpu"
							interval:     ""
							legendFormat: "{{instance_manager}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Instance Manager CPU Usage"
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
							$$hashKey: "object:865"
							decimals:  0
							format:    "milicpu"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:866"
							format:    "none"
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
					datasource:  "prometheus"
					description: "Instance managers are pods that contains the engine and replica processes of Longhorn volumes. See more at https://longhorn.io/docs/1.0.2/concepts/#11-the-longhorn-manager-and-the-longhorn-engine "
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 8
						x: 8
						y: 70
					}
					hiddenSeries: false
					id:           30
					legend: {
						avg:     false
						current: false
						max:     false
						min:     false
						show:    true
						total:   false
						values:  false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "(longhorn_instance_manager_cpu_usage_millicpu/longhorn_instance_manager_cpu_requests_millicpu)*100"
							interval:     ""
							legendFormat: "{{instance_manager}}"
							refId:        "A"
						},
					]
					thresholds: [
						{
							$$hashKey: "object:1092"
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     100
							yaxis:     "left"
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Instance Manager CPU Usage/Request"
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
							$$hashKey: "object:865"
							decimals:  0
							format:    "percent"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:866"
							format:    "none"
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
					datasource:  "prometheus"
					description: "Instance managers are pods that contains the engine and replica processes of Longhorn volumes. See more at https://longhorn.io/docs/1.0.2/concepts/#11-the-longhorn-manager-and-the-longhorn-engine "
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 10
						w: 8
						x: 16
						y: 70
					}
					hiddenSeries: false
					id:           29
					legend: {
						avg:     false
						current: false
						max:     false
						min:     false
						show:    true
						total:   false
						values:  false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "longhorn_instance_manager_memory_usage_bytes"
							interval:     ""
							legendFormat: "{{instance_manager}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Instance Manager Memory Usage"
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
							$$hashKey: "object:865"
							format:    "bytes"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:866"
							format:    "none"
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
					datasource:  "prometheus"
					decimals:    0
					description: "Longhorn manager pods manage the control plane of the Longhorn system. e.g. Volume scheduling, attaching, detaching, backup, etc,.."
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
						y: 80
					}
					hiddenSeries: false
					id:           2
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
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "longhorn_manager_cpu_usage_millicpu"
							interval:     ""
							legendFormat: "{{manager}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Longhorn Manager CPU Usage"
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
							$$hashKey: "object:1500"
							decimals:  0
							format:    "milicpu"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:1501"
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
					datasource:  "prometheus"
					decimals:    null
					description: "Longhorn manager pods manage the control plane of the Longhorn system. e.g. Volume scheduling, attaching, detaching, backup, etc,.."
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
						y: 80
					}
					hiddenSeries: false
					id:           31
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
					percentage:    false
					pluginVersion: "7.1.5"
					pointradius:   2
					points:        false
					renderer:      "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:         "longhorn_manager_memory_usage_bytes"
							interval:     ""
							legendFormat: "{{manager}}"
							refId:        "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Longhorn Manager Memory Usage"
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
							$$hashKey: "object:1500"
							decimals:  null
							format:    "bytes"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:1501"
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
			refresh:       "30s"
			schemaVersion: 26
			style:         "dark"
			tags: []
			templating: list: []
			time: {
				from: "now-1h"
				to:   "now"
			}
			timepicker: refresh_intervals: [
				"5s",
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
			timezone:    ""
			title:       "Longhorn Example v1.1.0"
			uid:         "2BCgsldGz"
			version:     101
			description: "An example dashboard for Longhorn v1.1.0"
		}
	}
}