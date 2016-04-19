#summary This page is the home page for development documents, ideas, drafts and other garbages.
#labels Phase-Design,Phase-Implementation,Featured

We are at 0.7.

# Roadmap #
  * 0.1: `Origin`
    * Original gtk2-aqd and gnome-macmenu-applet
  * 0.2: `Rename`
    * Rename to Global Menu in order to avoid confusion.
    * Menu bars are scrollable if they are too long to fit into the screen
  * 0.3: `Clean-up`
    * Introduce the inter-process communication protocol for GlobalMenuBar
    * Initial the support for Skinning.
    * GConf preference support for the applet.
    * Better UI.
  * 0.4: `Re-designation` - March 1st, 2008 Can we meet this date? YES WE CAN.
    * Completely redesign in OO to fit every piece into current GDK/GTK architecture.
    * Introduce GnomenuMenuBar and the concept: `global menu for legacy gtk software`
    * Fully solve the Skinning Problem
    * MenuServer widget for general purpose menu server.
  * 0.45: `Get some KDE` - thrown away.
    * GnomenuServerInterface
    * GnomenuServerHelper, implements GnomenuServerInterface
    * KdeMenuServerHelper, implements GnomenuServerInterface;
> > > Due to limitation, it shall lacks function.
    * Widget GnomenuMenuServer
  * 0.5: `trinity` - slipped; doomed; abandoned
    * The Menu system introspects itself store the introspection data as a property when attached to a toplevel window.
    * Minimize the IPC formalism. Abandon GnomenuSocket. SMS (broadcasting short messages).
    * The Menu Applet use the introspection data on the SMS listener window to build the menubar on the fly. (How to deal with the `transient_for` property?)
    * Menu Applet try to grab the `Alt+` shortcuts. (the AccelKeys should be controled by `GtkAction` and we don't need to bother on it.)
    * Slowest part is sending messages.
    * 

&lt;F10&gt;

 to take menubar back to the window. (up to changing)
  * 0.6: `dbus`
    * Move to [vala](http://vala.gnome.org) for core development.
    * Every Application exposes the Menu System as a DBus connection.
    * Every application registers the DBus bus name in `org.gnome.GlobalMenu.Server`
  * 0.7: `less-is-more`
    * implement the GlobalMenuSpecification
    * simplifed core
      * smaller code base
      * no dbus any more
    * hand written c code for time sensitive part in gtk-module
    * fewer IPC, faster response
    * feature rich applet
      * bunch of Gtk widgets for widget representation of global menu
      * f10 to activate the menubar.
      * window management
      * rgba support (->murrine)
  * 0.8: `unification`
    * Global Menu Specification V2
    * QT/KDE unification
    * `?` Switcher + Default Menu replaces gnome-panel-menu-bar and gnome-panel-menu
    * `?` Better user experience with compiz
  * 0.9: 'indicator'?
    * XML migrates to ubuntu application indicator's.
    * transport layer/API moves back to DBus, and compatible with application indicator.
    * integrate with application indicator.
    * applet compatible with application indicator.
  * 1.0: `futurama`
    * Stable Release!
    * work on 64bit and PPC.

# Features #
|DevelopmentDefaultMenu  |Target: 0.5| Happens to be Done in 0.4|
|:-----------------------|:----------|:-------------------------|
|DevelopmentCompatibilityEtoile|           |
|DevelopmentCompatibilityKDE|           |


# Document - 0.6 - deperacted #
in trunk, check out ClassMap.dia for a brief view of classes.

GnomenuMenuBar.switch() accepts a string form xwindow id, and shows the first menu bar of the given window.

# Development Documentation - 0.4 - deprecated #

## Classes ##

| Class Name | Desc |Parent       | Dependencies | Location |
|:-----------|:-----|:------------|:-------------|:---------|
| GtkMenuBar | old gtk menubar, hacked to return GnomenuMenuBar on demand| GtkMenuShell | GtkMenuItem, GnomenuMenuBar | gtk      |
| GnomenuMenuBar | global menubar | GtkMenuBar  |              | libgnomenu |
| GnomenuGlobalMenu | Global menu holder | GtkWidget   |              |libgnomenu |
## Arch ##

GnomenuMenuBar has two mode, decided by 'is-global-menu' property.

GnomeMenuQuirks will load quirks from a rc file(~/.libgnomenu.conf and /etc/libgnomenu.conf

Format:
```
program_name(regexp)      :       ignore, force-show-all, hide-on-quit, roaming
program_name/detail       :       ...................................
```
If there is multi matches, the result is accumulative.

Development documentation can be build. {{{
./autogen.sh --enable-gtk-doc
make
nautilus doc/program_name(regexp)      :       ignore, force-show-all, hide-on-quit, roaming
program_name/detail       :       ...................................
}}}```