# 01 - Hardware and OS

## Hardware
- **Model:** Apple MacBook Air (`MacBookAir10,1`)
- **CPU / RAM:** 8 CPUs, ~7.3 GiB RAM (idle usage ~1.9 GiB, ~0% CPU in Cockpit overview)
- **Network interface:** Wi-Fi (`wld0`)

## Operating system
- **Fedora Linux Asahi Remix 45 (Server Edition, prerelease)**
- Kernel `7.2.12-402.asahi.fc45.aarch64+16k` (Apple Silicon, 16k page size)
- Architecture: `aarch64`, so all binaries and containers must be **arm64**

## Why this setup
Reusing an old laptop gives a low-power server with a built-in battery (acts like a small UPS), built-in display for local console access, and plenty of performance for DNS, containers and file services.

## Useful checks
```bash
hostnamectl
cat /etc/os-release
uname -r
free -h
```
