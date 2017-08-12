# DNS-based Firewall

## Volume

`/config` mount contains two files. `/config/local.conf` is a list of locally defined
zones and `/config/domains.conf` is a list of generally accessible domains. All DNS
queries will be limited to only those domains (local and domain) with all other
queries resulting in a NXDOMAIN error.

## Commands

```shellscript
## launch container
#
docker run -d \
    --restart always \
    --name dns \
    --volume $PWD/config:/config:ro \
    --publish 53:53/tcp \
    --publish 53:53/udp \
    --net bob \
    junk
    maxird/dnsfw:latest

## reload configuration from /config
#
docker exec dns reload
```

## Extract Log Entries

```shellscript
cat dnsmasq.log | \
    sed '/ec2.internal/d' | \
    grep 'NXDOMAIN' | \
    awk '{ print $6; }' | \
    sort -f | \
    uniq
```
