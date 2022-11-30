service ssh start
echo "ctf:$password" | chpasswd
usermod --shell /bin/bash ctf
sudo -u ctf /bin/bash