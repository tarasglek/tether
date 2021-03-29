On verizon one just has to lower the default ttl by 1.

On T-mobile, they do some fancier stuff. There it's good to tether to phone, then run socat udp proxy on the phone for connections to identify as initiated from phone.

```
adb forward tcp:8022 tcp:8022
#on phone
socat -v tcp-listen:5000,reuseaddr,fork udp:summit.glek.net:5000
#on laptop
adb forward tcp:5000 tcp:5000
socat -v udp-listen:5000,reuseaddr tcp:localhost:5000,fork


#tcp proxy
socat -v udp-listen:5000,reuseaddr,fork tcp:wireguard:5000


socat -v  udp-listen:5000,reuseaddr udp4-sendto:wireguard:5000,sourceport=9000

socat udp-listen:5000,reuseaddr exec:./ssh.sh
socat -v udp-listen:5000,reuseaddr tcp:localhost:5000

socat   udp-listen:5000,reuseaddr udp4-sendto:192.168.43.1:5000,sourceport=9000

ssh 192.168.43.1 -p 8022 socat  udp-listen:5000,reuseaddr udp4-sendto:summit.glek.net:5000,sourceport=9000
```