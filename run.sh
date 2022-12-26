service ssh start
echo "ctf:$password" | chpasswd
usermod --shell /bin/bash ctf
sudo -u ctf /bin/bash
#nie patrz na to to po to zeby sie kontener nie zamykał we wspaniałym środowisku gcp
cd /home/ctf && npm start