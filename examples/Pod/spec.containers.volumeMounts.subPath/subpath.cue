package kube

k: Pod: "volumes-subpath-pod": {
	spec: {
		containers: [{
			env: [{
				name:  "MYSQL_ROOT_PASSWORD"
				value: "rootpasswd"
			}]
			image: "mysql"
			name:  "mysql"
			volumeMounts: [{
				mountPath: "/var/lib/mysql"
				name:      "site-data"
				subPath:   "mysql"
			}]
		}, {
			image: "php:7.0-apache"
			name:  "php"
			volumeMounts: [{
				mountPath: "/var/www/html"
				name:      "site-data"
				subPath:   "html"
			}]
		}]
		volumes: [{
			name: "site-data"
			persistentVolumeClaim: claimName: "my-lamp-site-data"
		}]
	}
}
