# 04 - Cockpit and Podman

Cockpit gives a browser-based admin console (logs, storage, networking, services, terminal, containers).

## Install and enable
```bash
sudo dnf install cockpit cockpit-podman   # cockpit was already installed (v370)
sudo systemctl enable --now cockpit.socket
sudo firewall-cmd --add-service=cockpit --permanent
sudo firewall-cmd --reload
```

## Access
- LAN: `https://<server-lan-ip>:9090`
- Tailnet: `https://<tailscale-ip>:9090` (browser shows "Not secure" because of the self-signed certificate; expected)
- Log in as the normal user, then click **Turn on administrative access** for privileged tasks.

## What I use it for
- System overview (health, CPU/memory usage, update status)
- Logs, storage, networking, accounts, services
- Podman containers (`cockpit-podman`)
- SELinux troubleshooting page
- Built-in web terminal and software updates

## Notes
- Podman is daemonless and rootless-capable, a good fit for Fedora.
- Container images must support `arm64`.
