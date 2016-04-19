# Introduction #
This article will help you to build gnome-globalmenu from a svn snapshot.
This guide works for the 0.7.x branch, but not for the current 0.9.x branch.


# Step 0: Prerequisites #

  * VALA = [0.7.7](http://download.gnome.org/sources/vala/0.7/vala-0.7.7.tar.bz2) is a must for building from svn. Building from a released tarball doesn't need it.
    * lastest trunk build of vala should work, though not tested.
    * [SRPM](http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=vala&colspec=Filename+Summary+Uploaded+Size+DownloadCount)
    * Please also check the configure.ac file for the most updated requirement on VALA
    * `libwnck-1.0`
    * `gtk+-2.0`
    * `gnome-menus`
    * `libpanelapplet-1.0` (for `GlobalMenu.PanelApplet`)

# Step 1: Obtain the Source #

Read GitRepository for how to get the source code from the git repository.

# Step 2: Compile the Source #

## configure ##
```
cd gnome-globalmenu
./autogen.sh --prefix=/usr --sysconfdir=/etc
make
```

For most linux flavors I know, `--prefix=/usr` is more preferable than `--prefix=/usr/local`. The `sysconfdir` parameter is to make `gconf` happy.
Other things you may want to change are (useful for packagers)
```
--disable-tests # disable building the tests (they take some time)
--disable-schemas-install # disable installing the gconf schemas. DON'T use this unless you know what you are doing
```
## components ##

Take a look at GlobalMenuSpecification to first understand the required components.

`libglobalmenu-gnome` converts each gtk window to a client.
`GlobalMenu.PanelApplet` is a Global Menu Server. It is a panel applet that features some window management.
`libgnomenu-panel` is another Global Menu Server. It is a GTK Plugin that adds global menu entry to the GNOME main menu bar.

### module ###

`libglobalmenu-gnome` is a GTK plugin module that makes GTK aware of the global menu by dynamic patching. The library is built under `gtk-modules/globalmenu/`.

At this stage you can set the environment to test the global menu:
```
export GTK_MODULES=globalmenu-gnome
```
Using the environment variable to load the module for end users is not recommended because it is not integrated into the gnome stack. After installation you can enable the module with a gconf key, as mentioned later.

If you are debugging, some [libtool tricks](http://developer.apple.com/documentation/developertools/glibtool/libtool_3.html#SEC11) can help
```
cd gtk-modules/globalmenu;
libtool gdb [any application]
```

Environment variable `GLOBALMENU_GNOME_AGRS` contains the gnu style arguments of the gtk plugin module library
```
GLOBALMENU_GNOME_ARGS=
--verbose
--disable
--log-file="filename"
```

In order not to mess up with `gnome-keyring` and similar applications that relies on 'zero' output of messages, by default the module will log the verbose messages to `~/.gnomenu.log`.

The magic environment variable `GTK_MENUBAR_NO_MAC` can be specified for the module to ignore the applications.
```
export GTK_MENUBAR_NO_MAC=[prgname list, eg: "gedit gnome-settings-daemon"]
```
If some application doesn't work well with the plugin, please file an
[issue](http://code.google.com/p/gnome2-globalmenu/issues/list).

### applet ###

The gnome-panel applet is built at `applet/GlobalMenu.PanelApplet`. The applet is built with `libgnomenu`, which composes the GTK widget representaion of Global Menu.

If `GNOME_GlobalMenu_PanelApplet.server` is not installed to the correct `bonobo-activation` location, you can not add the applet to the panel.

Also, see [David's tricks](http://www.davyd.id.au/articles/debugging-gnome-applets.shtml) for debugging a panel applet.

`--verbose` for many debug messages.


# Step 3: Install #
## check ##

First check if things are sane.
```
make check
```

Sometimes the checks are broken. If that's the case please file a bug report.

## install ##

To install
```
su -c 'make install'
```

## post-install configuration ##

If you disabled the installation of the schema, please install it by the method specified by your distributation.

Ensure `libglobalmenu-gnome` is loaded as a Gtk module by setting the gconf key
```
apps/gnome-settings-daemon/gtk-modules/globalmenu-gnome
```
Notice that loading and unloading the module on the fly is yet experimental. Random crashes do occur: Save your work before toggling Global Menu! So please immediately restart your gnome session after changing this key.

Remember to add the applet to your panel. There is also a shortcut to this key in the preference window of the applet.



# Step 4: Packaging #

HINTS:

Because some of the c source code is built from vala code, prepend a `make` before `make dist` to avoid strange building problems.


# Step 5: Remove #

```
su -c 'make uninstall'
```

# Troubleshooting #
## In General ##
Please report to our project's mail list the detail of the trouble which traps you . We will try to help. the address of the mail list is `googlegroups.com: gnome-globalmenu` . reverse the order and replace `:` with `@`.

GIT traffic also goes into the groups.