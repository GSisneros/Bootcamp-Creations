#!/bin/bash
curl -s http://ipinfo.io $1 |
grep 'country\|"ip"' |
awk '{print $2}' 
