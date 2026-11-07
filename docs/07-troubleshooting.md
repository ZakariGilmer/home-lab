# 07 - Troubleshooting log

| Symptom | Cause | Fix |
|---|---|---|
| `sudo: timed out reading password` | Waited too long at the prompt | Re-run the command and enter the password promptly |
| `tailsclae: command not found` | Typo | `tailscale ip -4` |
| `tailscale: unknown subcommand: stat` | Abbreviated subcommand | Use `tailscale status` |
| `argument --add-port: not allowed with argument --add-service` | firewall-cmd rejects mixing options | Run port and service additions as separate commands |
| Tailscale health warning: SELinux enabled | Tailscale SSH conflicts with SELinux | Use regular OpenSSH over the tailnet, or follow Tailscale's SELinux guide |
| Browser "Not secure" on Cockpit | Self-signed certificate | Expected; traffic is also inside the Tailscale tunnel |
| Cockpit "limited access mode" | Not elevated | Click **Turn on administrative access** |
| AdGuard wizard: `listen tcp 0.0.0.0:53: bind: address already in use` | `systemd-resolved` stub listener holds port 53 | Set `DNSStubListener=no` in a `resolved.conf.d` drop-in, relink `/etc/resolv.conf`, restart `systemd-resolved` (see [AdGuard Home](05-adguard-home.md)) |
| Laptop suspends when lid closes | Default logind lid handling | `HandleLidSwitch*=ignore` drop-in and mask sleep targets (see [always-on](09-always-on-laptop.md)) |
