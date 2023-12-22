echo -e "check = $USER"
echo -e "check = $PWD"
ip="$(hostname -I | awk '{print $1}')"
echo -e "${ip}"


if ! grep -q docker /etc/group; then
    echo "The 'docker' group does not exist."
    echo "adding docker group..."
    sudo groupadd docker
    sudo usermod -aG docker $USER
    echo "done!!"
else
    echo "The 'docker' group exists."
fi