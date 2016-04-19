<h1> Global Menu Specification </h1>
Author: Yu Feng (rainwoodman)


---

# Table of Contents #


---


# Introduction #

  * Describe the purpose of the document and the global menu project here.

Although there are implications to specific implementations, this document should be considered as a requirement document.

Implmentations are listed in the appendix.

# Global Menu Specifications #

## Definations ##
  * Client
  * Server
  * Desktop
  * Active Document
  * Transient-For Window
  * Menu Context
  * Menu Event/Activate
  * Highlight/Select
  * Dehighlient/Deselect
  * Representation
  * Menu: Menu is a collection of Items. It can be the root element of the XML Representation, or a submenu of an Item if presents as a child of the Item.
  * Item: Item is the entry in a menu.
  * Path: Refer to the section in XML Representation of Menu Context.

## Extensions to EWMH Protocol ##
### Atoms ###

  * `_NET_GLOBALMENU_MENU_CONTEXT`
  * `_NET_GLOBALMENU_MENU_EVENT`
  * `_NET_GLOBALMENU_MENU_SELECT`
  * `_NET_GLOBALMENU_MENU_DESELECT`
  * `_NET_GLOBALMENU_SETTINGS`
  * `WM_TRANSIENT_FOR`

### XML Representation of Menu Context ###
#### FIXME: DTD ####

#### Element Tags and Attributes ####

  * `menu`: An menu in the menu context. The only tag allowed for direct children of a `menu` element is `item`. The childrens correspond to items in that menu.
  * `item`: An item in the menu context. The only tag allowed for direct children of an `item` element is `menu`. The cardinary is also limited to `0` or `1`. The only child element stands for the submenu of the `item`.
    * position: Not an attribute. Defined by the absolute position in the children list of its parent. Begins from `0`.
    * `id`: A string with no `/` and no `:` in it. It also has to be unique among all siblings of that node.
    * `type`: A string to describe the type of this item. It takes value from
      * default, `n`, `normal`: An ordinary plain menu item with a text label.
      * `separator`, `s`: A separator line.
      * `image`, `i`: A menu item with an optional image.
      * `check`, `c`: A menu item with a check mark.
      * `radio`, `r`: A menu item with a radio mark. As Global Menu does not specify the action of the menu item, `radio` items are not grouped.
      * `icon`: A menu item with an image only.
    * `state`: A string to describe the state of the check or radio item.
      * `toggled`, `t`, `1` : the item is toggled.
      * `untoggled`, `f`, `0` : the item is not toggled.
      * default: the item is in a tristate, neither toggled nor toggled.
    * `visible`: A string to describe the visibility of the item
      * default: the item is visible.
      * `false`, `f`, `0`: the item is invisible to the user.
      * FIXME: this is problomatice. If an item is not visible why bothering put it in the menu context at all.
    * `sensitive`: A string to describe the sensitivity of the item. A senstive item responds to the users action and can be activated..
      * default: the item is sensitive.
      * `false`, `f`, `0`: the item is insensitive.
    * `label`: A string for the label in the item.
      * default: the label of the item is the same as its path.
      * string: the labelof the item is the specified string.
    * `icon`: A string to specify the image for either `icon` or `image` menu item.
      * `pixbuf:%s`, `%s` is the base64 encoded serialized pixdata of the image pixbuf. Refer to GdkPixdata for the format of the serialized image.
      * `pixmap:%d,%d`, the first `%d` is the native id of the pixmap, the second `%d` is the mask of the image.
      * `theme:%s`, a string to locate the icon from the named theme icons.
      * `gtk-%s`, gtk stock icons; (shall be removed later?)

#### Root Element ####

The root element of the XML is `menu`. The root elment has an extra attribute:
  * `revision`: the revision of the menu context. Every time a client change its menu context, this value is incremented.

#### Identifying an Element: Path ####

Path is a string to locate an element in the document tree. In a path:
  * `menu` is represented by `/`.
  * `item` is represented by its `id`, or its position if `id` is not defined.
  * `revision` is prefixed at the beginning of the path with a `:` as an separator, if the attribute is defined for the root element.

Examples of valid paths:
  * `12354:/File/New/Message`
  * `/1/New/0`
  * `1249485:/0/0/0/1`

## Client ##

A Client is a Window with menu context.
It receives `XPropertyNotify` notifications for `_NET_GLOBALMENU_MENU_EVENT`,
and changes `_NET_GLOBALMENU_MENU_CONTEXT`.
To support the specification more efficiently,
a map from Path to real actions should be implementated

The `_NET_GLOBALMENU_MENU_EVENT` property on the Client is changed by the Server if an Menu Event occurs. The expected behavior of a Client upon receiving the notification is
  * Obtains the Path in the Menu Event.
  * Checks the `revision` of the path agains the revision of the Menu Context.
  * If the `revision` is invalid, the Client can either ignore it or try to recovery. The behavior is implementation dependent.
Whether the property is immediately deleted is undefined.

`_NET_GLOBALMENU_MENU_SELECT` property on the Client is triggered when a menu item is highlighted. (NOTE: on GTK highlighted == selected.)

`_NET_GLOBALMENU_MENU_DESELECT` property on the Client is triggered when a menu item is highlighted. (NOTE: on GTK highlighted == selected.)

When the Menu Context of a Client changes, the Client should change the `_NET_GLOBALMENU_MENU_CONTEXT` property on its window.
The Client should make efforts to reduce the number of changes because:
  * Writing to an Window Property a huge amount of text is slow.
  * The server will possibly take the new property and rebuild an entire menu upon each newly arrived Menu Context.

## Server ##

A Server carries the Representation for the current Menu Context for the active window on the active viewport of the active workspace of the current display. Server on multihead displays is undefined.

The Representation carried by a Server is totally implementation dependent. All following examples are valid implementations:
  * The plain XML itself in a text entry.
  * ncurse
  * QT Widgets
  * GTK Widgets

The specification does not require the Server to cache the Representation for Menu Context of any non-active window.

EHWM and X Window Manager Protocol implement the mechanisms for active window determination. Refer to the documentation for
  * `_NET_ACTIVE_WINDOW` and
  * `WM_TRANSIENT_FOR`
Other higher-level apis are available,
  * `libwnck-1.0`

The Server captures events in which the user activates a representation of an Item in the representation of the Menu Context. After that the server should find the Path for the activated Item and write that Path to the `_NET_GLOBALMENU_MENU_EVENT` property of the corresponding Client as a Menu Event.

Note: The window whose property is changed is not neccasary the active window, since the active window may have changed after the user activates the representation of the Item.

## Settings ##
> Settings shared by all Clients on the same screen are stored under `_NET_GLOBAL_MENU_SETTINGS` property of the root window of the screen.
Clients should watch the changes of the settings and promptly update their state according to the new settings.

> Settings:

  * `show-local-menu` (boolean) whether or not show the menu bar locally in the client window.

# Limitations #

## Multiply Menu per Client ##

The specification only supports one menu per Client.
Possible workarounds for a Client implementation are:
  * a Client can define a main menu for the entire Client.
  * a Client can also combine all menus together.

## Gap between Client and Server ##

As mentioned in previous sections, there is a gap between the client and the server if the `revision` of the Path in the Menu Event is differnt from the one in the `Menu Context` of the client. Consider the following scenario:
  * Client modified its Menu Context.
  * Server havn't yet capture the modifications.
  * User activates an item in the Server side Representation, which represents the old Menu Context.
  * An (now)invalid Path for the old Menu Context is sent to the Client from the Server.

The specification captures this gap but does not define the default behavior of the Client. The invalid Path is still possibly containing suffiecient information for the client to determine which action should be invoked, if the client is implemented in a specific way.

## Multihead ##

Undefined.

# Application Compatibility Guidelines #

Refer to [Application Guildlines](AppGuideLines.md)

# Acknowledgements #

  * Project members;
    * especially `Mingxi Wu` for many enlighting discussions over the message handling issues.
  * The mavericks:
    * `Aqd`, the first Global Menu implementation with GNOME 2
    * `Jason McBrayer`, the first Global Menu implementation with GNOME



# Appendix A : GTK Implementation #
> ## GTK Plug-in Module ##
  * [globalmenu-gnome](GlobalMenuGTKModule.md)
> ## GNOME Panel Applet ##
  * [GNOME panel applet](GlobalMenuPanelApplet.md)
> ## libgnomenu ##
  * [GTK Representation of Global Menu](libgnomenu.md)