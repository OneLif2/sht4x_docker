echo -e "check = $USER"
echo -e "check = $PWD"
ip="$(hostname -I | awk '{print $1}')"
echo -e "${ip}"