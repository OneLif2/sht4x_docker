cd $PWD
echo -e "check path = $(pwd)"

sudo rm -rf ./prometheus
sleep 1
mkdir prometheus
cd prometheus

#rm prometheus.yml
touch prometheus.yml

echo -e "check path = $(pwd)"

# Write the configuration directly to prometheus.yml
cat << EOF > prometheus.yml
global:
  scrape_interval: 1s
  evaluation_interval: 1s
alerting:
  alertmanagers:
    - static_configs:
        - targets:
rule_files:
scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ["$(hostname -I | awk '{print $1}'):30003"]
  - job_name: sht4x_read
    static_configs:
      - targets: ['$(hostname -I | awk '{print $1}'):30001']
EOF

mkdir prometheus-vol
#Change ownership of folder prometheus-vol to 65534
sudo chown -R 65534:65534 prometheus-vol
docker run -d --name=prometheus --restart=unless-stopped -p=30003:9090 -v=$(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml -v=$(pwd)/prometheus-vol:/prometheus prom/prometheus
echo -e "setup ok!"