ssh -e none -t -q -x prom socat -v - udp4-sendto:wireguard:5000,sourceport=9000
