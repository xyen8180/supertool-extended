echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
sudo apt-get -y install sshpass
sudo apt-get -y install python-protobuf
apt update --fix-missing