#!/bin/sh

# If interface is passed, use it; otherwise detect OpenVPN interface
interface="$1"

if [ -z "$interface" ]; then
  # Prefer tun interfaces (OpenVPN typically uses tun0, tun1, etc.)
  interface="$(ip -o link show | awk -F': ' '{print $2}' | grep '^tun' | head -n 1)"
fi

# If still empty, fallback to any tuntap device
if [ -z "$interface" ]; then
  interface="$(ip tuntap show 2>/dev/null | cut -d: -f1 | head -n 1)"
fi

# Get IPv4 address
ip="$(ip -4 -o addr show "$interface" 2>/dev/null | awk '{print $4}' | cut -d/ -f1)"

if [ -n "$ip" ]; then
  printf "<icon>network-vpn-symbolic</icon>"
  printf "<txt>%s</txt>" "$ip"

  if command -v xclip >/dev/null 2>&1; then
    printf "<iconclick>sh -c 'printf %s | xclip -selection clipboard'</iconclick>" "$ip"
    printf "<txtclick>sh -c 'printf %s | xclip -selection clipboard'</txtclick>" "$ip"
    printf "<tool>VPN IP (click to copy)</tool>"
  else
    printf "<tool>VPN IP (install xclip to copy)</tool>"
  fi
else
  printf "<txt></txt>"
fi
