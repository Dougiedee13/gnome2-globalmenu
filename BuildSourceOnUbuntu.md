# Introduction #
This article will help you to build gnome-globalmenu from a svn snapshot.
Currently, this guide only works for trunk (svn 500+).


# Step 1: Obtain the Source #
Suppose you want to obtain trunk. for tags, branches, idea is the same.

```
svn checkout http://gnome2-globalmenu.googlecode.com/svn/trunk/ gnome-globalmenu
```
Then you are done.
# Step 2: Obtain necessary compiling packages #
```
sudo apt-get build-dep libgtk2.0-0
sudo apt-get install xfce4-panel-dev
```

# Step 3: Compile and install the gnome-globalmenu #
```
cd gnome-globalmenu
dpkg-buildpackage -b -rfakeroot
cd ..
sudo dpkg -i gnome2-globalmenu-applet_0.4-1_i386.deb
```

# Step 4: Compile and install the gtk-aqd patched Gtk library #
  * Obtain GTK source code
```
cd trunk/gtk+-aqd/
apt-get source libgtk2.0-0
```

  * Obtain gtk-aqd patch for Ubuntu Gusty
```
cd gtk+2.0-2.12.0
wget http://gnome2-globalmenu.googlecode.com/files/patch.diff.tar.bz2
tar jxvf patch.diff.tar.bz2 
```

  * Patch the Gtk
    * For Gusty:
```
cd gtk+2.0-2.12.0
wget http://gnome2-globalmenu.googlecode.com/files/patch.diff.tar.bz2
tar jxvf patch.diff.tar.bz2 
patch -p1 < ./patch.diff
```
    * For Hardy:
> > `make patch`

  * Then compile Gtk
```
cd gtk+2.0-2.12.0
dpkg-buildpackage -b -rfakeroot
```

  * Install what you have compiled.
```
cd ..
sudo dpkg -i *.deb
```

  * Restart your computer.

# Step 5: Testing #

> If no error occurs, your GTK is already patched. Try to start a simple GTK program in a console and you will see a debugging messages, indicating libgnomenu not found.
```
....
Using GtkMenuBar.
....
```

> Right click your panel find and add Gobal Menubar. Run a typical gtk program, see if it works.
    * **Skip** this step for a build of svn 833+
```
GTK_MODULES=libgnomenu gedit
```

> To keep the global menubar always run at startup, you should edit ~/.gnomerc file.
```
gedit ~/.gnomerc
```
> and add a line to it
  * **SKIP**  skip this step with svn 833 or later.
```
export GTK_MODULES=libgnomenu
```

# Step 5: Removing #
  * Remove gnome-globalmenu-applet
```
sudo dpkg -r gnome2-globalmenu-applet
```

  * Reinstall the default Gtk library.
> Checkout your update-manager, and reinstall the Gtk library releated packages.