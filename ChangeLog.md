
---

gnome-globalmenu 0.7.9

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.9

  * Feature a completely rewritten gtk plugin
  * Introducing Gnomenu.Settings
  * [Issue 355](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=355)
  * [Issue 470](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=470)
  * Be sure to cleanly remove 0.7.8 before installing 0.7.9
    * Remove GConf Key apps/gnome\_settings\_deamon/gtk-modules/globalmenu-gnome
    * Remove /usr/lib/gtk-2.0/2.10.0/modules/libglobalmenu-gnome.so



---

gnome-globalmenu 0.7.8

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.8

  * Updated to VALA 0.7.7
  * Enhanced multihead support
> > (enable per-monitor-mode, and add an applet to each monitor)
  * Improved source code, larger comments/code ratio.
  * Further improved preference dialog usability.
  * Integrating into gnome-panel(aka the 'Applications Places System' menu),
> > toggle with gconf://apps/gnome\_settings\_daemon/gtk-modules/gnomenu-panel.
> > -- Experimental, Please TEST.
  * Enhanced compatability with Ubuntu karmic ([Issue 507](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=507))
  * Minor fixes
  * Update the translations.


---

gnome-globalmenu 0.7.7

`svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.7`

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.7

  * UPdate to VALA 0.7.5
  * The package is now rebuiltable from the vala source code.
  * Fix crashing 64bit apps ([Issue 408](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=408))
  * Added the option to disable the search box in window list ([Issue 439](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=439))
  * Toggle RGBA via preference dialog ([Issue 431](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=431))
  * Improved Preference dialog usability ([Issue 424](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=424))
  * Fixed excess cpu time(regression) ([issue 484](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=484))
  * Improved TransientFor handling (mentioned in GlobalMenuSpecification)
  * Updated some translations


  * known problem (crashes wth backgrond since 0.7.7-beta, [Issue 490](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=490))
> > Fixed in 0.7.7\_1 (tags/v0.7.7\_1)


---

gnome-globalmenu 0.7.6

`svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.6`

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.6

  * Catch-up release
  * UPdate to VALA 0.7.3 ([Issue 370](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=370))
  * Removed excessive xsession log ([Issue 406](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=406))
  * Improved multithread ([Issue 408](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=408))
  * Added new event types SELECTED and UNSELECTED ([Issue 412](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=412))
  * Various improvements
  * Added some translations
  * Updated some translations


---

gnome-globalmenu 0.7.5

`svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.5`

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.5

  * Fixed a serious leak in 0.7.4 ([Issue 387](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=387))
  * Reworked application name detection. ([Issue 385](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=385))
  * Upgraded to VALA 0.6.0 (won't compile with 0.7.0 or 0.5.7) ([Issue 370](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=370))
  * Shortcut Keys in overflown menu ([Issue 362](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=362))
  * Improved GTK Module efficiency, especially with GVIM ([Issue 365](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=365))
  * Vertical Panel unusable because of the ellipsizing ([Issue 379](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=379))
  * Reworked overflown menu, improving the transparency ([Issue 104](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=104))
  * `Alt-<Key>` ([Issue 301](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=301))
  * License cleaned up ([Issue 383](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=383))
  * Experimental hybrid submenu(popup menu) handling,
> > Enabled by `export GLOBALMENU_GNOME_ARGS=--hybrid`
  * Special case for GnomeDo's docky, patch from jassmith. ([Issue 400](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=400))
  * Search Box is now case-insensitive.
  * Mention about `export GTK_MODULES=globalmenu-gnome` if the module is not detected ([Issue 399](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=399))
  * Completely quite-nize the applet when --verbose not given ([Issue 406](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=406))
  * Added some translations
  * Updated some translations


---

gnome-globalmenu 0.7.4

`svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.4`

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.4

  * Online help goes to HelpCentral wiki page ([issue 290](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=290))
  * if the schema for the gconf key is not found, show some thing instead of giving an empty preference dialog ([issue 332](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=332))
  * Improve the race with docks ([Issue 316](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=316))
  * install the xfce plugin to correct location on xfce 4.6. ([issue 304](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=304))

  * refactor libgnomenu, introducing Gnomenu.Shell and Gnomenu.Item interfaces
  * rewrite Gnomenu.Parser to remove the dependency on `g_markup_parse_context_push` and `_pop`.

  * Fixed crashing on OSX theme. ([issue 314](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=314))
  * skip menubars in GtkNotebook, workaround Monodevelop and gnome-appearence-properties. ([issue 350](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=350), [issue 341](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=341))
  * Fixed the overflown menu items. ([issue 360](https://code.google.com/p/gnome2-globalmenu/issues/detail?id=360))


---

gnome-globalmenu 0.7.3

`svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.3`

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.3

  * Improved XFCE Plugin
    * (1) dependency to gmenu removed.
    * (2) border (1 pixel at topmost) (need to be verified)
  * Improved Switcher on
    * (1) application name detection
    * (2) menu layout
    * (3) Rebased the switcher with libgnomenu
  * libgnomenu.so seperately installed
  * libgnomenu is gir ready under namespace Gnomenu, configure with --enable-gir.
  * Gracefully loading and unloading the gtk module
  * Avoid the bazzar 'Global Menu Bar' label at startup ASAP
  * Added a svn version in applet's about dialog(only if built from svn)
  * Smarter applet: if the gtk module is not loaded, send a desktop notify to guide the user. NEW BUILDING DEPENDENCY: libnotify-dev/libnotify-devel.
  * Place icons correctly in a vertical panel
  * Added many translations
  * Fixed several memory issues (core dump at about/pref dialog)



---

gnome-globalmenu 0.7.2

`svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.2`

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.2

  * Experimental XFCE Plugin; edit `~/.config/xfce4/xinitrc`(and chmod +x) to enable the GTK Plugin
```
#!/bin/sh
export GTK_MODULES=globalmenu-gnome
. /etc/xdg/xfce4/xinitrc
```
  * Removed explicit GIO dependency; the gtk plugin module compiles and works with GTK 2.10.
  * Updated to vala 0.5.5; pre-0.5.5 vala no longer compiles the svn source;
  * Improved documentation
  * Code refactoring, improved speed, bigger memory foot print (6-8 MiB RSS)
  * es\_ES translation
  * ru\_RU translation
  * Fixed issues when AWN is the active window
  * Fixed Several leaks in the GTK plugin module
  * Fixed the wrong size allocation of icon in menu items.


---

gnome-globalmenu 0.7.1

`svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.1`

Downloads:

http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.1

  * Bug fixes
  * Enable/Disable Global Menu via GtkSettings and the applet.
    * loading globalmenu-gnome via GTK\_MODULES is no longer supported.
    * suid applications now also respect global menu. (security!)
  * Disable RGBA by default due to stability issues.
  * it\_IT, fr\_FR, zh\_CN Translations

---

gnome-globalmenu 0.7 (alpha)
  * svn1845 All children in PanelApplet and subclass of GnomenuMenuBar changed to 'local' by default. No need of GTK\_MENUBAR\_NO\_MAC(still supported) for gnome-panel, user swither, unit tests, and most panel related applications.
  * svn1833 Added window list and window title to switcher.
  * svn1830 Theming issue
  * svn1823 Switcher
  * svn1816 Awareness of gnome\_settings\_daemon/gtk-modules.
    * Unloading is yet unstable. perhaps bugs of GTK/gsd.
    * No need to use GTK\_MODULES=globalmenu-gnome. (still supported)
  * svn1796 gconf configuration for the applet
  * svn1795 register the gtk module in gnome-settings-daemon's gconf key
  * svn1762 all parameters of libglobalmenu-gnome are combined to GLOBALMENU\_GNOME\_ARGS
    * --verbose
    * --disable
    * --log-file="filename"
  * svn1725
    * 0.7-devel branch starts
  * svn1723
    * RGBA support for Gnomenu.Menu
  * svn1711
    * grab F10(or what ever in GtkSettings)
  * svn1696
    * + alpha: the core is ready. please test the stability.


---

gnome-globalmenu 0.6 (current development version)

  * svn1509
    * +window selector
  * svn1446
    * +GTK\_MENUBAR\_NO\_MAC is back.
  * svn1478
    * +relatively stable global menu core.
  * svn1415
    * +Adding accelerator labels.
  * svn1408
    * +aware of transient\_for windows.
  * svn1401
    * +major theming issues are solved.
  * svn900+
    * NOTE: When you switch to svn 900+, the line GTK\_MODULE=libgnomenu should be removed.

  * Wednesday, Oct 29 2008, the GTK module is renamed to libglobalmenu-gnome.so and installed to `$libdir/gtk-2.0/modules`. `GTK_MODULE=globlamenu-gnome` is sufficient to load the module.

  * Friday, Oct 10 2008, the DBus branch is merged into trunk. GTK\_MODULE=libgnomenugtk is back.

  * Thursday, Oct 09 2008, the project turns to DBus for IPC backend. in branches/0.6-devel

  * Monday, Aug 08 2008, A series of new modification is pushed to trunk and it becomes completely broken(for everyday users) before new development is done.

---


gnome-globalmenu 0.5

  * aborted


---


gnome-globalmenu 0.4

  * svn790 (Friday, March 14th 2008)
    * +Treatment of overflowed menu items.
    * +Customize title font.

  * Sunday, March 09 2008, GNOME Global Menu 0.4 shall be considered as available(via svn or packages) for daily use. ReleaseNotes.

  * svn570 (Friday, February 29th 2008)
    * Some one write something here.


---


gnome2-globalmenu 0.3

  * svn323
    * + Users can now customize the appearance.
    * + A new deploying script reduces difficulty for building from scratch. (Hopefully will also reduce packaging difficulty.)

Downloading from svn is preferred.
svn checkout http://gnome2-globalmenu.googlecode.com/tags/0.3_323 gnome2-globalmenu


---


gnome2-globalmenu 0.3

Completely new patch/code for gtkmenubar. Reconstructed menu server.

  * + Stupid Menu Bar Scrolling
  * - No Window icon
  * + Skinning(partially working)
  * + New Protocol: Connectionless, Asynchronous(Should update the Specification)
  * + True Server/Client Architecture
  * + Stability
  * + Menu server auto detection
  * + Auto Guessing whether the menubar is a global one instead of hard coded window names.

http://gnome2-globalmenu.googlecode.com/svn/branches/0.3/


---


gnome2-globalmenu 0.2.1

  * + Press Alt and F10 in application window will invoke menus
  * + New look and feel for scrolling long menubars
  * + Added Application Icon, and application title appears as a tooltip.
  * + Automatic gtk2-aqd build tool for fedora with guide README
  * + Sample bonobo .server file for the Applet
  * + Standalone mode applet for easy debugging
  * - Removed application title's label
  * - Doesn't respect KDE's floating menubars.
  * + Packaging tarball of the applet works

http://gnome2-globalmenu.googlecode.com/svn/branches/0.2.1/