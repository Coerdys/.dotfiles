import os
import subprocess

dirs = [dir for dir in os.listdir('.') if os.path.isdir(dir)]

print("Available themes:")
for i, dir in enumerate(dirs):
    print(f"({i}) {dir}")

while True:
    try:
        selection = dirs[int(input("Select theme: "))]
        break
    except (ValueError, IndexError):
        print("Not a number")

print(f"Selected theme: {selection}")

os.remove("config")
os.remove("style.css")
subprocess.call(["ln", "-s", f"{selection}/config.jsonc", "config"])
subprocess.call(["ln", "-s", f"{selection}/style.css", "style.css"])

print("Switched themes!")

# subprocess.call(["pkill", "waybar"])
# subprocess.call(["waybar"], stdout=open(os.devnull, 'wb'))
# os.system("waybar &")
