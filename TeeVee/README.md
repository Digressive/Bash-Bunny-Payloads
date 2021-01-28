# TeeVee

* Author: Mike Galvin / Digressive
* Version: Version 1.0
* Category: Remote Access
* Target: Windows 10 / PowerShell

Detail setup instructions are available on my site: [https://gal.vin](https://gal.vin/posts/team-viewer-silent-install-and-configuration/)

Twitter:[@mikegalvin_](https://twitter.com/mikegalvin_)

## Description

This payload will launch an elevated PowerShell session and run t.ps1 from the BashBunny.

t.ps1 will silently install the free version of TeamViewer, import a desired configuration, and dump the TeamViewer ID in the loot directory.

### Configuration

* You will need download the current free version of TeamViewer and put the exe into the bin folder on the BashBunny.
* You will need to export the desired configuration from an installion of TeamViewer that you have already configured as required.
* You will need specify the TeamViewer personal password when you export the file.
* You'll need to make some changes to the file before using it.

You can use the included example-settings.reg file to test. The personal password is "lamepassword".

For 64-bit Windows add: WOW6432Node to the registry key paths.

Add the following key to the end of the file:

``` txt
[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TeamViewer\DefaultSettings]
"Autostart_GUI"=dword:00000001
```

### Status

| LED    | Status               |
| ------ | ---------------------|
| SETUP  | Setting up attack    |
| ATTACK | Injecting keystrokes |
| FINISH | Done                 |
