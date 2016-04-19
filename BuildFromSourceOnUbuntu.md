# Introduction #
Based on a [guide by Ayoli](http://ayozone.org/2009/01/08/install-gnome-globalmenu-07-series/)

# Step 0: Prerequisites #
Get the required packages to build vala and gnome-globalmenu :
Open a Terminal (Applications >> Accessories >> Terminal)

```
sudo apt-get install build-essential flex bison gnome-common libglib2.0-dev gtk-doc-tools autoconf2.13 automake1.9 libgtk2.0-dev libdbus-glib-1-dev libwnck-dev libpanel-applet2-dev libgnome-menu-dev libnotify-dev
```

You have two methods to get vala. **Either** 1a or 1b.
If you've installed Vala before by compiling it, make sure to do 1a and 1b before going to Step 2 (to be able to remove all traces of a previous manual Vala install)

# Step 1-a: Install Vala from the PPA Repository #

You should add the Repository and update (or install Vala)
https://edge.launchpad.net/~bruce89/+archive/ppa

# Step 1-b: Obtain the Source for Vala 0.5.5 #

```
cd ~/
wget -c http://download.gnome.org/sources/vala/0.5/vala-0.5.5.tar.bz2
tar xjvf vala-0.5.5.tar.bz2
cd vala-0.5.5/
```

# Step 2: Make sure that no older version of vala is installed #

If you're using the source version, make sure that no prior version is installed as a deb by typing
```
sudo dpkg-query --list |grep vala
```

If that is the case then type:

```
sudo apt-get remove vala
```

Make sure that no source install older than 0.5.5 is on your system. As you're in the Vala directory you've just downloaded, just type:
```
sudo make uninstall
```

You can check which version of Vala is installed by typing:
```
valac --version
```

# Step 3: Configure and Compile Vala #

```
./configure
make
sudo make install
sudo ldconfig
```

You can check that Vala 0.5.5 is installed and that you ready to go on by typing:
```
valac --version
```

# Step 4: Obtain the Source for GlobalMenu #

Download GlobalMenu

```
cd ~/
svn checkout http://gnome2-globalmenu.googlecode.com/svn/trunk/ gnome-globalmenu-0.7
cd gnome-globalmenu-0.7
```

# Step 5: Configure and Compile GlobalMenu #

```
./autogen.sh --prefix=/usr
make
sudo make install
```

# Step 6: Remove an obsolete line if you used GlobalMenu before #
If you had globalmenu before and have this line in your ~/.gnomerc or ~/.profile : remove it

export GTK\_MODULES=globalmenu-gnome

# Step 7: Add the GlobalMenu to your panel and enable it #

  * Right click on an empty part of your panel
  * choose “Add to panel” from the popup menu
  * Scroll down until you see “Global Menu Panel Applet”
  * Select it and click “add” (or drag and drop it on the panel)
  * GlobalMenu can now be enabled via the preferences dialog of the applet.
  * Right Click on the applet
  * Choose preferences
  * Check the first option : “Enable Global Menu For GTK Applications”.

# Step 8: Enjoy #
And report any bug or features you'd want to see in Issues.


And voilà ! :)