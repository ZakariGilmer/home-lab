# 02 - Wi-Fi with nmcli (headless-friendly)

The server connects to the home network over Wi-Fi using NetworkManager's CLI.

## Steps
```bash
# 1. Scan for networks
nmcli device wifi list

# 2. Connect (prompts for the password so it isn't saved in shell history)
sudo nmcli device wifi connect "<SSID>" --ask

# 3. Verify connectivity (IPv6 worked on this network)
ping -c 3 google.com
```

## Result
- `Device 'wld0' successfully activated`
- 3/3 packets received, 0% loss, ~44-60 ms to google.com

## Notes
- `--ask` keeps the Wi-Fi password out of command history.
- The first `sudo` attempt timed out waiting for the password; just re-run it.
- Wi-Fi scans show many nearby networks; SSIDs of other people's networks are not recorded in this repo.
- Wired Ethernet (USB-C adapter) would be more reliable for a server. See the [roadmap](08-hardening-and-roadmap.md).
