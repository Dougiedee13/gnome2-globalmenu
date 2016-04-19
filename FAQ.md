  1. How can I support Gnome Global Menu ?
    * [voting for Global Menu](http://brainstorm.ubuntu.com/idea/3136/) in Ubuntu's Ideastorm
    * Using your skills to help developing Gnome Global Menu;
    * Writing documentation;
    * [Translating](Translation.md) it into your language;
    * Taking relevant tips and info from the [UbuntuForums.org thread](http://ubuntuforums.org/showthread.php?t=241868) and summering it;
    * You name it/ any other idea you might propose us.
  1. Is it possible for global menu to support Firefox and OpenOffice.org?
    * **YES**, in theory it is possible to patch any application to make them global menu aware;
    * And **NO**, Firefox and OpenOffice come with XUL and DSO (respectively) which are huge monsters to work with, therefore in practice it is impossible to implement such a plugin on a patch without any expertise in these monsters. If you find a clean solution we'll be all very happy to merge it in the project though;
    * For the moment we don't plan to reinclude the hacks that allowed OpenOffice and some others programs to be natively compatible.
  1. Why is the latest version missing functionalities ?
    * We are not software experts (yet);
    * In order to get accepted in GNOME and for long term stability, we've decided to rewrite Global Menu in Vala. Starting from scratch allowed us to have an overall better design, and for the code to be more simple for new developers;
    * The drawback is that we have to reimplement all the features of the previous version. If you think you can help, just chime in !
  1. I would like the Global Menu to have feature X, Y and Z. What can I do to tell the developers ?
    * You can look in **Issues** to see if the feature you want has been already asked for. If so, just star it (and comment it only if you need to);
    * Otherwise, just report it in **Issues** in a clear and professional way.
  1. How can I get the latest version for my distribution ?
  1. How can I get the more feature-full version for my distribution ?
    * [Read the installation guide](Installation.md)
  1. 64 bits support anyone ?
    * The latest revs seems to be compatible. See http://code.google.com/p/gnome2-globalmenu/issues/detail?id=149
  1. Why are you obsessed with duplicating alien interfaces? You'll have legal problems/ Apple will eat your first newborn...
    * This is Global Menu Project, not an OSX Duplication Project. If Apple wants to eat us they'd better eat KDE first, since KDE also have a similar interface. Any legal assistance on this topic will be appreciated.
  1. How do I uninstall/remove the Gnome GlobalMenu ?
    * Remove the package in the same way as removing other packages.
  1. How to let XFCE work with global menu?
    * XFCE doesn't have a nice way to edit gtk-modules in GtkSettings. What you can do is to create `~/.config/xfce4/xinitrc` with the following content:
```
      #!/bin/sh

      export GTK_MODULES=globalmenu-gnome
      . /etc/xdg/xfce4/xinitrc
```
    * and login again.
  1. On Hardy, after clicking "Enable Global Menu" in the applet's preference window, nothing happens.
    * gnome-settings-daemon in hardy is old and doesn't support loading external Gtk plugin modules. You have to add manually in either your .gnomerc or .bash\_profile file(which is in your home directory).
```
export GTK_MODULES=globalmenu-gnome
```


  1. Ask your questions about Global Menu in [Issue 223](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=223) (so that project members are notified)