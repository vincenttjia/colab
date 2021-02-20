# create an account on ngrok is not already and copy the authtoken and 
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 1bp2A1cfSIInBrbxlpVLypjxqcU_4swr4PC1wGjzgBJtTTyqV  
./ngrok tcp 22 &
apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null
mkdir -p /var/run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc && echo "export LD_LIBRARY_PATH" >> /root/.bashrc
/usr/sbin/sshd -D &
mkdir /root/.ssh
echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWXnP4jdbxnuMzrnnvZq0qimTchEp8rtsIVN44oV7v9J4Hn4JQBgScDR0E/NZbQh3GpS3VlgT+4orxPa5wxT4DwvLijVh0QHr0AbPAByhhq+S+fX446ABFMSw4RCe7qsgKwIHYQcr6Ufb1VhlXqvrBgq2wvPIdc8K/Ys9K2GZnpQ0FEoHuCC/1FDAx1wvuhuEM0fdTEvECVjlaOuyVTW7EkvcpQPi2SjdBfhxVn3uiXyg/DUM0xTEYuaW+iFCqeCly9cEU64gm8ek7D/r4zdwreg5Rkv3Cm4yOhviTgxf43pfngu5X6MWWnC4ZxUy11JImshxuVlicm7xgR+1w8XTJ >> /root/.ssh/authorized_keys
echo "You can connect to colab server on terminal with following command"
curl -s http://localhost:4040/api/tunnels | python3 -c \
    "import sys, json; print('ssh root@0.tcp.ngrok.io -p ' + json.load(sys.stdin)['tunnels'][0]['public_url'][-5:])"
