apt update
apt-get install xrdp
apt-get install xfce4
sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh
adduser xrdp ssl-cert
service xrdp restart

./ngrok authtoken EDITWITHNGROKAUTH
./ngrok tcp 3389
