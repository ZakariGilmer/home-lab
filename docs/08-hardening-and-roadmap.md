# 08 - Hardening checklist and roadmap

## Hardening checklist
- [ ] SSH key-based login, then disable password auth (`PasswordAuthentication no`)
- [ ] Restrict Cockpit (9090) and AdGuard admin to LAN/Tailscale only (firewalld zones or rich rules)
- [ ] Remove the temporary `3000/tcp` rule (AdGuard UI now answers on port 80)
- [ ] Enable automatic updates (`dnf-automatic`) and review Cockpit's Software updates page
- [ ] Review Tailscale ACLs and node key expiry
- [ ] Reserve `192.168.1.230` in the router's DHCP reservations
- [ ] Full-disk encryption review (a laptop can be physically removed)
- [ ] Backups of `/opt/AdGuardHome` config and Podman volumes

## Reliability (laptop-as-server)
- [x] Keep running with the lid closed (logind drop-in + sleep targets masked)
- [ ] Limit battery charge level to protect the battery
- [ ] Use wired Ethernet via USB-C adapter instead of Wi-Fi
- [ ] Monitor with Uptime Kuma in a Podman container

## Roadmap / services to add
- [ ] Vaultwarden (password manager)
- [ ] Immich or Nextcloud (photos / files)
- [ ] Jellyfin (media)
- [ ] Home Assistant
- [ ] Tailscale subnet router / exit node
- [ ] Add a fallback nameserver in Tailscale DNS in case the home server is down
- [ ] Point the router's DHCP DNS at AdGuard Home for non-Tailscale LAN devices
- [ ] Add more blocklists and tune allow/deny rules
- [ ] Redacted network diagram and screenshots in `docs/img/`
