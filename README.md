# Home Lab

A small always-on home server built on a repurposed **MacBook Air (M1)** running **Fedora Asahi Remix**, with private remote access via **Tailscale**, web-based management via **Cockpit**, and network-wide ad/tracker blocking via **AdGuard Home**.

This repo documents what I built, the commands I ran, the problems I hit, and what I plan to improve.

## Overview

| Item | Detail |
|---|---|
| Hardware | MacBook Air (`MacBookAir10,1`), 8 CPUs, ~7.3 GiB RAM |
| OS | Fedora Linux Asahi Remix 45 (Server Edition, prerelease), aarch64 |
| Network | Home Wi-Fi (Spectrum ISP), static-style LAN address `192.168.1.230` |
| Remote access | Tailscale (WireGuard-based mesh VPN), no router ports forwarded |
| Management | Cockpit web console (`:9090`) + SSH |
| Containers | Podman via `cockpit-podman` |
| DNS filtering | AdGuard Home, used tailnet-wide through Tailscale DNS |
| Always-on | Lid-close and sleep/suspend disabled via systemd |

## Architecture

```
 iPhone 14 ─┐
 iPad mini ─┤                       ┌───────────────────────────┐
 Windows PC ┼── Tailscale tailnet ──┤  HomeServer (MacBook Air) │
 Windows PC ┘   (100.x.y.z)         │  Fedora Asahi Remix 45    │
                                    │  ├─ sshd        :22       │
 Home LAN ─────────────────────────┤  ├─ Cockpit     :9090     │
 192.168.1.0/24                     │  ├─ AdGuard DNS :53       │
                                    │  ├─ AdGuard UI  :80/:3000 │
                                    │  └─ Podman                │
                                    └───────────────────────────┘
```

## Documentation

1. [Hardware & OS](docs/01-hardware-and-os.md)
2. [Wi-Fi connection with `nmcli`](docs/02-wifi-nmcli.md)
3. [Tailscale and remote access](docs/03-tailscale-remote-access.md)
4. [Cockpit and Podman](docs/04-cockpit-podman.md)
5. [AdGuard Home](docs/05-adguard-home.md)
6. [Firewall (firewalld)](docs/06-firewall.md)
7. [Troubleshooting log](docs/07-troubleshooting.md)
8. [Hardening checklist and roadmap](docs/08-hardening-and-roadmap.md)
9. [Keeping the laptop running as a server](docs/09-always-on-laptop.md)

## Skills demonstrated

Linux server administration (Fedora/systemd/dnf), NetworkManager CLI, firewalld, DNS filtering and resolver troubleshooting (systemd-resolved port 53 conflict), mesh VPN and secure remote access, SSH, SELinux awareness, container management with Podman, and written technical documentation.

## Privacy note

Tailnet IPs, auth links, account details, SSH fingerprints and neighboring Wi-Fi names are intentionally omitted or replaced with placeholders in this repo.
