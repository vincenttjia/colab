apt update
apt install openvpn
wget -P ~/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.4/EasyRSA-3.0.4.tgz
tar xvf EasyRSA-3.0.4.tgz

echo "set_var EASYRSA_REQ_COUNTRY     \"US\"" > ~/EasyRSA-3.0.4/vars
echo "set_var EASYRSA_REQ_PROVINCE    \"California\"" >> ~/EasyRSA-3.0.4/vars
echo "set_var EASYRSA_REQ_CITY        \"San Francisco\"" >> ~/EasyRSA-3.0.4/vars
echo "set_var EASYRSA_REQ_ORG \"Copyleft Certificate Co\"" >> ~/EasyRSA-3.0.4/vars
echo "set_var EASYRSA_REQ_EMAIL       \"me@example.net\"" >> ~/EasyRSA-3.0.4/vars
echo "set_var EASYRSA_REQ_OU          \"My Organizational Unit\"" >> ~/EasyRSA-3.0.4/vars

~/EasyRSA-3.0.4.tgz/easyrsa init-pki

~/EasyRSA-3.0.4.tgz/easyrsa build-ca nopass
