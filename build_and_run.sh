# chmod +x build_and_run.sh
#chmod +x _build.sh _run.sh build_and_run.sh
docker build . -t sht4x_docker
docker run                 \
  --name=sht4x_docker        \
  --group-add=dialout      \
  --privileged=true        \
  --restart=unless-stopped \
  -it -d                   \
  -p=30001:9090            \
  sht4x_docker

  # --restart=unless-stopped \
  # -it -d                   \


#docker run --name=battery-management-system --restart=unless-stopped --group-add=dialout --privileged=true --device=/dev/ttyUSB0 -p 30006:5000 -p 30007:9090 -it -d battery-management-system