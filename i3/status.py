from i3pystatus import Status

status = Status()

# Display clock like this:
# Sat 7 Apr 02:19:25 AM KW19
status.register("clock", format="%a %-d %b %X",)

status.register("battery",
                format="{status} {remaining:%E%hh%Mm}",
                alert=True,
                alert_percentage=5,
                status={
                    "DIS": "",
                    "CHR": "",
                    "FULL" : ""
                },
                color="#ff3000",
                full_color="#ffffff",
                charging_color="#00ff30")

status.register("alsa",
                format=" {volume}",
                format_muted="",
                muted="",
                color_muted="#ff3000",
                map_volume=True)

status.register("network",
                interface="wlp3s0",
                format_up=" {essid}{quality:3.0f}%",
                format_down="",
                color_up="#ffffff",
                color_down="#ff3000",
                dynamic_color=False)
status.register("network",
                interface="enp4s0",
                format_up=" {v6cidr}",
                format_down="",
                color_up="#ffffff",
                color_down="#ff3000",
                dynamic_color=False)

status.register("disk",
                path="/home/georg",
                format=" {free}GB",
                critical_limit=20,
                critical_color="#ff3000")
status.register("disk",
                path="/",
                format=" {free}GB",
                critical_limit=5,
                critical_color="#ff3000")

status.register("cpu_usage", format=" {usage:02}%")

status.register("mem",
                format=" {avail_mem}GB",
                divisor=1024**3,
                color="#ffffff",
                warn_color="ffffff",
                alert_color="#ff3000")

status.run()
