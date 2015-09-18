#!/bin/bash


echo "$vpn_user PPTP $vpn_password  *" > /etc/ppp/chap-secrets

chmod 0600 /etc/ppp/chap-secrets

cat << EOF > /etc/ppp/peers/$vpn_connection_name
pty "pptp $vpn_server --nolaunchpppd"
name $vpn_user
remotename PPTP
require-mppe-128
file /etc/ppp/options.pptp
ipparam $vpn_connection_name

EOF

#iptables -A INPUT -i ppp0 -j ACCEPT

echo "pon $vpn_connection_name"
echo "ili debug:"
echo "pon  $vpn_connection_name debug dump logfd 2 nodetach"


