#!/bin/bash

ipt=/sbin/iptables

$ipt -t filter -F
$ipt -t nat -F


$ipt -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$ipt -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
$ipt -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
$ipt -A INPUT -i lo -j ACCEPT
$ipt -A INPUT -j REJECT --reject-with icmp-host-prohibited

$ipt -A FORWARD -j REJECT --reject-with icmp-host-prohibited

$ipt -P INPUT DROP
