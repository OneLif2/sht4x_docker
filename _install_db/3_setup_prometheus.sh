cd $PWD
echo -e "check path = $(pwd)"

sudo rm -rf ./prometheus
sleep 1
mkdir prometheus
cd prometheus

#rm prometheus.yml
touch prometheus.yml

echo -e "check path = $(pwd)"
echo -e 'global:\n' >> prometheus.yml
sed -i '2s/^/  scrape_interval: 1s\n/' prometheus.yml
sed -i '3s/^/  evaluation_interval: 1s\n/' prometheus.yml
sed -i '4s/^/alerting:\n/' prometheus.yml
sed -i '5s/^/  alertmanagers:\n/' prometheus.yml
sed -i '6s/^/    - static_configs:\n/' prometheus.yml
sed -i '7s/^/        - targets:\n/' prometheus.yml
sed -i '8s/^/rule_files:\n/' prometheus.yml
sed -i '9s/^/scrape_configs:\n/' prometheus.yml
sed -i '10s/^/  - job_name: prometheus\n/' prometheus.yml
sed -i '11s/^/    static_configs:\n/' prometheus.yml
sed -i '12s/^/      - targets: ["'$(hostname -I | awk '{print $1}')':30003"]\n/' prometheus.yml

# Add new sensor on prometheus
sed -i -e '$s/$/  - job_name: sht4x_read\n/' prometheus.yml
sed -i -e '$s/$/    static_configs:\n/' prometheus.yml
sed -i -e '$s/$/      - targets: ['"'"''$(hostname -I | awk '{print $1}'):30001''"'"']\n/' prometheus.yml

mkdir prometheus-vol
#Change ownership of folder prometheus-vol to 65534
sudo chown -R 65534:65534 prometheus-vol
docker run -d --name=prometheus --restart=unless-stopped -p=30003:9090 -v=$(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml -v=$(pwd)/prometheus-vol:/prometheus prom/prometheus
echo -e "setup ok!"