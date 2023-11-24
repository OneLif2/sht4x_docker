cd $PWD
echo -e "check path = $(pwd)"

#rm -rf ./prometheus
#sleep 1
#mkdir prometheus
#cd prometheus

#rm prometheus.yml
#touch prometheus.yml

ip="$(hostname -I | awk '{print $1}')"
echo -e "${ip}"

#sed -i '12d' prometheus.yml
#sleep 1

#sed -i '12s/^/      - targets: ["\n/' prometheus.yml
#sed -i 12s/$/$(hostname -I | awk '{print $1}')/ prometheus.yml
#sed -i '12s/$/:30003"] /' prometheus.yml
#sed -i -e '$aTEXTTOEND' prometheus.yml
#sed -i -e '$s/$/\n/' prometheus.yml

#printf '%s\n' 'first line' 'second line' 'third line' > prometheus.yml
#printf '%s\n' > prometheus.yml
#echo $"\n#END\n" >> prometheus.yml
#sed -i '$ d' prometheus.yml

echo -e 'global:\n' >> prometheus.yml
sed -i -e '$s/$/  - job_name: sht4x_read\n/' prometheus.yml
sed -i -e '$s/$/    static_configs:\n/' prometheus.yml
sed -i -e '$s/$/      - targets: ['"'"''$(hostname -I | awk '{print $1}'):30001''"'"']\n/' prometheus.yml