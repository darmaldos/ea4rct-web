---
title: "Interne garito"
date: 2018-12-07T18:26:48+01:00
draft: true
---
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 138.100.31.4  netmask 255.255.255.192  broadcast 138.100.31.63
        ether 00:e0:81:31:9f:88  txqueuelen 1000  (Ethernet)
        RX packets 19223266  bytes 8762912658 (8.1 GiB)
        RX errors 0  dropped 17  overruns 0  frame 0
        TX packets 13477336  bytes 2678557672 (2.4 GiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 24

eth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.0.1  netmask 255.255.255.0  broadcast 192.168.0.255
        ether 00:e0:81:31:9f:89  txqueuelen 1000  (Ethernet)
        RX packets 125565  bytes 44156497 (42.1 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 199  bytes 14814 (14.4 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 2



  We basically need to have three sets of rules:

  Disallow incoming connections to eth0 (the external network interface)
  Allow outgoing packets from the LAN (via eth1)
  Allow established connections to return.

  #!/bin/sh

PATH=/usr/sbin:/sbin:/bin:/usr/bin

#
# delete all existing rules.
#
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X

# Always accept loopback traffic
iptables -A INPUT -i lo -j ACCEPT


# Allow established connections, and those not coming from the outside
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state NEW -i ! eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow outgoing connections from the LAN side.
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

# Masquerade.
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Don't forward from the outside to the inside.
iptables -A FORWARD -i eth0 -o eth0 -j REJECT

# Enable routing.
echo 1 > /proc/sys/net/ipv4/ip_forward
