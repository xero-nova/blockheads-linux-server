#!/bin/bash
world_id="83cad395edb8d0f1912fec89508d8a1d"
server_port=15151

while true; do
    ./blockheads_server171 -o $world_id -p $server_port >> ~/GNUstep/Library/ApplicationSupport/TheBlockheads/saves/$world_id/console.log 2>&1
    sleep 1
done
