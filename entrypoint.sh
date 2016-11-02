#!/bin/sh

PROXY_IFACE=${PROXY_IFACE:-eth0}
FWD_IFACE=${FWD_IFACE:-docker0}

[ -z "$IPV6_SUBNET" ] && echo "IPV6_SUBNET environment variable is not set" && exit 1;

echo "Proxy interface: $PROXY_IFACE"
echo "Forward interface: $FWD_IFACE"
echo "IPV6 subnet: $IPV6_SUBNET"

cat << EOF > /etc/ndppd.conf
route-ttl 30000
proxy $PROXY_IFACE {
  router yes
  timeout 500
  ttl 30000
  rule $IPV6_SUBNET {
    iface $FWD_IFACE
  }
}
EOF

exec /usr/local/sbin/ndppd -c /etc/ndppd.conf -v
