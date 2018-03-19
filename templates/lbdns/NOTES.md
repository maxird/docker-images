# Notes

Links:
- https://superuser.com/questions/1193917/how-to-view-haproxy-status-on-the-command-line-using-a-socket
- http://haproxy.tech-notes.net/9-2-unix-socket-commands/
- https://makandracards.com/makandra/36727-get-haproxy-stats-informations-via-socat


```shellscript
watch 'echo "show stat" | nc -U /var/run/haproxy.stat | cut -d "," -f 1,2,5-11,18,24,27,30,36,50,37,56,57,62 | column -s, -t'

```
