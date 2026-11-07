#!/usr/bin/env bash
# Reference of the commands used to build the server, in order.
# Documentation, not a hardened installer. Review before running.
set -euo pipefail

# Wi-Fi (interactive)
# sudo nmcli device wifi connect "<SSID>" --ask

# Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
sudo systemctl enable --now tailscaled
sudo tailscale up --ssh

# Cockpit + Podman
sudo dnf install -y cockpit cockpit-podman
sudo systemctl enable --now cockpit.socket
sudo firewall-cmd --permanent --add-service=cockpit

# AdGuard Home
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sudo sh -s -- -v
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=dns
sudo firewall-cmd --reload
