package kube

import json656e63 "encoding/json"

k: ConfigMap: "grafana-cilium-dashboard": {
	metadata: {
		labels: grafana_dashboard: "cilium"
		namespace: "monitoring"
	}
	data: {
		"cilium-dashboard.json": json656e63.Marshal(_cue_cilium_dashboard_json)
		let _cue_cilium_dashboard_json = {
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
			description:  "Dashboard for Cilium (https://cilium.io/) metrics"
			editable:     true
			gnetId:       null
			graphTooltip: 1
			iteration:    1590659986961
			links: []
			panels: [
				{
					aliasColors: {
						error:   "#890f02"
						warning: "#c15c17"
					}
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
						h: 5
						w: 12
						x: 0
						y: 0
					}
					hiddenSeries: false
					id:           76
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "error"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_errors_warnings_total{k8s_app=\"cilium\"}[1m])) by (pod, level) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{level}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Errors & Warnings"
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
							format:  "opm"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "opm"
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
					aliasColors: avg: "#cffaff"
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 0
					}
					hiddenSeries: false
					id:           96
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(irate(cilium_process_cpu_seconds_total{k8s_app=\"cilium\"}[1m])) by (pod) * 100"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(irate(cilium_process_cpu_seconds_total{k8s_app=\"cilium\"}[1m])) by (pod) * 100"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(irate(cilium_process_cpu_seconds_total{k8s_app=\"cilium\"}[1m])) by (pod) * 100"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "CPU Usage per node"
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
							format:  "percent"
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
					collapsed:  false
					datasource: null
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 5
					}
					id: 161
					panels: []
					title: "Generic"
					type:  "row"
				},
				{
					aliasColors: {
						AVG_virtual_memory_bytes: "#508642"
						"Average Virtual Memory": "#f9d9f9"
						MAX_virtual_memory_bytes: "#e5ac0e"
						"Max Virtual Memory":     "#584477"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 8
						x: 0
						y: 6
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
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "Max Virtual Memory"
							fillBelowTo: "Min Virtual Memory"
							lines:       false
						},
						{
							alias: "Min Virtual Memory"
							lines: false
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_process_virtual_memory_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Min Virtual Memory"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_process_virtual_memory_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Average Virtual Memory"
							refId:          "B"
						},
						{
							expr:           "max(cilium_process_virtual_memory_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Max Virtual Memory"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Virtual Memory Bytes"
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
							format:  "bytes"
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
					aliasColors: MAX_resident_memory_bytes_max: "#e5ac0e"
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
						h: 5
						w: 8
						x: 8
						y: 6
					}
					hiddenSeries: false
					id:           24
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(cilium_process_resident_memory_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "AVG_resident_memory_bytes"
							refId:          "C"
						},
						{
							expr:           "max(cilium_process_resident_memory_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "MAX_resident_memory_bytes_max"
							refId:          "D"
						},
						{
							expr:           "min(cilium_process_resident_memory_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "MIN_resident_memory_bytes_min"
							refId:          "E"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Resident memory status"
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
							format:  "bytes"
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
					aliasColors: "all nodes": "#e5a8e2"
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
						h: 5
						w: 8
						x: 16
						y: 6
					}
					hiddenSeries: false
					id:           98
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "all nodes"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(cilium_process_open_fds{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "all nodes"
							refId:          "A"
						},
						{
							expr:           "min(cilium_process_open_fds{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min/node"
							refId:          "B"
						},
						{
							expr:           "avg(cilium_process_open_fds{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg/node"
							refId:          "C"
						},
						{
							expr:           "max(cilium_process_open_fds{k8s_app=\"cilium\"})"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max/node"
							refId:          "D"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Open file descriptors"
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
					aliasColors: MAX_resident_memory_bytes_max: "#e5ac0e"
					bars:        false
					dashLength:  10
					dashes:      false
					datasource:  "prometheus"
					description: "BPF memory usage in the entire system including components not managed by Cilium."
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 5
						w: 8
						x: 8
						y: 11
					}
					hiddenSeries: false
					id:           178
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(cilium_bpf_maps_virtual_memory_max_bytes{k8s_app=\"cilium\"} + cilium_bpf_progs_virtual_memory_max_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							hide:           false
							interval:       ""
							intervalFactor: 1
							legendFormat:   "AVG_bpf_memory_bytes_avg"
							refId:          "C"
						},
						{
							expr:           "max(cilium_bpf_maps_virtual_memory_max_bytes{k8s_app=\"cilium\"} + cilium_bpf_progs_virtual_memory_max_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							hide:           false
							interval:       ""
							intervalFactor: 1
							legendFormat:   "MAX_bpf_memory_bytes_max"
							refId:          "D"
						},
						{
							expr:           "min(cilium_bpf_maps_virtual_memory_max_bytes{k8s_app=\"cilium\"} + cilium_bpf_progs_virtual_memory_max_bytes{k8s_app=\"cilium\"})"
							format:         "time_series"
							hide:           false
							instant:        false
							interval:       ""
							intervalFactor: 1
							legendFormat:   "MIN_bpf_memory_bytes_min"
							refId:          "E"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "System-wide BPF memory usage"
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
							$$hashKey: "object:136"
							format:    "bytes"
							label:     null
							logBase:   1
							max:       null
							min:       null
							show:      true
						},
						{
							$$hashKey: "object:137"
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
					datasource: null
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 16
					}
					id: 155
					panels: []
					title: "API"
					type:  "row"
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
						h: 6
						w: 12
						x: 0
						y: 17
					}
					hiddenSeries: false
					id:           152
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
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_agent_api_process_time_seconds_sum{k8s_app=\"cilium\"}[1m])/rate(cilium_agent_api_process_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{path}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "API call latency (average node)"
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
						h: 6
						w: 12
						x: 12
						y: 17
					}
					hiddenSeries: false
					id:           153
					legend: {
						alignAsTable: true
						avg:          false
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "max(rate(cilium_agent_api_process_time_seconds_sum{k8s_app=\"cilium\"}[1m])/rate(cilium_agent_api_process_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{path}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "API call latency (max node)"
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
						h: 6
						w: 12
						x: 0
						y: 23
					}
					hiddenSeries: false
					id:           156
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
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_agent_api_process_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{path}} "
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "# API calls (average node)"
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
							format:  "ops"
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
						h: 6
						w: 12
						x: 12
						y: 23
					}
					hiddenSeries: false
					id:           157
					legend: {
						alignAsTable: true
						avg:          false
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "max(rate(cilium_agent_api_process_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{path}} "
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "# API calls (max node)"
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
							format:  "ops"
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
						h: 6
						w: 12
						x: 0
						y: 29
					}
					hiddenSeries: false
					id:           159
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
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_agent_api_process_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path, return_code)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{return_code}} ({{method}} {{path}} )"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "API return codes (average node)"
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
							format:  "ops"
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
						h: 6
						w: 12
						x: 12
						y: 29
					}
					hiddenSeries: false
					id:           158
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
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_agent_api_process_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path, return_code)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{return_code}} ({{method}} {{path}} )"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "API return codes (sum all nodes)"
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
							format:  "ops"
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
					collapsed:  false
					datasource: null
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 35
					}
					id: 72
					panels: []
					title: "Cilium"
					type:  "row"
				},
				{
					content:    ""
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 36
					}
					id: 144
					links: []
					mode:  "markdown"
					title: "BPF"
					type:  "text"
				},
				{
					aliasColors: {}
					bars:       true
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
						h: 8
						w: 12
						x: 0
						y: 37
					}
					hiddenSeries: false
					id:           146
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_bpf_syscall_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, operation)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "# system calls (average node)"
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
							format:  "ops"
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
					bars:       true
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					decimals:   2
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
						y: 37
					}
					hiddenSeries: false
					id:           145
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "max(rate(cilium_bpf_syscall_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, operation)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "# system calls (max node)"
					tooltip: {
						shared:     true
						sort:       2
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
							decimals: 0
							format:   "ops"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
						},
						{
							format:  "short"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    false
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
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 6
						w: 12
						x: 0
						y: 45
					}
					hiddenSeries: false
					id:           140
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_bpf_syscall_duration_seconds_sum{k8s_app=\"cilium\"}[1m])/ rate(cilium_bpf_syscall_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, operation)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "system call latency (avg node)"
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
						h: 6
						w: 12
						x: 12
						y: 45
					}
					hiddenSeries: false
					id:           148
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "max(rate(cilium_bpf_syscall_duration_seconds_sum{k8s_app=\"cilium\"}[1m])/ rate(cilium_bpf_syscall_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, operation)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "system call latency (max node)"
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
						h: 6
						w: 8
						x: 0
						y: 51
					}
					hiddenSeries: false
					id:           142
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						hideEmpty:    false
						hideZero:     true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(5, avg(rate(cilium_bpf_map_ops_total{k8s_app=\"cilium\"}[5m])) by (pod, map_name, operation))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{map_name}} {{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "map ops (average node)"
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
							format:  "ops"
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
						h: 6
						w: 8
						x: 8
						y: 51
					}
					hiddenSeries: false
					id:           147
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						hideEmpty:    false
						hideZero:     true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(5, max(rate(cilium_bpf_map_ops_total{k8s_app=\"cilium\"}[5m])) by (pod, map_name, operation))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{map_name}} {{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "map ops (max node)"
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
							format:  "ops"
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
						h: 6
						w: 8
						x: 16
						y: 51
					}
					hiddenSeries: false
					id:           143
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_bpf_map_ops_total{k8s_app=\"cilium\",outcome=\"fail\"}[5m])) by (pod, map_name, operation)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{map_name}} {{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "map ops (sum failures)"
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
							format:  "ops"
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
					content:    ""
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 57
					}
					id: 182
					links: []
					mode:  "markdown"
					title: "kvstore"
					type:  "text"
				},
				{
					aliasColors: {}
					bars:       true
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					decimals:   2
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 58
					}
					hiddenSeries: false
					id:           184
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(kvstore_operations_total{kubernetes_pod_name=~\"$pod\"}[1m])) by (pod, scope, action)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{scope}} {{action}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "# operations (sum all nodes)"
					tooltip: {
						shared:     true
						sort:       2
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
							decimals: 0
							format:   "ops"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					bars:       true
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					decimals:   2
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         1
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 58
					}
					hiddenSeries: false
					id:           186
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "max(rate(kvstore_operations_total{kubernetes_pod_name=~\"$pod\"}[1m])) by (pod, scope, action)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{scope}} {{action}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "# operations (max node)"
					tooltip: {
						shared:     true
						sort:       2
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
							decimals: 0
							format:   "ops"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
						h: 5
						w: 12
						x: 0
						y: 63
					}
					hiddenSeries: false
					id:           188
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(5, avg(rate(cilium_kvstore_operations_duration_seconds_sum{kubernetes_pod_name=~\"$pod\"}[1m])) by (pod, action, scope) / avg(rate(cilium_kvstore_operations_duration_seconds_count{kubernetes_pod_name=~\"$pod\"}[1m])) by (pod, action, scope))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} {{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "latency (average node)"
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
						h: 5
						w: 12
						x: 12
						y: 63
					}
					hiddenSeries: false
					id:           190
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(5, max(rate(cilium_kvstore_operations_duration_seconds_sum{kubernetes_pod_name=~\"$pod\"}[1m])) by (pod, action, scope) / avg(rate(cilium_kvstore_operations_duration_seconds_count{kubernetes_pod_name=~\"$pod\"}[1m])) by (pod, action, scope))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} {{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "latency (max node)"
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
						h: 6
						w: 12
						x: 0
						y: 68
					}
					hiddenSeries: false
					id:           192
					legend: {
						avg:       false
						current:   false
						hideEmpty: true
						hideZero:  true
						max:       false
						min:       false
						show:      true
						total:     false
						values:    false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kvstore_events_queue_seconds_count{kubernetes_pod_name=~\"$pod\"}[1m])) by (pod, scope, action)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} {{scope}}"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Events received (average node)"
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
							format:  "ops"
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
					content:    ""
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 74
					}
					id: 47
					links: []
					mode:  "markdown"
					title: "Cilium network information"
					type:  "text"
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
						h: 6
						w: 12
						x: 0
						y: 75
					}
					hiddenSeries: false
					id:           81
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_forward_count_total{k8s_app=\"cilium\"}[1m])) by (pod, direction)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{direction}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Forwarded Packets"
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
							format:  "pps"
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
						h: 6
						w: 12
						x: 12
						y: 75
					}
					hiddenSeries: false
					id:           111
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "EGRESS"
							yaxis: 1
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_forward_bytes_total{k8s_app=\"cilium\"}[1m])) by (pod, direction) * 8"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{direction}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Forwarded Traffic"
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
							format:  "bps"
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
					aliasColors: {
						"Alive  ipv4":             "#0a50a1"
						"Alive  ipv4 non-TCP":     "#f9d9f9"
						"Alive  ipv6":             "#614d93"
						"Alive  ipv6 TCP":         "#806eb7"
						"Alive  ipv6 non-TCP":     "#614d93"
						"Alive CT entries ipv6":   "#badff4"
						"Deleted CT entries ipv4": "#bf1b00"
						"Deleted ipv4":            "#890f02"
						"Deleted ipv4 non-TCP":    "#890f02"
						"Deleted ipv6":            "#bf1b00"
						"L7 denied request":       "#890f02"
						"L7 forwarded request":    "#7eb26d"
						avg:                       "#e0f9d7"
						deleted:                   "#6ed0e0"
						"deleted max":             "#447ebc"
						max:                       "#629e51"
						min:                       "#629e51"
					}
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
						h: 6
						w: 12
						x: 0
						y: 81
					}
					hiddenSeries: false
					id:           56
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "deleted"
							yaxis: 2
						},
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
						{
							alias: "deleted max"
							yaxis: 2
						},
						{
							alias: "deleted min"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv4\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv4\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv4\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv4\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted"
							refId:          "D"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv4\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted max"
							refId:          "E"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "IPv4 Conntrack TCP"
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
					aliasColors: {
						"Alive  ipv4":             "#0a50a1"
						"Alive  ipv4 non-TCP":     "#f9d9f9"
						"Alive  ipv6":             "#614d93"
						"Alive  ipv6 TCP":         "#806eb7"
						"Alive  ipv6 non-TCP":     "#614d93"
						"Alive CT entries ipv6":   "#badff4"
						"Deleted CT entries ipv4": "#bf1b00"
						"Deleted ipv4":            "#890f02"
						"Deleted ipv4 non-TCP":    "#890f02"
						"Deleted ipv6":            "#bf1b00"
						"L7 denied request":       "#890f02"
						"L7 forwarded request":    "#7eb26d"
						avg:                       "#e0f9d7"
						deleted:                   "#6ed0e0"
						"deleted max":             "#447ebc"
						max:                       "#629e51"
						min:                       "#629e51"
					}
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
						h: 6
						w: 12
						x: 12
						y: 81
					}
					hiddenSeries: false
					id:           128
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "deleted"
							yaxis: 2
						},
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
						{
							alias: "deleted max"
							yaxis: 2
						},
						{
							alias: "deleted min"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv6\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv6\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv6\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv6\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted"
							refId:          "D"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv6\", protocol=\"TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted max"
							refId:          "E"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "IPv6 Conntrack TCP"
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
					aliasColors: {
						"Alive  ipv4":             "#0a50a1"
						"Alive  ipv4 non-TCP":     "#f9d9f9"
						"Alive  ipv6":             "#614d93"
						"Alive  ipv6 TCP":         "#806eb7"
						"Alive  ipv6 non-TCP":     "#614d93"
						"Alive CT entries ipv6":   "#badff4"
						"Deleted CT entries ipv4": "#bf1b00"
						"Deleted ipv4":            "#890f02"
						"Deleted ipv4 non-TCP":    "#890f02"
						"Deleted ipv6":            "#bf1b00"
						"L7 denied request":       "#890f02"
						"L7 forwarded request":    "#7eb26d"
						avg:                       "#e0f9d7"
						deleted:                   "#6ed0e0"
						"deleted max":             "#447ebc"
						max:                       "#629e51"
						min:                       "#629e51"
					}
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
						h: 6
						w: 12
						x: 0
						y: 87
					}
					hiddenSeries: false
					id:           129
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "deleted"
							yaxis: 2
						},
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
						{
							alias: "deleted max"
							yaxis: 2
						},
						{
							alias: "deleted min"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv4\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv4\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv4\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv4\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted"
							refId:          "D"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv4\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted max"
							refId:          "E"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "IPv4 Conntrack Non-TCP"
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
					aliasColors: {
						"Alive  ipv4":             "#0a50a1"
						"Alive  ipv4 non-TCP":     "#f9d9f9"
						"Alive  ipv6":             "#614d93"
						"Alive  ipv6 TCP":         "#806eb7"
						"Alive  ipv6 non-TCP":     "#614d93"
						"Alive CT entries ipv6":   "#badff4"
						"Deleted CT entries ipv4": "#bf1b00"
						"Deleted ipv4":            "#890f02"
						"Deleted ipv4 non-TCP":    "#890f02"
						"Deleted ipv6":            "#bf1b00"
						"L7 denied request":       "#890f02"
						"L7 forwarded request":    "#7eb26d"
						avg:                       "#e0f9d7"
						deleted:                   "#6ed0e0"
						"deleted max":             "#447ebc"
						max:                       "#629e51"
						min:                       "#629e51"
					}
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
						h: 6
						w: 12
						x: 12
						y: 87
					}
					hiddenSeries: false
					id:           130
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "deleted"
							yaxis: 2
						},
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
						{
							alias: "deleted max"
							yaxis: 2
						},
						{
							alias: "deleted min"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv6\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv6\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"alive\", family=\"ipv6\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
						{
							expr:           "avg(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv6\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted"
							refId:          "D"
						},
						{
							expr:           "max(cilium_datapath_conntrack_gc_entries{k8s_app=\"cilium\", status=\"deleted\", family=\"ipv6\", protocol=\"non-TCP\"}) by (family,status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "deleted max"
							refId:          "E"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "IPv6 Conntrack Non-TCP"
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
					aliasColors: {
						ipv4: "#5195ce"
						ipv6: "#6d1f62"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					decimals:   null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 93
					}
					hiddenSeries: false
					id:           87
					legend: {
						alignAsTable: true
						avg:          true
						current:      true
						max:          true
						min:          true
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: ""
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(cilium_ip_addresses{k8s_app=\"cilium\"}) by (pod, family)\n"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{family}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Allocated Addresses"
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
					aliasColors: {
						"dump_interrupts conntrack ipv4": "#ea6460"
						"dump_interrupts conntrack ipv6": "#58140c"
					}
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
						h: 5
						w: 12
						x: 12
						y: 93
					}
					hiddenSeries: false
					id:           79
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(cilium_datapath_errors_total{k8s_app=\"cilium\"}) by (pod, area, family, name)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{name}} {{area}} {{family}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Datapath Errors"
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
						h: 5
						w: 12
						x: 0
						y: 98
					}
					hiddenSeries: false
					id:           106
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_services_events_total{k8s_app=\"cilium\"}[1m])) by (pod, action)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Service Updates"
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
							format:  "ops"
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
						h: 5
						w: 12
						x: 12
						y: 98
					}
					hiddenSeries: false
					id:           89
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "avg(cilium_unreachable_health_endpoints) by (pod)"
							yaxis: 2
						},
						{
							alias: "average unreachable health endpoints"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(cilium_unreachable_nodes{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "unreachable nodes"
							refId:          "A"
						},
						{
							expr:           "sum(cilium_unreachable_health_endpoints{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "unreachable health endpoints"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Connectivity Health"
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
						h: 5
						w: 12
						x: 0
						y: 103
					}
					hiddenSeries: false
					id:           39
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_drop_count_total{direction=\"EGRESS\", k8s_app=\"cilium\"}[1m])) by (reason)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{reason}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Dropped Egress Packets"
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
							format:  "ops"
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
					aliasColors: {
						Avg: "#cca300"
						Max: "rgb(167, 150, 111)"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 103
					}
					hiddenSeries: false
					id:           93
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "Max"
							fillBelowTo: "Min"
							lines:       false
						},
						{
							alias: "Min"
							lines: false
						},
						{
							alias: "add k8s"
							yaxis: 2
						},
						{
							alias: "delete k8s"
							yaxis: 2
						},
						{
							alias: "update k8s"
							yaxis: 2
						},
						{
							alias: "add local-node"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_nodes_all_events_received_total{k8s_app=\"cilium\"}[1m])) by (pod, event_type, source) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{event_type}} {{source}}"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Node Events"
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
							format:  "opm"
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
						h: 5
						w: 12
						x: 0
						y: 108
					}
					hiddenSeries: false
					id:           113
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_drop_bytes_total{direction=\"EGRESS\", k8s_app=\"cilium\"}[1m])) by (reason) * 8"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{reason}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Dropped Egress Traffic"
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
							format:  "bps"
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
					aliasColors: {
						"Average Nodes": "#eab839"
						"Max Nodes":     "#c15c17"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 108
					}
					hiddenSeries: false
					id:           91
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "Max Nodes"
							fillBelowTo: "Min Nodes"
							lines:       false
						},
						{
							alias: "Min Nodes"
							lines: false
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(cilium_nodes_all_num{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Average Nodes"
							refId:          "A"
						},
						{
							expr:           "min(cilium_nodes_all_num{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Min Nodes"
							refId:          "B"
						},
						{
							expr:           "max(cilium_nodes_all_num{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Max Nodes"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Nodes"
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
					content:    ""
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 113
					}
					id: 28
					links: []
					mode:  "markdown"
					title: "Policy"
					type:  "text"
				},
				{
					aliasColors: {
						"L7 denied request":    "#ea6460"
						"L7 forwarded request": "#7eb26d"
						denied:                 "#bf1b00"
					}
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
						h: 5
						w: 12
						x: 0
						y: 114
					}
					hiddenSeries: false
					id:           53
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "L7 denied request"
							yaxis: 2
						},
						{
							alias: "denied"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_policy_l7_denied_total{k8s_app=\"cilium\"}[1m]))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "denied"
							refId:          "A"
						},
						{
							expr:           "sum(rate(cilium_policy_l7_forwarded_total{k8s_app=\"cilium\"}[1m]))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "forwarded"
							refId:          "B"
						},
						{
							expr:           "sum(rate(cilium_policy_l7_received_total{k8s_app=\"cilium\"}[1m]))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "received"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "L7 forwarded request"
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
							format:  "reqps"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "reqps"
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
						h: 5
						w: 12
						x: 12
						y: 114
					}
					hiddenSeries: false
					id:           37
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_drop_count_total{direction=\"INGRESS\", k8s_app=\"cilium\"}[5m])) by (reason)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{reason}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Cilium drops Ingress"
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
							format:  "ops"
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
					aliasColors: {
						"Max per node processingTime":                                                 "#e24d42"
						"Max per node upstreamTime":                                                   "#58140c"
						"avg(cilium_policy_l7_parse_errors_total{kubernetes_pod_name=~\"cilium.*\"})": "#bf1b00"
						"parse errors":                                                                "#bf1b00"
					}
					bars:       true
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
						h: 5
						w: 12
						x: 0
						y: 119
					}
					hiddenSeries: false
					id:           94
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "Max per node processingTime"
							yaxis: 2
						},
						{
							alias: "Max per node upstreamTime"
							yaxis: 2
						},
						{
							alias: "avg(cilium_policy_l7_parse_errors_total{kubernetes_pod_name=~\"cilium.*\"})"
							yaxis: 2
						},
						{
							alias: "parse errors"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_proxy_upstream_reply_seconds_sum{k8s_app=\"cilium\"}[1m])) by (pod, scope) / sum(rate(cilium_proxy_upstream_reply_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, scope)"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "{{scope}}"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_policy_l7_parse_errors_total{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "parse errors"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Proxy response time (Avg)"
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
						h: 5
						w: 12
						x: 12
						y: 119
					}
					hiddenSeries: false
					id:           114
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_drop_bytes_total{direction=\"INGRESS\", k8s_app=\"cilium\"}[1m])) by (reason) * 8"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{reason}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Dropped Ingress Traffic"
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
							format:  "bps"
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
					aliasColors: {
						avg:   "#64b0c8"
						count: "#9ac48a"
						max:   "#5195ce"
						min:   "#6ed0e0"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 124
					}
					hiddenSeries: false
					id:           104
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
						{
							alias: "avg count"
							yaxis: 2
						},
						{
							alias: "max count"
							yaxis: 2
						},
						{
							alias: "avg count"
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(rate(cilium_triggers_policy_update_call_duration_seconds_sum{k8s_app=\"cilium\"}[1m])) by (pod, scope) / sum(rate(cilium_triggers_policy_update_call_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, scope)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(rate(cilium_triggers_policy_update_call_duration_seconds_sum{k8s_app=\"cilium\"}[1m])) by (pod, scope) / sum(rate(cilium_triggers_policy_update_call_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, scope)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(rate(cilium_triggers_policy_update_call_duration_seconds_sum{k8s_app=\"cilium\"}[1m])) by (pod, scope) / sum(rate(cilium_triggers_policy_update_call_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, scope)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Policy Trigger Duration"
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
							format:  "opm"
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
					aliasColors: {
						"Max per node processingTime": "#e24d42"
						"Max per node upstreamTime":   "#58140c"
						"parse errors":                "#bf1b00"
					}
					bars:       true
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
						h: 5
						w: 12
						x: 12
						y: 124
					}
					hiddenSeries: false
					id:           66
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "parse errors"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "max(rate(cilium_proxy_upstream_reply_seconds_sum{k8s_app=\"cilium\"}[1m])) by (pod, scope) / sum(rate(cilium_proxy_upstream_reply_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, scope)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Max {{scope}}"
							refId:          "B"
						},
						{
							expr:           "max(rate(cilium_policy_l7_parse_errors_total{k8s_app=\"cilium\"}[1m])) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "parse errors"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Proxy response time (Max)"
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
					aliasColors: {
						both:    "#7eb26d"
						egress:  "#e5ac0e"
						ingress: "#e0752d"
						none:    "#bf1b00"
					}
					bars:       true
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
						h: 5
						w: 6
						x: 0
						y: 129
					}
					hiddenSeries: false
					id:           33
					legend: {
						alignAsTable: false
						avg:          false
						current:      true
						max:          false
						min:          false
						rightSide:    true
						show:         true
						sideWidth:    null
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(cilium_policy_endpoint_enforcement_status{k8s_app=\"cilium\"}) by (enforcement)"
							format:         "time_series"
							hide:           false
							instant:        true
							interval:       "1s"
							intervalFactor: 1
							legendFormat:   "{{enforcement}}"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Endpoints policy enforcement status"
					tooltip: {
						shared:     false
						sort:       0
						value_type: "individual"
					}
					type: "graph"
					xaxis: {
						buckets: null
						mode:    "series"
						name:    null
						show:    true
						values: [
							"total",
						]
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
					aliasColors: {
						avg: "#b7dbab"
						max: "rgba(89, 132, 76, 0.54)"
						min: "#2f575e"
					}
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
						h: 5
						w: 6
						x: 6
						y: 129
					}
					hiddenSeries: false
					id:           100
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_proxy_redirects{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_proxy_redirects{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(cilium_proxy_redirects{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Proxy Redirects"
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
					aliasColors: {
						"average duration": "#d683ce"
						folds:              "#614d93"
						"max duration":     "#614d93"
						"max trigger":      "#967302"
						"min duration":     "#584477"
						"min trigger":      "#fceaca"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         2
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 129
					}
					hiddenSeries: false
					id:           102
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "max"
							fillBelowTo: "min trigger"
							lines:       false
						},
						{
							alias: "min trigger"
							lines: false
						},
						{
							alias: "folds"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(rate(cilium_triggers_policy_update_total{k8s_app=\"cilium\"}[1m])) by (pod) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min trigger"
							refId:          "A"
						},
						{
							expr:           "avg(rate(cilium_triggers_policy_update_total{k8s_app=\"cilium\"}[1m])) by (pod) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "average trigger"
							refId:          "B"
						},
						{
							expr:           "max(rate(cilium_triggers_policy_update_total{k8s_app=\"cilium\"}[1m])) by (pod) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max trigger"
							refId:          "C"
						},
						{
							expr:           "max(rate(cilium_triggers_policy_update_folds{k8s_app=\"cilium\"}[1m])) by (pod) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "folds"
							refId:          "D"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Policy Trigger Runs"
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
							format:  "opm"
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
					aliasColors: {
						max:                    "#f2c96d"
						"policy errors":        "#bf1b00"
						"policy import errors": "#bf1b00"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 134
					}
					hiddenSeries: false
					id:           85
					legend: {
						alignAsTable: false
						avg:          false
						current:      true
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "policy errors"
							yaxis: 2
						},
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
						{
							alias: "policy import errors"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_policy{k8s_app=\"cilium\"}) by(pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_policy{k8s_app=\"cilium\"}) by(pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(cilium_policy{k8s_app=\"cilium\"}) by(pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
						{
							expr:           "sum(cilium_policy_import_errors_total{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "policy import errors"
							refId:          "D"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Policies Per Node"
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
					aliasColors: {
						"Max per node processingTime": "#e24d42"
						"Max per node upstreamTime":   "#58140c"
						"parse errors":                "#bf1b00"
					}
					bars:       true
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
						h: 5
						w: 12
						x: 12
						y: 134
					}
					hiddenSeries: false
					id:           123
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "parse errors"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_proxy_upstream_reply_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, scope)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{scope}}"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "DNS proxy requests"
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
							format:  "ops"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "s"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {
						avg: "#f9d9f9"
						max: "#806eb7"
						min: "#806eb7"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 139
					}
					hiddenSeries: false
					id:           117
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(cilium_policy_max_revision{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(cilium_policy_max_revision{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(cilium_policy_max_revision{k8s_app=\"cilium\"}) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Policy Revision"
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
					content:    ""
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 144
					}
					id: 73
					links: []
					mode:  "markdown"
					title: "Endpoints"
					type:  "text"
				},
				{
					aliasColors: {}
					bars:       true
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					decimals:   null
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
						y: 145
					}
					hiddenSeries: false
					id:           55
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(histogram_quantile(0.90, rate(cilium_endpoint_regeneration_time_stats_seconds_bucket{k8s_app=\"cilium\", scope!=\"total\"}[5m]))) by (scope)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Endpoint regeneration time (90th percentile)"
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
					bars:       true
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					decimals:   null
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
						y: 145
					}
					hiddenSeries: false
					id:           115
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(histogram_quantile(0.99, rate(cilium_endpoint_regeneration_time_stats_seconds_bucket{k8s_app=\"cilium\", scope!=\"total\"}[5m]))) by (scope)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Endpoint regeneration time (99th percentile)"
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
					aliasColors: {
						fail:          "#bf1b00"
						"fail/min":    "#890f02"
						success:       "#447ebc"
						"success/min": "#3f6833"
					}
					bars:       true
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         3
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 154
					}
					hiddenSeries: false
					id:           49
					legend: {
						avg:     true
						current: false
						max:     true
						min:     false
						show:    true
						total:   false
						values:  true
					}
					lines:     false
					linewidth: 2
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "fail"
							yaxis: 2
						},
						{
							alias: "success"
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_endpoint_regenerations_total{k8s_app=\"cilium\"}[30s])) by(outcome)"
							format:         "time_series"
							instant:        false
							intervalFactor: 1
							legendFormat:   "{{outcome}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Endpoint regenerations"
					tooltip: {
						shared:     false
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
							format:  "opm"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "opm"
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
					aliasColors: {
						disconnecting:           "#614d93"
						ready:                   "rgba(81, 220, 95, 0.52)"
						"waiting-to-regenerate": "#0a50a1"
					}
					bars:       true
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
						h: 5
						w: 12
						x: 12
						y: 154
					}
					hiddenSeries: false
					id:           51
					legend: {
						alignAsTable: false
						avg:          false
						current:      true
						max:          false
						min:          false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 2
					links: []
					nullPointMode: "connected"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(cilium_endpoint_state{k8s_app=\"cilium\"}) by (endpoint_state)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{endpoint_state}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Cilium endpoint state"
					tooltip: {
						shared:     false
						sort:       0
						value_type: "cumulative"
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
					content:    ""
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 159
					}
					id: 74
					links: []
					mode:  "markdown"
					title: "Controllers"
					type:  "text"
				},
				{
					aliasColors: {
						Failed:  "#bf1b00"
						Failing: "#890f02"
						Runs:    "#5195ce"
					}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         3
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 160
					}
					hiddenSeries: false
					id:           70
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						max:          true
						min:          false
						show:         true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "Failing"
							yaxis: 1
						},
						{
							alias: "Failed"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_controllers_runs_total{k8s_app=\"cilium\"}[1m])) by (pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Runs"
							refId:          "A"
						},
						{
							expr:           "sum(cilium_controllers_failing{k8s_app=\"cilium\"}) by(pod)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "Failed"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Controllers"
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
							format:  "opm"
							label:   null
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "opm"
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
					aliasColors: {
						"duration failure": "#890f02"
						"duration success": "#508642"
						failure:            "#890f02"
						"runs failure":     "#890f02"
						"runs success":     "#7eb26d"
						success:            "#508642"
					}
					bars:       true
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
						h: 5
						w: 12
						x: 12
						y: 160
					}
					hiddenSeries: false
					id:           68
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						hideEmpty:    false
						max:          true
						min:          true
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:      10
					percentage:      false
					pointradius:     5
					points:          false
					renderer:        "flot"
					repeat:          null
					repeatDirection: "h"
					seriesOverrides: [
						{
							alias: "success"
							yaxis: 1
						},
						{
							alias: "failure"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_controllers_runs_duration_seconds_sum{k8s_app=\"cilium\"}[1m])) by (pod, status) / sum(rate(cilium_controllers_runs_duration_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{status}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Controller Durations"
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
							label:   ""
							logBase: 1
							max:     null
							min:     null
							show:    true
						},
						{
							format:  "s"
							label:   ""
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
					content:    ""
					datasource: null
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 165
					}
					id: 60
					links: []
					mode:  "markdown"
					title: "Kubernetes integration"
					type:  "text"
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
						h: 7
						w: 12
						x: 0
						y: 166
					}
					hiddenSeries: false
					id:           163
					legend: {
						alignAsTable: true
						avg:          false
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          false
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_k8s_client_api_latency_time_seconds_sum{k8s_app=\"cilium\"}[1m])/rate(cilium_k8s_client_api_latency_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{path}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "apiserver latency (average node)"
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
						h: 7
						w: 12
						x: 12
						y: 166
					}
					hiddenSeries: false
					id:           165
					legend: {
						alignAsTable: true
						avg:          false
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          false
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "max(rate(cilium_k8s_client_api_latency_time_seconds_sum{k8s_app=\"cilium\"}[1m])/rate(cilium_k8s_client_api_latency_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{path}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "apiserver latency (max node)"
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
					bars:       true
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
						h: 8
						w: 12
						x: 0
						y: 173
					}
					hiddenSeries: false
					id:           168
					legend: {
						alignAsTable: true
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_k8s_client_api_latency_time_seconds_count{k8s_app=\"cilium\"}[1m])) by (pod, method, path)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{path}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "apiserver #calls (sum all nodes)"
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
							format:  "ops"
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
					bars:       true
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
						h: 8
						w: 12
						x: 12
						y: 173
					}
					hiddenSeries: false
					id:           166
					legend: {
						alignAsTable: true
						avg:          false
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          true
						min:          false
						rightSide:    true
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_k8s_client_api_calls_total{k8s_app=\"cilium\"}[1m])) by (pod, method, return_code)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}} {{return_code}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "apiserver calls (sum all nodes)"
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
							format:  "ops"
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
					bars:       true
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
						h: 6
						w: 12
						x: 0
						y: 181
					}
					hiddenSeries: false
					id:           172
					legend: {
						alignAsTable: false
						avg:          true
						current:      false
						hideEmpty:    true
						hideZero:     true
						max:          false
						min:          false
						show:         true
						total:        false
						values:       true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_kubernetes_events_received_total{k8s_app=\"cilium\", equal=\"true\", valid=\"true\"}[5m])) by (pod, scope, action)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} {{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Valid, Unnecessary K8s Events Received"
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
							format:  "ops"
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
					bars:       true
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
						h: 6
						w: 12
						x: 12
						y: 181
					}
					hiddenSeries: false
					id:           174
					legend: {
						avg:       true
						current:   false
						hideEmpty: true
						hideZero:  true
						max:       false
						min:       false
						show:      true
						total:     false
						values:    true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_kubernetes_events_received_total{k8s_app=\"cilium\", equal=\"true\", valid=\"false\"}[5m])) by (pod, scope, action)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} {{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Invalid, Unnecessary K8s Events Received"
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
					bars:       true
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
						h: 8
						w: 12
						x: 0
						y: 187
					}
					hiddenSeries: false
					id:           175
					legend: {
						avg:       true
						current:   false
						hideEmpty: true
						hideZero:  true
						max:       false
						min:       false
						show:      true
						total:     false
						values:    true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_kubernetes_events_received_total{k8s_app=\"cilium\", equal=\"false\", valid=\"true\"}[5m])) by (pod, scope, action, valid)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} {{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Valid, Necessary K8s Events Received"
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
							format:  "ops"
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
					bars:       true
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
						h: 8
						w: 12
						x: 12
						y: 187
					}
					hiddenSeries: false
					id:           173
					legend: {
						avg:       true
						current:   false
						hideEmpty: true
						hideZero:  true
						max:       false
						min:       false
						show:      true
						total:     false
						values:    true
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(cilium_kubernetes_events_received_total{k8s_app=\"cilium\", equal=\"false\", valid=\"false\"}[5m])) by (pod, scope, action)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} {{scope}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Invalid, Necessary K8s Events Received"
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
							format:  "ops"
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
					bars:       true
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
						h: 7
						w: 12
						x: 0
						y: 195
					}
					hiddenSeries: false
					id:           108
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kubernetes_events_total{k8s_app=\"cilium\", scope=\"CiliumNetworkPolicy\"}[1m])) by (pod, action) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} avg"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "CiliumNetworkPolicy Events"
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
							format:  "opm"
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
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {
						"create avg": "#70dbed"
						"delete avg": "#e24d42"
						"update avg": "#e0f9d7"
					}
					bars:       true
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
						h: 7
						w: 12
						x: 12
						y: 195
					}
					hiddenSeries: false
					id:           119
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kubernetes_events_total{k8s_app=\"cilium\", scope=\"NetworkPolicy\"}[1m])) by (pod, action) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} avg"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "NetworkPolicy Events"
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
							format:  "opm"
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
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {
						"create avg": "#70dbed"
						"delete avg": "#e24d42"
						"update avg": "#e0f9d7"
					}
					bars:       true
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
						h: 7
						w: 12
						x: 0
						y: 202
					}
					hiddenSeries: false
					id:           109
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kubernetes_events_total{k8s_app=\"cilium\", scope=\"Pod\"}[1m])) by (pod, action) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} avg"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Pod Events"
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
							format:  "opm"
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
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {
						"create avg": "#70dbed"
						"delete avg": "#e24d42"
						"update avg": "#e0f9d7"
					}
					bars:       true
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
						h: 7
						w: 12
						x: 12
						y: 202
					}
					hiddenSeries: false
					id:           122
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kubernetes_events_total{k8s_app=\"cilium\", scope=\"Node\"}[1m])) by (pod, action) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}} avg"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Node Events"
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
							format:  "opm"
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
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:       true
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
						h: 7
						w: 12
						x: 0
						y: 209
					}
					hiddenSeries: false
					id:           118
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kubernetes_events_total{k8s_app=\"cilium\", scope=\"Service\"}[1m])) by (pod, action) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}}"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Service Events"
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
							format:  "opm"
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
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:       true
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
						h: 7
						w: 12
						x: 12
						y: 209
					}
					hiddenSeries: false
					id:           120
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kubernetes_events_total{k8s_app=\"cilium\", scope=\"Endpoint\"}[1m])) by (pod, action) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}}"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Endpoints Events"
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
							format:  "opm"
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
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
				{
					aliasColors: {}
					bars:       true
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
						h: 7
						w: 12
						x: 0
						y: 216
					}
					hiddenSeries: false
					id:           121
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     false
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_kubernetes_events_total{k8s_app=\"cilium\", scope=\"Namespace\"}[1m])) by (pod, action) * 60"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{action}}"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Namespace Events"
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
							format:  "opm"
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
							show:    false
						},
					]
					yaxis: {
						align:      false
						alignLevel: null
					}
				},
			]
			refresh:       false
			schemaVersion: 25
			style:         "dark"
			tags: []
			templating: list: [
				{
					allValue: "cilium.*"
					current: {
						selected: false
						text:     "All"
						value:    "$__all"
					}
					datasource: "prometheus"
					definition: "label_values(kube_pod_created{pod=~\"^cilium-[a-z|A-Z|0-9]+$\"},pod)"
					hide:       0
					includeAll: true
					label:      null
					multi:      false
					name:       "pod"
					options: []
					query:          "label_values(kube_pod_created{pod=~\"^cilium-[a-z|A-Z|0-9]+$\"},pod)"
					refresh:        2
					regex:          ""
					skipUrlSync:    false
					sort:           1
					tagValuesQuery: ""
					tags: []
					tagsQuery: ""
					type:      "query"
					useTags:   false
				},
			]
			time: {
				from: "now-30m"
				to:   "now"
			}
			timepicker: {
				refresh_intervals: [
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
				time_options: [
					"5m",
					"15m",
					"1h",
					"6h",
					"12h",
					"24h",
					"2d",
					"7d",
					"30d",
				]
			}
			timezone: "utc"
			title:    "Cilium Metrics"
			uid:      "vtuWtdumz"
			version:  1
		}
	}
}
k: ConfigMap: "grafana-cilium-operator-dashboard": {
	metadata: {
		labels: grafana_dashboard: "cilium"
		namespace: "monitoring"
	}
	data: {
		"cilium-operator-dashboard.json": json656e63.Marshal(_cue_cilium_operator_dashboard_json)
		let _cue_cilium_operator_dashboard_json = {
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
			id:           8
			links: []
			panels: [
				{
					aliasColors: avg: "#cffaff"
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fieldConfig: {
						defaults: custom: {}
						overrides: []
					}
					fill:         0
					fillGradient: 0
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 0
					}
					hiddenSeries: false
					id:           24
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "max"
							fillBelowTo: "min"
							lines:       false
						},
						{
							alias: "min"
							lines: false
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "min(irate(cilium_operator_process_cpu_seconds_total{io_cilium_app=\"operator\"}[1m])) by (pod) * 100"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "A"
						},
						{
							expr:           "avg(irate(cilium_operator_process_cpu_seconds_total{io_cilium_app=\"operator\"}[1m])) by (pod) * 100"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "B"
						},
						{
							expr:           "max(irate(cilium_operator_process_cpu_seconds_total{io_cilium_app=\"operator\"}[1m])) by (pod) * 100"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "CPU Usage per node"
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
							format:  "percent"
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
					aliasColors: MAX_resident_memory_bytes_max: "#e5ac0e"
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
						h: 5
						w: 12
						x: 12
						y: 0
					}
					hiddenSeries: false
					id:           26
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 5
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(cilium_operator_process_resident_memory_bytes{io_cilium_app=\"operator\"})"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "AVG_resident_memory_bytes"
							refId:          "C"
						},
						{
							expr:           "max(cilium_operator_process_resident_memory_bytes{io_cilium_app=\"operator\"})"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "MAX_resident_memory_bytes_max"
							refId:          "D"
						},
						{
							expr:           "min(cilium_operator_process_resident_memory_bytes{io_cilium_app=\"operator\"})"
							format:         "time_series"
							interval:       ""
							intervalFactor: 1
							legendFormat:   "MIN_resident_memory_bytes_min"
							refId:          "E"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Resident memory status"
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
							format:  "bytes"
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
					collapsed:  false
					datasource: null
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 5
					}
					id: 6
					panels: []
					title: "ENI"
					type:  "row"
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
						h: 8
						w: 12
						x: 0
						y: 6
					}
					hiddenSeries: false
					id:           8
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "avg(cilium_operator_eni_ips) by (type)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{type}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "IP Addresses"
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
						h: 8
						w: 12
						x: 12
						y: 6
					}
					hiddenSeries: false
					id:           10
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "rate(cilium_operator_eni_aws_api_duration_seconds_sum[1m])/rate(cilium_operator_eni_aws_api_duration_seconds_count[1m])"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{operation}} {{response_code}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "EC2 API Interactions"
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
							format:  "dtdurations"
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
						h: 7
						w: 8
						x: 0
						y: 14
					}
					hiddenSeries: false
					id:           4
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "cilium_operator_eni_nodes"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{category}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Number of nodes"
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
						h: 7
						w: 8
						x: 8
						y: 14
					}
					hiddenSeries: false
					id:           12
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "cilium_operator_eni_available"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "ENIs"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "# ENIs with addresses available"
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
						h: 7
						w: 8
						x: 16
						y: 14
					}
					hiddenSeries: false
					id:           16
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "rate(cilium_operator_eni_resync_total[1m])"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "operations"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Metadata Resync Operations"
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
							format:  "ops"
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
						h: 8
						w: 12
						x: 0
						y: 21
					}
					hiddenSeries: false
					id:           14
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
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "rate(cilium_operator_ec2_rate_limit_duration_seconds_sum[1m])/rate(cilium_operator_ec2_rate_limit_duration_seconds_count[1m])"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{operation}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "EC2 client side rate limiting"
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
							format:  "reqps"
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
						h: 8
						w: 12
						x: 12
						y: 21
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
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: dataLinks: []
					paceLength:  10
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(rate(cilium_operator_eni_interface_creation_ops[1m])) by (subnetId, status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{status}} ({{subnetId}})"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "ENI Creation"
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
							format:  "ops"
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
			refresh:       false
			schemaVersion: 25
			style:         "dark"
			tags: []
			templating: list: []
			time: {
				from: "now-30m"
				to:   "now"
			}
			timepicker: {
				refresh_intervals: [
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
				time_options: [
					"5m",
					"15m",
					"1h",
					"6h",
					"12h",
					"24h",
					"2d",
					"7d",
					"30d",
				]
			}
			timezone: ""
			title:    "Cilium Operator"
			uid:      "1GC0TT4Wz"
			version:  2
		}
	}
}
k: ConfigMap: "grafana-hubble-dashboard": {
	metadata: {
		labels: grafana_dashboard: "cilium"
		namespace: "monitoring"
	}
	data: {
		"hubble-dashboard.json": json656e63.Marshal(_cue_hubble_dashboard_json)
		let _cue_hubble_dashboard_json = {
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
			id:           3
			links: []
			panels: [
				{
					collapsed: false
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 0
					}
					id: 14
					panels: []
					title: "General Processing"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 1
					}
					id: 12
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias:       "max"
							fillBelowTo: "avg"
							lines:       false
						},
						{
							alias:       "avg"
							fill:        0
							fillBelowTo: "min"
						},
						{
							alias: "min"
							lines: false
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "avg(sum(rate(hubble_flows_processed_total[1m])) by (pod))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "avg"
							refId:          "A"
						},
						{
							expr:           "min(sum(rate(hubble_flows_processed_total[1m])) by (pod))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "min"
							refId:          "B"
						},
						{
							expr:           "max(sum(rate(hubble_flows_processed_total[1m])) by (pod))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "max"
							refId:          "C"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Flows processed Per Node"
					tooltip: {
						shared:     true
						sort:       1
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
							format:  "ops"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 1
					}
					id: 32
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_flows_processed_total[1m])) by (pod, type)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{type}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Flows Types"
					tooltip: {
						shared:     true
						sort:       2
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
							format:  "ops"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 6
					}
					id: 59
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_flows_processed_total{type=\"L7\"}[1m])) by (pod, subtype)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{subtype}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "L7 Flow Distribution"
					tooltip: {
						shared:     true
						sort:       2
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
							format:  "ops"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 6
					}
					id: 60
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_flows_processed_total{type=\"Trace\"}[1m])) by (pod, subtype)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{subtype}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Trace Flow Distribution"
					tooltip: {
						shared:     true
						sort:       2
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
							format:  "ops"
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
					collapsed: false
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 11
					}
					id: 16
					panels: []
					title: "Network"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 12
					}
					id: 33
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_flows_processed_total[1m])) by (pod, verdict)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{verdict}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Forwarded vs Dropped"
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
							format:  "ops"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 12
					}
					id: 8
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_drop_total[1m])) by (pod, reason)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{reason}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Drop Reason"
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 17
					}
					id: 34
					legend: {
						avg:       false
						current:   false
						max:       false
						min:       false
						rightSide: true
						show:      true
						total:     false
						values:    false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: {}
					percentage:  true
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum (rate(hubble_port_distribution_total[1m])) by (pod, protocol)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{protocol}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Protocol Usage"
					tooltip: {
						shared:     true
						sort:       2
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 17
					}
					id: 18
					legend: {
						alignAsTable: true
						avg:          false
						current:      true
						hideEmpty:    false
						hideZero:     false
						max:          false
						min:          false
						rightSide:    true
						show:         true
						sort:         "current"
						sortDesc:     true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "topk(10, sum (rate(hubble_port_distribution_total{port!=\"0\"}[1m])) by (pod, port, protocol))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{port}}/{{protocol}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Top 10 Port Distribution"
					tooltip: {
						shared:     true
						sort:       2
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 22
					}
					id: 10
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "fin"
							yaxis: 1
						},
						{
							alias: "FIN"
							yaxis: 2
						},
						{
							alias: "RST"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_tcp_flags_total{family=\"IPv4\"}[1m])) by (pod, flag)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{flag}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "TCPv4"
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
							format:  "pps"
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
					alert: {
						conditions: [
							{
								evaluator: {
									params: [
										0.2,
									]
									type: "gt"
								}
								operator: type: "and"
								query: params: [
									"B",
									"5m",
									"now",
								]
								reducer: {
									params: []
									type: "avg"
								}
								type: "query"
							},
						]
						executionErrorState: "alerting"
						for:                 "5m"
						frequency:           "1m"
						handler:             1
						name:                "Missing TCP SYN-ACK"
						noDataState:         "no_data"
						notifications: []
					}
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 22
					}
					id: 62
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "fin"
							yaxis: 1
						},
						{
							alias: "FIN"
							yaxis: 2
						},
						{
							alias: "RST"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_tcp_flags_total{family=\"IPv4\", flag=\"SYN\"}[1m])) by (pod) - sum(rate(hubble_tcp_flags_total{family=\"IPv4\", flag=\"SYN-ACK\"}[1m])) by (pod)"
							format:         "time_series"
							hide:           false
							intervalFactor: 1
							legendFormat:   "Missing SYN-ACK"
							refId:          "B"
						},
					]
					thresholds: [
						{
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     0.2
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Missing TCPv4 SYN-ACKs"
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 27
					}
					id: 35
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "fin"
							yaxis: 1
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_tcp_flags_total{family=\"IPv6\"}[1m])) by (pod, flag)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{flag}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "TCPv6"
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
							format:  "pps"
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
					alert: {
						conditions: [
							{
								evaluator: {
									params: [
										0.2,
									]
									type: "gt"
								}
								operator: type: "and"
								query: params: [
									"B",
									"5m",
									"now",
								]
								reducer: {
									params: []
									type: "avg"
								}
								type: "query"
							},
						]
						executionErrorState: "alerting"
						for:                 "5m"
						frequency:           "1m"
						handler:             1
						name:                "Missing TCPv6 SYN-ACKs alert"
						noDataState:         "no_data"
						notifications: []
					}
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 27
					}
					id: 63
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: [
						{
							alias: "fin"
							yaxis: 1
						},
						{
							alias: "FIN"
							yaxis: 2
						},
						{
							alias: "RST"
							yaxis: 2
						},
					]
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_tcp_flags_total{family=\"IPv6\", flag=\"SYN\"}[1m])) by (pod) - sum(rate(hubble_tcp_flags_total{family=\"IPv6\", flag=\"SYN-ACK\"}[1m])) by (pod)"
							format:         "time_series"
							hide:           false
							intervalFactor: 1
							legendFormat:   "Missing SYN-ACK"
							refId:          "B"
						},
					]
					thresholds: [
						{
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     0.2
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Missing TCPv6 SYN-ACKs"
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 32
					}
					id: 31
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_icmp_total{family=\"IPv4\"}[1m])) by (pod, type)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{type}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "ICMPv4"
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
					alert: {
						conditions: [
							{
								evaluator: {
									params: [
										0.1,
									]
									type: "gt"
								}
								operator: type: "and"
								query: params: [
									"B",
									"5m",
									"now",
								]
								reducer: {
									params: []
									type: "avg"
								}
								type: "query"
							},
						]
						executionErrorState: "alerting"
						for:                 "5m"
						frequency:           "1m"
						handler:             1
						name:                "Missing ICMPv4 Echo-Reply alert"
						noDataState:         "no_data"
						notifications: []
					}
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 32
					}
					id: 64
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_icmp_total{family=\"IPv4\", type=\"EchoRequest\"}[1m])) by (pod) - sum(rate(hubble_icmp_total{family=\"IPv4\", type=\"EchoReply\"}[1m])) by (pod)"
							format:         "time_series"
							hide:           false
							intervalFactor: 1
							legendFormat:   "Missing ICMP Echo-Reply"
							refId:          "B"
						},
					]
					thresholds: [
						{
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     0.1
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Missing ICMPv4 Echo-Reply"
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 37
					}
					id: 36
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_icmp_total{family=\"IPv6\"}[1m])) by (pod, type)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{type}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "ICMPv6"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 37
					}
					id: 65
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_icmp_total{family=\"IPv6\", type=\"EchoRequest\"}[1m])) by (pod) - sum(rate(hubble_icmp_total{family=\"IPv6\", type=\"EchoReply\"}[1m])) by (pod)"
							format:         "time_series"
							hide:           false
							intervalFactor: 1
							legendFormat:   "Missing ICMP Echo-Reply"
							refId:          "B"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Missing ICMPv6 Echo-Reply"
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
							format:  "pps"
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
					collapsed: false
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 42
					}
					id: 42
					panels: []
					title: "Network Policy"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 4
						w: 12
						x: 0
						y: 43
					}
					id: 43
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_drop_total{reason=\"Policy denied\"}[1m])) by (pod, reason)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{reason}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Denies by Reason"
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 4
						w: 12
						x: 12
						y: 43
					}
					id: 61
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_drop_total{reason=\"Policy denied\"}[1m])) by (pod, protocol)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{protocol}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Denied Packets by Protocol"
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 47
					}
					id: 55
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(10, sum(rate(hubble_drop_total{reason=\"Policy denied\"}[1m])) by (pod, source))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{source}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Top 10 Source Pods with Denied Packets"
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
							format:  "pps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 47
					}
					id: 54
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(10, sum(rate(hubble_drop_total{reason=\"Policy denied\"}[1m])) by (pod, destination))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{destination}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Top 10 Destination Pods with Denied Packets"
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
							format:  "pps"
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
					collapsed: false
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 52
					}
					id: 47
					panels: []
					title: "HTTP"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 6
						w: 12
						x: 0
						y: 53
					}
					id: 45
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_http_requests_total[1m])) by (pod, method)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "HTTP Requests"
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
							decimals: 1
							format:   "reqps"
							label:    ""
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 6
						w: 12
						x: 12
						y: 53
					}
					id: 49
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_http_responses_total[1m])) by (pod, status)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{status}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "HTTP responses"
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
							decimals: 1
							format:   "reqps"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 59
					}
					id: 51
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "histogram_quantile(0.5, rate(hubble_http_request_duration_seconds_bucket[1m]))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "HTTP Request/Response Latency (p50)"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 59
					}
					id: 58
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "histogram_quantile(0.99, rate(hubble_http_request_duration_seconds_bucket[1m]))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{method}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "HTTP Request/Response Latency (p99)"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 64
					}
					id: 53
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
					options: {}
					percentage:  true
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       true
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_http_requests_total[5m])) by (pod, protocol)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{protocol}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "HTTP Protocol Usage"
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
							decimals: 0
							format:   "short"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					collapsed: false
					gridPos: {
						h: 1
						w: 24
						x: 0
						y: 69
					}
					id: 6
					panels: []
					title: "DNS"
					type:  "row"
				},
				{
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 8
						x: 0
						y: 70
					}
					id: 2
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_dns_queries_total[1m])) by (pod, qtypes)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{qtypes}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "DNS Requests"
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
							format:  "reqps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 8
						x: 8
						y: 70
					}
					id: 4
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_dns_responses_total{rcode=\"No Error\"}[1m])) by (pod, qtypes)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{qtypes}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "DNS responses"
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
							decimals: 1
							format:   "reqps"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					alert: {
						conditions: [
							{
								evaluator: {
									params: [
										0.5,
									]
									type: "gt"
								}
								operator: type: "and"
								query: params: [
									"A",
									"5m",
									"now",
								]
								reducer: {
									params: []
									type: "avg"
								}
								type: "query"
							},
						]
						executionErrorState: "alerting"
						for:                 "5m"
						frequency:           "1m"
						handler:             1
						name:                "DNS Request/Response Symmetry alert"
						noDataState:         "no_data"
						notifications: []
					}
					aliasColors: {}
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 8
						x: 16
						y: 70
					}
					id: 66
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_dns_queries_total[1m])) by (pod, qtypes) - sum(rate(hubble_dns_responses_total[1m])) by (pod, qtypes)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{qtypes}}"
							refId:          "A"
						},
					]
					thresholds: [
						{
							colorMode: "critical"
							fill:      true
							line:      true
							op:        "gt"
							value:     0.5
						},
					]
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Missing DNS Responses"
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
							format:  "reqps"
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 75
					}
					id: 40
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_dns_response_types_total[1m])) by (pod, type)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{type}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "DNS Response Record Type"
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
							decimals: 1
							format:   "short"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 75
					}
					id: 57
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_dns_responses_total{rcode=\"No Error\"}[1m])) by (pod,ips_returned)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{ips_returned}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "DNS Response IPs Returned"
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
							decimals: 1
							format:   "reqps"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 0
						y: 80
					}
					id: 28
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
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "sum(rate(hubble_dns_responses_total{rcode!=\"No Error\"}[1m])) by (pod, qtypes, rcode)"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{rcode}} ({{qtypes}})"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "DNS Errors"
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
							decimals: 4
							format:   "short"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 5
						w: 12
						x: 12
						y: 80
					}
					id: 56
					legend: {
						alignAsTable: false
						avg:          false
						current:      false
						max:          false
						min:          false
						rightSide:    false
						show:         true
						sideWidth:    null
						total:        false
						values:       false
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(10,sum(rate(hubble_dns_responses_total{rcode!=\"No Error\"}[1m])) by (pod, destination))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{destination}}"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Pods with DNS errors"
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
							decimals: 4
							format:   "short"
							label:    null
							logBase:  1
							max:      null
							min:      null
							show:     true
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
					bars:       false
					dashLength: 10
					dashes:     false
					datasource: "prometheus"
					fill:       1
					gridPos: {
						h: 6
						w: 24
						x: 0
						y: 85
					}
					id: 20
					legend: {
						alignAsTable: true
						avg:          false
						current:      true
						max:          false
						min:          false
						rightSide:    true
						show:         true
						sort:         "current"
						sortDesc:     true
						total:        false
						values:       true
					}
					lines:     true
					linewidth: 1
					links: []
					nullPointMode: "null"
					options: {}
					percentage:  false
					pointradius: 2
					points:      false
					renderer:    "flot"
					seriesOverrides: []
					spaceLength: 10
					stack:       false
					steppedLine: false
					targets: [
						{
							expr:           "topk(10, sum(rate(hubble_dns_queries_total[10m])*60) by (query, qtypes))"
							format:         "time_series"
							intervalFactor: 1
							legendFormat:   "{{query}} ({{qtypes}})"
							refId:          "A"
						},
					]
					thresholds: []
					timeFrom: null
					timeRegions: []
					timeShift: null
					title:     "Top 10 DNS Queries per minute"
					tooltip: {
						shared:     true
						sort:       2
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
							format:  "none"
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
			refresh:       "30s"
			schemaVersion: 18
			style:         "dark"
			tags: []
			templating: list: []
			time: {
				from: "now-6h"
				to:   "now"
			}
			timepicker: {
				refresh_intervals: [
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
				time_options: [
					"5m",
					"15m",
					"1h",
					"6h",
					"12h",
					"24h",
					"2d",
					"7d",
					"30d",
				]
			}
			timezone: ""
			title:    "Hubble"
			uid:      "5HftnJAWz"
			version:  24
		}
	}
}
