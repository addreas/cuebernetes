package kube

import yaml656e63 "encoding/yaml"

k: StatefulSet: qbittorrent: {
	_selector: "app": "qbittorrent"
	spec: {
		template: {
			metadata: labels: "vpn-egress": "gateway"
			spec: {
				securityContext: {
					fsGroup: 1000
					sysctls: [{
						name:  "net.ipv4.conf.all.src_valid_mark"
						value: "1"
					}]
				}
				initContainers: [{
					name:  "wg-quick"
					image: "nixery.dev/shell/iproute/wireguard"
					command: ["sh","-c"]
					args: ["""
						wg-quick up /config/wg0.conf
						ip route add 10.96.0.0/12 dev eth0
						ip route add 10.0.0.0/16 dev eth0
						"""]

					securityContext: {
						privileged: true // not sure which cap is required for sysctl
						capabilities: add: ["NET_ADMIN", "NET_RAW"]
					}
					volumeMounts: [{
						name:      "wg0-conf"
						mountPath: "/config"
					}]
				}, {
					name:  "insert-config"
					image: "quay.io/quay/busybox"
					command: ["sh", "-c"]
					args: ["""
						CONF_DIR=/config/config
						OLD=\"$CONF_DIR/qBittorrent.conf\"
						if [ -f $OLD ]; then
						echo \"existing config:\"
						cat $OLD
						NEW=\"$CONF_DIR/qBittorrent.$(date \"+%s\").conf\"
						echo \"moving existing config to $NEW\"
						cp $OLD $NEW
						else
						mkdir -p $CONF_DIR
						fi

						cp /static/qBittorrent.conf $OLD

						"""]
					volumeMounts: [{
						mountPath: "/static"
						name:      "static-config"
					}, {
						mountPath: "/config"
						name:      "config"
					}]
				}]
				containers: [{
					name:  "qbittorrent"
					image: "hotio/qbittorrent"
					ports: [{
						containerPort: 8080
					}]
					env: [{
						name:  "PUID"
						value: "1000"
					}, {
						name:  "PGID"
						value: "1000"
					}, {
						name:  "UMASK"
						value: "002"
					}, {
						name:  "TZ"
						value: "Europe/Stockholm"
					}, {
						name:  "DEBUG"
						value: "yes"
					}]
					volumeMounts: [{
						mountPath: "/config"
						name:      "config"
					}, {
						mountPath: "/videos"
						name:      "nfs-videos"
					}]
					resources: {
						limits: {
							memory: "2Gi"
							cpu:    "500m"
						}
						requests: {
							memory: "512Mi"
							cpu:    "250m"
						}
					}
				}, {
					name:  "exporter"
					image: "esanchezm/prometheus-qbittorrent-exporter"
					securityContext: {
						allowPrivilegeEscalation: false
						runAsUser:                1000
						runAsGroup:               1000
					}
					resources: limits: {
						memory: "64Mi"
						cpu:    "100m"
					}
					ports: [{
						containerPort: 8000
					}]
					env: [{
						name:  "QBITTORRENT_HOST"
						value: "localhost"
					}, {
						name:  "QBITTORRENT_PORT"
						value: "8080"
					}]
				}, {
					name:  "socks-proxy"
					image: "xkuma/socks5"
					securityContext: {
						allowPrivilegeEscalation: false
						runAsUser:                1000
						runAsGroup:               1000
					}
					resources: limits: {
						memory: "64Mi"
						cpu:    "10m"
					}
					ports: [{
						containerPort: 1080
					}]
				}]
				volumes: [{
					name: "wg0-conf"
					secret: {
						secretName:  "wg0-conf"
						defaultMode: 0o600
					}
				}, {
					name: "static-config"
					configMap: name: "qbittorrent-static-config"
				}, {
					name: "nfs-videos"
					nfs: {
						path:   "/export/videos"
						server: "sergio.localdomain"
					}
				}]
			}
		}
		volumeClaimTemplates: [{
			metadata: name: "config"
			spec: {
				resources: requests: storage: "5Gi"
				accessModes: ["ReadWriteOnce"]
			}
		}]
	}
}

k: Service: qbittorrent: {
	_selector: "app": "qbittorrent"
	spec: ports: [{
		name: "http"
		port: 8080
	}, {
		name: "metrics"
		port: 8000
	}]
}

k: ServiceMonitor: qbittorrent: {
	_selector: "app": "qbittorrent"
	spec: endpoints: [{
		port:     "metrics"
		interval: "60s"
	}]
}

k: Ingress: qbittorrent: {
	metadata: annotations: {
		"cert-manager.io/cluster-issuer":     "addem-se-letsencrypt"
		"ingress.kubernetes.io/ssl-redirect": "true"
		// ingress.kubernetes.io/auth-tls-error-page: getcert.addem.se
		"ingress.kubernetes.io/auth-tls-secret":        "client-auth-root-ca-cert"
		"ingress.kubernetes.io/auth-tls-strict":        "true"
		"ingress.kubernetes.io/auth-tls-verify-client": "on"
	}
	spec: {
		tls: [{
			hosts: ["qbittorrent.addem.se"]
			secretName: "qbittorrent-cert"
		}]
		rules: [{
			host: "qbittorrent.addem.se"
			http: paths: [{
				path:     "/"
				pathType: "Prefix"
				backend: service: {
					name: "qbittorrent"
					port: number: 8080
				}
			}]
		}]
	}
}

k: ConfigMap: "qbittorrent-static-config": {
	data: {
		"qBittorrent.conf": yaml656e63.Marshal(_cue_qBittorrent_conf)
		let _cue_qBittorrent_conf = ["Preferences"]
	}
}

k: Service: "vpn-egress": {
	_selector: "vpn-egress": "gateway"
	spec: ports: [{
		name: "socks"
		port: 1080
	}]
}

k: CiliumNetworkPolicy: "vpn-egress-gateway": {
	spec: {
		endpointSelector: matchLabels: "vpn-egress": "gateway"
		ingress: [{
			fromEntities: ["cluster"]
		}]
		egress: [{
			toEndpoints: [{
				matchLabels: {
					"k8s:io.kubernetes.pod.namespace": "kube-system"
					"k8s:k8s-app":                     "kube-dns"
				}
			}]
			toPorts: [{
				ports: [{
					port:     "53"
					protocol: "ANY"
				}]
				rules: dns: [{
					matchPattern: "*"
				}]
			}]
		}, {
			toFQDNs: [{
				matchName: "se1.wg.azirevpn.net"
			}]
			toPorts: [{
				ports: [{
					port:     "51820"
					protocol: "UDP"
				}]
			}]
		}]
	}
}

k: CiliumNetworkPolicy: "vpn-egress-clients": {
	spec: {
		endpointSelector: matchLabels: "vpn-egress": "client"
		ingress: [{
			fromEntities: ["cluster"]
		}]
		egress: [{
			toEntities: ["cluster"]
		}, {
			toEndpoints: [{
				matchLabels: "vpn-egress": "gateway"
			}]
			toPorts: [{
				ports: [{
					port:     "1080"
					protocol: "TCP"
				}]
			}]
		}]
	}
}

k: SealedSecret: "wg0-conf": spec: encryptedData: "wg0.conf": "AgCQaQONrshfUUPifd4VGEaOHmmRvFF0zCeddmod1I5XwHVb9EcikLtlyobQlNVsfHFgy5m2eCUzRq5fXoanOU7hLxodqMjaX7RZBiDxnTM8/Fknt2JIf97ODoLs7wPm6aeH5iVg/J5kdWHEHhexLuLAla79pospV+0bhF5wqdUy0KyvXltfQtfxbAMbJNKSLeY4ajhhjdH61fac+MZnAqIE2llkDxSUJHqUJagtdhhjq+V8sMW9LmXFb6qMOJdQ769YFZrF35vQWFL5zglldi0pleytfYpE4FR0BhLFGi78O+4BRB0CAz2jSYzH7Z9cG5WZ61hOL01LuzVGGJzLwACOQnF8GlDFcvfzKGL1eQ2kssUR4OFSml3C3MJl5oLUFgy8WhzU/wsjgfaBpBKl2xnxaDc9W9RSK98PZ/8nAgpTuBIAKZRuQ4yBrdyi0mSOMCU+kwFQlJkRsrtbl/zL5L4FXb0AWxziPtxH/4Y3ejajGveZ4BGbggLelW+btWkTYKywhDu0669S58u+wJJyLV0/guUxEdsYExrATkw4nSxERKO12kyoQzny5W/ak7Znv/v0wC2/SHB17R56eeT59sS7tiwPi3y6pPVSpmi1448xGSkrxbg3dqdC6xWTtKw42Or7IVMqlMu0bIwTBXRDaIJEs9FfjokDPCjOOCt8pE63eUHtM01cD6s6CLDVhERsD1oaSVyPbyrpNiOMtKKq6tcmxf2LGfDZWZRY/+Hn1W/lgcShueiPWowC0ayLwqGThFzUglfXitBKinf1vSnL9VuybtTXjgwHKphuOVYJB/J8tsjh0vsaUNIpDKXSLkx7GsPSIoTHkoMimsZxyAstgjbkEwiluzGGOcvuJ1oJRWJ7a6sGoEVNJUECT5E0RhOmeRask6761/Chbnylx5z61lAyvrGjayMxQiUhgC6IyTFiCmdDW2Ht1JwLiIA8tb3G5+sL/VwX6IdF4gFBBn8qM1Q8J7uHWApuLmx2a9/JQ15Tn9s/DuNTlNyzPk3SQLwGiJtjRIjsYr4MjMQVBAG/lPSDsSh/gvno1vQBJqaKAOr+5kJxXgWKufSJufGIZ28en5sRfd6zlRk="
