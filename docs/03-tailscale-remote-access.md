# 03 - Tailscale and remote access

Tailscale provides private access from anywhere with **no port forwarding** on the router.

## Install (Fedora, arm64)
```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo systemctl enable --now tailscaled
sudo tailscale up --ssh
```
`tailscale up` prints a login URL; open it on another device to authenticate the node. (Do not publish that URL.)

## Verify
```bash
tailscale status
tailscale ip -4
```

## Devices in the tailnet
| Device | OS |
|---|---|
| homeserver | Linux |
| iphone-14 | iOS |
| ipad-mini-gen-5 | iOS |
| odyssey | Windows |
| odyssey-rep | Windows |

## Connecting
- **From Windows (PowerShell):** `ssh homeserver@homeserver` (MagicDNS name). First connection asks to trust the host key.
- **From iPhone:** an iOS SSH client pointed at the server's Tailscale IP, port 22.
- Tailscale reported **direct** peer-to-peer connections (not relayed), including a direct LAN path when on the same network.

## Tailnet-wide DNS through AdGuard Home
In the Tailscale admin console under **DNS**:
- **MagicDNS:** enabled (devices reach each other by name, e.g. `homeserver`)
- **Global nameservers:** the home server's Tailscale IP
- **Override DNS servers:** on

Every device on the tailnet then sends DNS queries to AdGuard Home on the home server, so ad and tracker blocking follows the phone and PCs even away from home. See [AdGuard Home](05-adguard-home.md).

**Trade-off:** if the server goes offline, tailnet devices lose DNS. Consider adding a second, public fallback nameserver in the Tailscale DNS settings.

## Known issue
`tailscale status` warns: *SELinux is enabled; Tailscale SSH may not work.* Regular OpenSSH over the tailnet works fine; see [troubleshooting](07-troubleshooting.md).
