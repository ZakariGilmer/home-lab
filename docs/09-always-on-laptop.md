# 09 - Keeping the laptop running as a server

A laptop suspends when the lid is closed. These settings keep the server up with the lid shut.

## Ignore the lid switch
```bash
sudo mkdir -p /etc/systemd/logind.conf.d
printf '[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchExternalPower=ignore\nHandleLidSwitchDocked=ignore\n' | sudo tee /etc/systemd/logind.conf.d/lid.conf
sudo systemctl restart systemd-logind
```
Verify with `cat /etc/systemd/logind.conf.d/lid.conf`.

> Restarting `systemd-logind` can end active login sessions, so run this from a session you can reconnect to (I did it over SSH via Tailscale).

## Disable suspend and hibernate entirely
```bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
This points those targets at `/dev/null`, so nothing can put the machine to sleep.

## Remaining reliability tasks
- Limit battery charge level to protect the battery on 24/7 power
- Keep airflow clear; laptops run hot when closed
- Prefer wired Ethernet over Wi-Fi
