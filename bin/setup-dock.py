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
import plistlib
import getpass

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

def localDisks():
    """Run diskutil list -plist """
    diskutilProcess = ["diskutil", "list", "-plist"]
    p = subprocess.Popen(diskutilProcess, bufsize=1, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (output, err) = p.communicate()
    if output != "":
        outputPlist = plistlib.readPlistFromString(output)
        return outputPlist['VolumesFromDisks']
    else:
        return None

def addFolders():
    """
    Loop through all local disks and check if they contain:
        <Disk>/Users/username/Documents
        <Disk>/Users/username/Downloads
        or
        <Disk>/home/username/Documents
        <Disk>/home/username/Downloads
    
    Add everything that exists.
    """
    username = getpass.getuser()
    pathsToCheckInDisks = [ "Users", "home" ]
    foldersToAdd = [ "Documents", "Downloads" ]
    for aDisk in localDisks():
        diskPath = os.path.join("/Volumes", aDisk)
        for aPath in pathsToCheckInDisks:
            homePath = os.path.join(diskPath, aPath, username)
            homePath = os.path.realpath(homePath)
            documents = os.path.join(homePath, "Documents")
            downloads = os.path.join(homePath, "Downloads")
            if os.path.exists(documents):
                print "Adding %s" % documents
                label = "Documents (%s)" % aDisk
                args = [
                    "--view", "grid",
                    "--display", "stack",
                    "--sort", "name",
                    "--label", label
                    ]
                dockutilAdd(documents, args)
            if os.path.exists(downloads):
                print "Adding %s" % downloads
                label = "Downloads (%s)" % aDisk
                args = [
                    "--view", "grid",
                    "--display", "stack",
                    "--sort", "dateadded",
                    "--label", label
                    ]
                dockutilAdd(downloads, args)
            

def main(argv=None):
    if argv is None:
        argv = sys.argv
    try:
        if not dockutilExists():
            print "dockutil not found"
            print "Get it from https://github.com/kcrawford/dockutil"
            print "or run \"git clone https://github.com/kcrawford/dockutil.git\""
            return 1
        
        confirmation = raw_input("Are you sure? y/n: ").lower()
        if confirmation == 'y':
            print "Continuing..."
        elif confirmation == '' or confirmation == 'n':
            raise Usage("Exiting...")
        else:
            print 'Please enter y or n.'
            return 1
        
        # Start with an empty Dock
        removeEverything( restartDock=False );
        
        # Add standard Apple apps
        for anApp in appleApps:
            dockutilAdd(anApp, None)
            #print "Added %s" % anApp
        
        # Add more Apple apps
        for anApp in appleAppsWithVaryingNames:
            if os.path.exists(anApp["path"]):
                dockutilAdd(anApp["path"], anApp["args"])
                #print "Added %s" % anApp["path"]
            else:
                print "Skipped %s" % anApp["path"]
        
        # Add 3rd party apps
        for anApp in thirdPartyApps:
            if os.path.exists(anApp["path"]) or anApp["forced"]:
                dockutilAdd(anApp["path"], anApp["args"])
                #print "Added %s" % anApp["path"]
            else:
                print "Skipped %s" % anApp["path"]
        
        # Add folders
        addFolders()
        
        # Write all pending changes to permanent storage
        CFPreferencesAppSynchronize('com.apple.dock')
        print "Done. You might want to restart Dock by running \"killall Dock\""
        
    except Usage, err:
        print >> sys.stderr, str(err.msg)
        return 2

if __name__ == "__main__":
    sys.exit(main())
