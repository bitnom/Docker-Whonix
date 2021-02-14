#!/bin/sh

GWIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')

printf "VirtualAddrNetworkIPv4 10.192.0.0/10\n" > /etc/tor/torrc
printf "Log notice file /root/.tor/notices.log\n" >> /etc/tor/torrc
printf "DataDirectory /root/.tor\n" >> /etc/tor/torrc
printf "Log notice stdout\n" >> /etc/tor/torrc
printf "SocksPort %s:9050 IsolateSOCKSAuth\n" "$GWIP" >> /etc/tor/torrc
printf "SocksPolicy accept 172.17.0.0/24\n" >> /etc/tor/torrc
printf "SocksPolicy reject *\n" >> /etc/tor/torrc
printf "ControlPort %s:9051\n" "$GWIP" >> /etc/tor/torrc
printf "CookieAuthentication 1\n" >> /etc/tor/torrc
printf "HashedControlPassword 16:0430F4846DCB79EB605DAB188CF619860A18B86C20D075B84CB97E0695\n" >> /etc/tor/torrc
printf "AutomapHostsOnResolve 1\n" >> /etc/tor/torrc
printf "TransPort %s:9040\n" "$GWIP" >> /etc/tor/torrc
printf "DNSPort %s:53\n" "$GWIP" >> /etc/tor/torrc
