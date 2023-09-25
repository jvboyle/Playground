# HA/Resiliency Watchdog Scripts

## Install Service

```bash
cp sjhp@.service /usr/lib/systemd/system/
```

## Enable Service for particular client (*clientA*)

```bash
systemctl enable sjhp@clientA.service
```

## Enable Service for every client

```bash
for client in $(ls /sasg/clients); do systemctl enable sjhp@${client}.service; done
```

## Install watchdog

```bash
cp check-client-container.sh /sasg/bin
```

## Enable autorun every 5 minutes

Add following line to cron

```plain
*/5 * * * * /sasg/bin/check-client-container.sh >/dev/null 2>/dev/null
```
