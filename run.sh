echo run coredns-linux-amd64:1.8.6

docker run --rm -t -p 9999:53/udp -v "/mnt/c/Users/lianchen/linuxroot/code/coredns/mount:/root/mount" coredns-linux-amd64:1.8.6 -conf /root/mount/Corefile >coredns-linux-amd64_1.8.6.log 2>&1 &
serverpid=$!
echo server pid: $serverpid
sleep 2


#nslookup www.baidu.com 172.23.12.61

dig @10.172.68.37 -p 9999 www.baidu.com

sleep 1
echo stop the server $serverpid
kill $serverpid
echo

echo CoreDNS logs:
more coredns-linux-amd64_1.8.6.log