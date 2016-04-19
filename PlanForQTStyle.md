# Introduction #

Some GNOME-ish apps are turning from GTK to QT. (vlc for example), because of the smoothly integrated QGtkStyle introcudec in QT 4.5.

We need to give an alternative QGtkStyle that is compatible with Global Menu.

# Details #

## QGtkStyle ##
> QGtkStyle repo is still availible on QT Labs; the integration into QT doesn't introduce much changes.

> So a good starting point would be cloning QT labs QGtkStyle repo, applying a huge patch from current QT released source code. (Since there is no public repo for QT).

## Bespin ##
> Bespin has some code that is related to hiding/showing the local menu bar. However its style is not compatible with Gnome style. The codebase is also too large to start with, when compared with QGtkStyle.

## Issues ##
  * Cloning QGtkStyle repo (done)
  * Compile and load QGtkStyle (done)
  * Compile and load QGtkStyle after merging Current QT code
  * Figure out how to access X11 back end from QT
  * Write a Global Menu serializer for QT
  * Figure out how to detect changes of menu in QT
  * Figure out how to simulate menu actions in QT

> We probably have to resort to DBus for the communicate, as indicated in Bespin.
> How can we make DBUS compatible with Global Menu?