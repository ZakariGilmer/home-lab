# 06 - Firewall (firewalld)

Fedora Server ships with `firewalld`. Rules added with `--permanent` only take effect after a reload.

## Rules in place
| Rule | Purpose |
|---|---|
| `cockpit` service (9090) | Web console |
| `dns` service (53) | AdGuard Home DNS |
| `http` service (80) | AdGuard Home UI after setup |
| `3000/tcp` | AdGuard Home setup wizard |

## Commands
```bash
sudo firewall-cmd --permanent --add-service=cockpit
sudo firewall-cmd --permanent --add-service=dns
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-port=3000/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-all
```

## Lesson learned
Combining `--add-port` and `--add-service` in a single command fails:
```
firewall-cmd: error: argument --add-port: not allowed with argument --add-service
```
Run them as separate commands.
