import os
import json
import re
from os import walk
import fnmatch
import platform
from subprocess import call

this_dir = os.path.dirname(os.path.realpath(__file__))
base_dir = os.path.join(this_dir, "..")

if not os.path.isfile(os.path.join(base_dir, "CONFIG")):
    print("CONFIG file needed. See CONFIG.example for directions and copy it to CONFIG.")
    quit()

def do_symlink(target, dest):
    if os.path.isfile(dest) or os.path.isdir(dest):
        print("Warning: " + dest + " is already a link. Skipping.")
        return
    if platform.system() == "Windows":
        print("doing symlink (" + target + ", " + dest +")")
        # call(["mklink"])
        os.system("mklink " + dest + " " + target)
    else:
        os.system("ln -s " + target + " " + dest)

with open(os.path.join(base_dir, "CONFIG")) as data_file:
    data = json.load(data_file)

ignores = data["ignore"]
files = []
dirs = []
for (dirpath, dirnames, filenames) in walk(base_dir):
    files.extend(filenames)
    dirs.extend(dirnames)
    break

def is_ignored(element, ignore_vals):
    for ignore in ignore_vals:
        if fnmatch.fnmatch(ignore, element):
            return False
    return True

local_bash = os.path.join(base_dir, "../.bash_local")
if not os.path.exists(local_bash):
    open(local_bash, "w").close()

files = list(filter(lambda x: is_ignored(x, ignores), files))
dirs = list(filter(lambda x: is_ignored(x, ignores), dirs))

for f in files:
    do_symlink(os.path.join(base_dir, f), os.path.join(data["dest_dir"], f))

for d in dirs:
    do_symlink(os.path.join(base_dir, d), os.path.join(data["dest_dir"], d))
