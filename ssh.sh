# DEBUG=-v
HOST=wireguard
# ssh -e none -t -q -x prom socat -v - udp4-sendto:wireguard:5000,sourceport=9000
# ssh -e none -t -q -x localhost -p 8022 socat -v - udp4-sendto:wireguard:5000,sourceport=9000
# ssh -v -D4001 -e none -t -q -x localhost -p 8022 socat $DEBUG - udp4-sendto:$HOST:5000,sourceport=9000
ssh -v -D4001 localhost -p 8022 pkill socat
ssh -v -D4001 localhost -p 8022 socat $DEBUG tcp-listen:5000,fork udp4-sendto:$HOST:5000,sourceport=9000
