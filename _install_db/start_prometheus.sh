docker run -d --name=prometheus --restart=unless-stopped -p=30003:9090 -v=`pwd`/prometheus.yml:/etc/prometheus/prometheus.yml -v=`pwd`/prometheus-vol:/prometheus prom/prometheus