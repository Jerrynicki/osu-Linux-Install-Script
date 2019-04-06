import os
import time

print("Modifiziere Pulseaudio config... | Modifying Pulseaudio config...")

daemon_conf = open("/etc/pulse/daemon.conf", "r").read()
with open("daemon.conf.backup", "w") as backup:
    backup.write(daemon_conf)

pos = daemon_conf.find("default-fragments =")
daemon_conf1 = daemon_conf
daemon_conf = daemon_conf[pos:]

daemon_conf1 = daemon_conf1.split("\n")
daemon_conf = daemon_conf.split("\n")

daemon_conf = daemon_conf[:2]

line = daemon_conf1.index(daemon_conf[0])

daemon_conf1[line] = "default-fragments = 2"
daemon_conf1[line+1] = "default-fragment-size-msec = 2"
with open("/etc/pulse/daemon.conf", "w") as file:
    file.write("\n".join(daemon_conf1))

print("Fertig! Starte Pulseaudio neu... | Done! Restarting Pulseaudio...")
