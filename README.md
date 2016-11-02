# ndppd-alpine

[![Docker Pulls](https://img.shields.io/docker/pulls/janeczku/ndppd-alpine.svg?maxAge=8600)][hub]
[![Images size](https://images.microbadger.com/badges/image/janeczku/ndppd-alpine.svg)][microbadges]

[hub]: https://hub.docker.com/r/janeczku/ndppd-alpine/
[microbadges]: https://microbadger.com/images/janeczku/ndppd-alpine

Tiny Alpine-based Docker image that runs a IPv6 Neighbor Discovery Protocol (NDP) proxy ([ndppd](https://github.com/DanielAdolfsson/ndppd)).

## Quickstart

    docker run -d --restart=unless-stopped -e IPV6_SUBNET="2001:db8::1/64" --cap-drop=ALL \
    --cap-add=NET_ADMIN --cap-add=NET_RAW --net=host janeczku/ndppd-alpine

## ENV variables

**IPV6_SUBNET** (required)   
Default: `-`  
The IPv6 Subnet to match the target addresses against, e.g. 2001:db8::1/6

**PROXY_IFACE**  
Default: `eth0`  
Interface to listen on for Neighbor Solicitation Messages

**FWD_IFACE**  
Default: `docker0`  
Interface to which to forward Neighbor Solicitation Messages
