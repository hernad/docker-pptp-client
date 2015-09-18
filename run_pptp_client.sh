#!/bin/bash

vpn_connection_name=${vpn_connection_name:-router-42}
vpn_server=${vpn_server:-router-42.bring.out.ba}
vpn_user=${vpn_user:-user1}
vpn_password=${vpn_password:-password1}

docker rm -f pptp-$vpn_connection_name

docker run \
  --net=host \
  --privileged=true \
  --device=/dev/ppp \
  --cap-add=NET_ADMIN \
  -ti \
  --name pptp-$vpn_connection_name \
  -e vpn_server=$vpn_server \
  -e vpn_connection_name=$vpn_connection_name \
  -e vpn_user=$vpn_user -e vpn_password=$vpn_password \
  pptp-client /bin/bash
