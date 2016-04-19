# Uninstall instructions #
OUTDATED: DO NOT USE OR MODIFY FOR THE MOMENT



#### For the apt-built method ####


If you have used the apt-build method to install the patched GTK do this to uninstall :

1. Go to menu system > administration > software sources. Pick the “third party software” tab, and uncheck apt-build repository.

2. Then in a terminal type in:

```
sudo apt-get clean && sudo apt-get update && sudo apt-get install --reinstall -y libgtk2.0-0 
```

3. Logout / in gnome to apply changes.


#### For all methods ####

Because Mac-Applet-Menu is hacked, the way to uninstall it has a trick.

Open Gedit and paste this : export GTK\_MENUBAR\_NO\_MAC=1

Name the text file .gnomerc and save it in your home folder (/home//).
Logout ,relogin and the hack should be disabled.

If you want to completely remove it, fire up synaptic and search for libgtk2.0-0.
Highlight it and go to menu -> packages -> force version ,
select the version that ends with the stable release of the ubuntu version you're running (eg: edgy, feisty, gutsy) , press ok and then apply in synaptic.