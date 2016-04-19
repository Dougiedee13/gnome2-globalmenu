This document is deprecated by the new plugin module in globalmenu-plugin/

No design document is yet written for the new plugin module.


# Introduction #

libglobalmenu-gnome is a GTK plugin module that dynamically patches GTK to make it Global Menu compatible. It overrides several virtual functions, and register several signal handlers and emission hooks in a GTK-opaque way to achieve the following goals:
  * Serializing the GTK menu hierarchy to the XML reprensentation of Global Menu and set to the Menu Context.
  * Notifying the application about the arrival of any Menu Event

In short, it makes the idea of Global Menu possible in this complicated real world.

# DynPatch #
DynPatch library contains the routines to change the behavior of GTK.

## Libary Interface ##

  * `dyn_patch_init` to initalized dyn\_patch. The code should be protected by gdk threads lock. (Related to [Gnome BUG 566678](http://bugzilla.gnome.org/show_bug.cgi?id=566578))
  * `dyn_patch_uninit` to uniniailize dyn\_patch. The code should be protected by gdk threads lock, too.

DynPatch exposes three extra signals on a regular GTKMenuBar:
  * `dyn-patch-attached`: emitted when the menubar is attached to a toplevel window. The parameter is the toplevel window.
  * `dyn-patch-detached`: emitted when the menubar is detached from a toplevel window. The parameter is the old toplevel window.
  * `dyn-patch-changed`: emitted when the menu hierarchy leaded by the menubar has changed.

DynPatch exposes two helper functions:
  * `dyn_patch_get_menubar`: get the menubar of a given toplevel window.
  * `dyn_patch_get_window`: get the toplevel window of a given menubar.
## Under the Stage ##

### Overriding the Virtual Functions ###

The virtual functions are overriden by brute force, with these macros:
`OVERRIDE_SAVE`, `OVERRIDE`
the old vfuncs are saved in a hash table, to be restored with `RESTORE` macro.

The overriding is issued by `dyn_patch_type` on a given type with the patcher function.
The patcher functions are given in `dyn-patch-menubar.c` `dyn-patch-widget.c` `dyn-patch-menushell.c` repectively.

### Propagation of the 'menubar' Data Member ###
If a widget is a direct or indirect child of a menubar, its `__dyn-patch-menubar__` data memeber is set to the menubar for later reference.

This done by `dyn_patch_set_menubar_r`, the `parent_set` vfunc in `dyn-patch-widget.c`, and the signal handler on `notify::submenu`.

### Capture Changes: Signal Handlers ###

The `notify` signal on relavent widget properties are listened with `dyn_patch_simple_notify` during the propagation of `menubar` data memeber.

### Buffer the Changes ###
Not each change in the menu hierarchy emits a `dyn-patch-changed` signal. Multiple(hundreds) of changes are queued with a g\_idle\_add\_full, and then emitted in one run.

# Global Menu #
About `globalmenu.vala`.

## Signal Emission Hooks ##
It listens to the signals defined by `DynPatch`, and the `property-notify` event on toplevel windows for Global Menu events.

## Serializer ##
Convert the widget tree to xml.
## Locator ##
Convert an xpath to a widget.