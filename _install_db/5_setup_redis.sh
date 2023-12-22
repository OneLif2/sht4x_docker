docker run -d --name=redis --restart=unless-stopped -p=30002:6379 redis
docker ps
python3 -m pip install redis


cd $PWD
echo -e "check path = $(pwd)"
sleep 5

rm redis-test.py

touch redis-test.py

ip="$(hostname -I | awk '{print $1}')"
echo -e "${ip}"

echo "#END" >> $(pwd)/redis-test.py
sed -i '1s/^/import redis\n/' $(pwd)/redis-test.py
sed -i '2s/^/\n/' $(pwd)/redis-test.py
sed -i '3s/^/redis = redis.Redis(\n/' $(pwd)/redis-test.py
sed -i '4s/^/host = '"'"''$(hostname -I | awk '{print $1}')''"'"' ,\n/' $(pwd)/redis-test.py
sed -i '5s/^/port = '"'"''30002''"'"' \n/' $(pwd)/redis-test.py
sed -i '6s/^/)\n/' $(pwd)/redis-test.py
sed -i '7s/^/\n/' $(pwd)/redis-test.py
sed -i '8s/^/\n/' $(pwd)/redis-test.py
sed -i '9s/^/redis.set('"'"''key''"'"', '"'"''Connected''"'"')\n/' $(pwd)/redis-test.py
sed -i '10s/^/value = redis.get('"'"''key''"'"')\n/' $(pwd)/redis-test.py
sed -i '11s/^/print(value)\n/' $(pwd)/redis-test.py

python3 redis-test.py