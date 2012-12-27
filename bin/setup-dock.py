#!/usr/bin/env python
# encoding: utf-8
"""
setup-dock.py

This script configures the Dock content the
way I like it. Use with caution...

Hannes Juutilainen <hjuutilainen@mac.com>
"""

import sys
import getopt
import os
import subprocess

from Foundation import CFPreferencesAppSynchronize

# =======================================
# Standard Applications
# =======================================
appleApps = [
    "/Applications/Launchpad.app",
    "/Applications/Mission Control.app",
    "/Applications/App Store.app",
    "/Applications/Mail.app",
    "/Applications/Safari.app",
    "/Applications/iTunes.app",
    "/Applications/System Preferences.app",
    "/Applications/Xcode.app",
    "/Applications/Utilities/Activity Monitor.app",
    "/Applications/Utilities/Console.app",
    "/Applications/Utilities/Disk Utility.app",
    "/Applications/Utilities/Terminal.app"
    ]

# =======================================
# Standard Applications with different
# names in different OS versions
# =======================================
appleAppsWithVaryingNames = [
    {
    "path": "/Applications/Address Book.app",
    "args": [ "--after", "Safari" ]
    },
    {
    "path": "/Applications/Contacts.app",
    "args": [ "--after", "Safari" ]
    },
    {
    "path": "/Applications/iCal.app",
    "args": [ "--before", "iTunes" ]
    },
    {
    "path": "/Applications/Calendar.app",
    "args": [ "--before", "iTunes" ]
    }
    ]


# =======================================
# Optional Applications
# Add these if they exist or "forced"==True
# =======================================
thirdPartyApps = [
    {
    "path": "/Applications/1Password.app",
    "args": [ "--before", "Mail" ],
    "forced": True
    },
    {
    "path": "/Applications/Tweetbot.app",
    "args": [ "--before", "iTunes" ],
    "forced": True
    },
    {
    "path": "/Applications/Reeder.app",
    "args": [ "--before", "iTunes" ],
    "forced": True
    },
    {
    "path": "/Applications/Transmit.app",
    "args": [ "--before", "iTunes" ],
    "forced": True
    },
    {
    "path": "/Applications/Aperture.app",
    "args": [ "--before", "System Preferences" ],
    "forced": False
    },
    {
    "path": "/Applications/AppCode.app",
    "args": [ "--after", "Xcode" ],
    "forced": False
    },
    {
    "path": "/Applications/Gitbox.app",
    "args": [ "--before", "Activity Monitor" ],
    "forced": True
    },
    {
    "path": "/Applications/BBEdit.app",
    "args": [ "--before", "Activity Monitor" ],
    "forced": True
    },
    {
    "path": "/Applications/Spotify.app",
    "args": [ "--after", "iTunes" ],
    "forced": False
    },
    {
    "path": "/Applications/VMware Fusion.app",
    "args": [ "--after", "Terminal" ],
    "forced": False
    },
    {
    "path": "/Applications/Remote Desktop.app",
    "args": [ "--after", "Terminal" ],
    "forced": False
    }
    ]

dockutilPath = ""

class Usage(Exception):
    def __init__(self, msg):
        self.msg = msg

def dockutilExists():
    whichProcess = ["which", "dockutil"]
    p = subprocess.Popen(whichProcess, bufsize=1, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (path, err) = p.communicate()
    if os.path.exists(path.strip()):
        global dockutilPath
        dockutilPath = path.strip()
        return True
    else:
        return False

def removeEverything( restartDock=False ):
    dockutilProcess = [dockutilPath, "--remove", "all"]
    if not restartDock:
        dockutilProcess.append("--no-restart")
    p = subprocess.Popen(dockutilProcess, bufsize=1, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (output, err) = p.communicate()
    pass

def dockutilAdd(aPath, args):
    dockutilProcess = [dockutilPath, "--add", aPath]
    if args:
        dockutilProcess = dockutilProcess + args
    dockutilProcess.append("--no-restart")
    p = subprocess.Popen(dockutilProcess, bufsize=1, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (output, err) = p.communicate()
    pass

def main(argv=None):
    if argv is None:
        argv = sys.argv
    try:
        if not dockutilExists():
            print "dockutil not found"
            print "Get it from https://github.com/kcrawford/dockutil"
            return 1
        
        confirmation = raw_input("Are you sure? y/n: ").lower()
        if confirmation == 'y':
            print "Continuing..."
        elif confirmation == '' or confirmation == 'n':
            raise Usage("Exiting...")
        else:
            print 'Please enter y or n.'
            return 1
        
        removeEverything( restartDock=False );

        for anApp in appleApps:
            dockutilAdd(anApp, None)

        for anApp in appleAppsWithVaryingNames:
            if os.path.exists(anApp["path"]):
                dockutilAdd(anApp["path"], anApp["args"])
            else:
                print "Skipping %s" % anApp["path"]
        
        for anApp in thirdPartyApps:
            if os.path.exists(anApp["path"]) or anApp["forced"]:
                dockutilAdd(anApp["path"], anApp["args"])
            else:
                print "Skipping %s" % anApp["path"]
        
        # Write all pending changes to permanent storage
        CFPreferencesAppSynchronize('com.apple.dock')
        
    except Usage, err:
        print >> sys.stderr, str(err.msg)
        return 2

if __name__ == "__main__":
    sys.exit(main())
