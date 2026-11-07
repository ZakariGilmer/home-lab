# 05 - AdGuard Home

Network-wide DNS filtering (ads, trackers, malware domains) for every device that uses the server as its DNS resolver.

## Install (arm64 build)
```bash
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sudo sh -s -- -v
```
- Installs to `/opt/AdGuardHome`, registers a systemd service, starts on boot
- Version installed: `v0.107.80`
- First-run setup wizard served on port **3000**

## Service control
```bash
sudo /opt/AdGuardHome/AdGuardHome -s start|stop|restart|status|install|uninstall
```

## Setup wizard and the port 53 conflict
In the wizard, the DNS server listens on **all interfaces, port 53**. The wizard failed validation with:

```
validating ports: listen tcp 0.0.0.0:53: bind: address already in use
```

**Cause:** Fedora's `systemd-resolved` runs a DNS stub listener on port 53.

**Fix:** disable the stub listener and point the system resolver at AdGuard itself:
```bash
sudo mkdir -p /etc/systemd/resolved.conf.d
printf '[Resolve]\nDNS=127.0.0.1\nDNSStubListener=no\n' | sudo tee /etc/systemd/resolved.conf.d/adguardhome.conf
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved
```
After this the wizard validated and finished.

## Blocklists
- **AdGuard DNS filter** enabled (about 190k rules)
- **AdAway Default Blocklist** present but disabled
- More lists can be added under **Filters > DNS blocklists**

## Verifying it works
The **Query Log** shows each lookup, which client asked, and whether it was *Processed* or *Blocked* by a filter.
Queries from tailnet devices (a phone and a Windows PC) appear with their Tailscale IPs as the client, and tracking/analytics domains show as **Blocked - AdGuard DNS filter** while normal sites resolve in roughly 30-50 ms.

## Firewall
```bash
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=dns
sudo firewall-cmd --reload
```
(See [firewall notes](06-firewall.md) for why these are separate commands.)

## Next
- The admin UI now answers on port 80, so the temporary `3000/tcp` rule can be removed
- Point the router's DHCP DNS at the server to cover non-Tailscale devices on the LAN
- Restrict the admin UI to LAN and Tailscale only
- Back up `/opt/AdGuardHome/AdGuardHome.yaml` (contains a password hash; do not commit it)
