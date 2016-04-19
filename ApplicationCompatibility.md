# Compatibility List #
Here is a list of applications' compatibility with gnome-globalmenu. These applications works with `libgnomenu` via gtk-aqd patch.

## Perfect ##
  * Accessories
    * gnome-terminal
    * gcalc
    * gedit
    * File-Roller
    * ghex2
  * Office/Productive
    * DIA
    * Gimp
    * gthumb
    * chmsee
    * evince
    * inkscape
    * gnome-specimen
    * ardour2 (foreround color is gray)
  * Internet
    * Galeon
    * Epiphany (Web Browser)
    * Evolution
    * Pidgin
    * ekiga
    * FileZilla
    * xchat
    * Azureus
  * Development
    * devhelp
    * Glade
    * gvim
    * eclipse
    * nemiver
  * Multimedia/Entertainment
    * TuxGuitar
    * gnome-sound-recorder
    * Rhythmbox
    * GNU Solfege
## Small problems ##
  * Desktop Menu Bar: Nautilus don't display desktop menu bar by default. One needs to edit `~/.libgnomenu.conf` to work around. (default quirk shipped in /etc/libgnomenu.conf; but don't work for every Locale)
    * nautilus
    * thunar (perhaps)
  * Improper quit: The following applications don't dispose the menu bar; they hold a reference to the widgets and don't release it. It is their bug and we can't do anything. The menu server needs several seconds to realize the application has quited.
    * F-spot
    * mousepad
  * Don't know what problem it is.
    * Totem
  * Blank at original menu bar position: One needs a quirk entry(roaming) to avoid the blank of the menu bar. The quirk, as the name indicates, makes the menu bar always out from the application window.
    * wxWindow application ( quirk shipped by default, assuming they all begin with `wx*`)
    * RapidSVN
    * audacity
    * VLC (a wxapp that doesn't work with the quirk)
## Big problems ##
> TBD

## Crash ##
> TBD

## Not support ##
  * Pseudo GTK applications, which don't use GTK widgets:
    * Firefox
    * Openoffice
  * Any application runs under another user account. e.g. all the system management applications. This is also a security consideration.
  * Wine Apps
  * VirtualBox OSE


## Community Contributed Reports ##
### Doesn't Work ###
  * gnome-calculator
  * netbeans
  * abiword (no menubar if you open a second document)
  * Rawtherappe
  * gxine
  * Eclipse (64bits)
  * Songbird
  * Inkscape (icons missing in menus)
  * Banshee-1 (shows up as "Nereid" in the app name, and the notification icon must be disabled or a "white" spot on the panel will appear)
  * wxPython apps (do not respond to the overrides when set by their name. To fix them, you need to add python : roaming.)