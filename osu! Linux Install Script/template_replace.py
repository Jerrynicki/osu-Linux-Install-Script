import sys
name = sys.argv[1]

with open("osu!.desktop", "w") as file:
    file.write(open("osu!.desktop.template").read().replace("NAME", name))
