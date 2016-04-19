**Table Of Contents**

# Installing from the GNOME Global Menu PPA #
This is the best way to get the latest version of the GlobalMenu. PPAs work like normal Ubuntu archives. You can install software in the usual way (for example, through apt-get or synaptic) and whenever there's an update Ubuntu will prompt you to install it.

### Adding the PPA to your Ubuntu repositories ###

To install packages from our PPA, you need to tell Ubuntu where to find it. You do this by giving Ubuntu the PPA's URL, which you can find on the PPA's overview page.
  1. Open **System** → **Administration** → **Software Sources** and press Third Party Software.
  1. Press Add to add a new repository.
  1. Enter the APT line for the extra repository.
    * If you're using Karmic Koala:
```
        deb http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu karmic main 
        deb-src http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu karmic main 
```
    * If you're using Jaunty Jackalope:
```
        deb http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu jaunty main
        deb-src http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu jaunty main
```
    * If you're using Intrepid Ibex:
```
        deb http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu intrepid main
        deb-src http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu intrepid main
```
    * If you're using Hardy Heron:
```
        deb http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu hardy main
        deb-src http://ppa.launchpad.net/globalmenu-team/ppa/ubuntu hardy main
```
  1. Press Add Source and then click Close to save your changes.
  1. You will be notified that the information about available software is out-of-date. Press Reload.
  1. You now need to import and accept our GPG key with which we digitally sign the files  we provide, which makes it easy to check that the files have not been tampered with since their creation. In order for apt to be able to check this, you need the public key that corresponds to the signatures. [http://gnome2-globalmenu.googlecode.com/files/GlobalMenuKey.gpg](http://gnome2-globalmenu.googlecode.com/files/GlobalMenuKey.gpg)
  1. Once you have downloaded the GPG key, import the key by selecting the Authentication tab, clicking on Import Key File, and then selecting the GPG key to be imported.


### Remove older versions of GlobalMenu (if necessary) ###

```
sudo apt-get remove gnome2-globalmenu
```

### Install the GlobalMenu package ###

```
sudo apt-get install gnome-globalmenu 
```

NOTE:
On Hardy, after clicking "Enable Global Menu" in the applet's preference window, nothing happens. It's because gnome-settings-daemon in hardy is old and doesn't support loading external Gtk plugin modules. You can either upgrade to Intrepid or you have to export GTK\_MODULES=globalmenu-gnome manually in either .gnomerc or .bash\_profile.

# Installing with DEBs on a 32 or 64 bit system #
You can download the deb directly from the PPA page and install it manually. Note that using this method, you won't get automatic updates!

[https://edge.launchpad.net/~globalmenu-team/+archive/ppa](https://edge.launchpad.net/~globalmenu-team/+archive/ppa)

There are now 64-bit Ubuntu packages in the PPA. Please test them and report any bug you may find (after checking for duplicates). For more information, see [Issue 149](http://code.google.com/p/gnome2-globalmenu/issues/detail?id=149)

# Installing from source #
### latest version of the Global Menu ###
Please refer to the [BuildFromSource](BuildFromSource.md) page.
### older versions of the Global Menu ###
#### very old adq's original code ####
If you really want the very old adq's original code you can check it out from:
http://gnome2-globalmenu.googlecode.com/svn/tags/0.1_11/

#### Ayoli's guide for the 0.7 version ####

Refer to the [guide](http://ayozone.org/2009/01/08/install-gnome-globalmenu-07-series/) written by Ayoli.