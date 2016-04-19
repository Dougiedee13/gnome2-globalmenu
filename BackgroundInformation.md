#The  global menu solution's architecture .

**ONLY a Specification DRAFT, none coding respect it yet**

**Based on 0.3 version**

# Architechure #

A Central MenuBar Server who receive notifications and take action
  * when current active window has changed, display the correct menubar for the active window to the user;
  * when an existed (global) menubar is destroyed, destroy related private resources;
  * when new (global) menubar is created, allocate related private resources and hook the menubar into its own window.
  * when its geometry properties (eg, size) is changed, notify the client to reallocate menubar's size.

A MenuBar Client is an application who
  * has `GtkMenuBar`s;
  * want one of it's menubar to be globalized;
  * prepare the globalized menubar in a proper way that the MenuBar Server can hook to;
  * notify the MenuBar Server when the globalized menubar is created or destroyed.

A MenuBar Master is the top level window who request to create a menubar.

# Requirements #

So we have at least two processes and several `GdkWindow`s. The way to communicate between GdkWindows is through XClientMessages. We need to create a subset of XClientMessage, with message\_type:
```
   gdk_x11_get_xatom_by_name("_GTKMENUBAR_EMBED")
```
The first long integer in the Message is an GlobalMenuNotification, it takes value in

  * GlobalMenuNotificationNew client to server
  * GlobalMenuNotificationServerNew server to client
  * GlobalMenuNotificationServerDestroy server to client
  * GlobalMenuNotificationSizeAllocation server to client
  * GlobalMenuNotificationSizeRequest server to client
  * GlobalMenuNotificationSizeRequisition client to server
  * GlobalMenuNotificationDestroy client to server

This is, actually, a subset of xembed protocol for `GtkPlug` and `GtkSocket`. However, in current implement of GTK, the protocol is still entangled with `GtkPlug` and `GtkSocket`. I personally propose a better implement should move the xembed protocal to `GdkWindow`.

To dispatch the messages, we need to register message filter in both server and client window via
```
gdk_window_add_filter
```
The filter should return `GDK_FILTER_REMOVE` for our messages and `GDK_FILTER_CONTINUE` for others.

# Details #
## Server ##
It should create a toplevel GDK\_INPUT window, with name MenuServerName that waits for clients messages.

  * GlobalMenuNotificationNew
  * GlobalMenuNotificationSizeRequisition client to server
  * GlobalMenuNotificationDestroy client to server

Immediately after creation, it should broadcast GlobalMenuNotificationServerNew to every
toplevel window with name MenuClientName .

Immediately before destroyed, it should broadcast GlobalMenuNotificationServerDestroy to every known clients.

## Client ##
The Client has the responsibility to create a toplevel GDK\_INPUT window with the name MenuClientName.

The client also creates following `GdkWindow`s,
  * `container_window` ; container\_window, the menuitems's parent window of in GDK hierachy.
  * `float_window` ; toplevel window, being hooked by the server;
  * `widget->window` ; position occupier in parent widget; (created by menushell)

If the Client is `globalized`, `container_window`'s parent in GDK hierachy will be `float_window`; if not, the parent will be `widget->window`;

The client deals with following messages,
  * GlobalMenuNotificationServerNew server to client
  * GlobalMenuNotificationServerDestroy server to client
  * GlobalMenuNotificationSizeAllocation server to client
  * GlobalMenuNotificationSizeRequest server to client

Immediately after the creation of a client, it should seek a toplevel window with name MenuServerName.
If found, it will send GlobalMenuNotificationNew to the server, set the `globalized` flag, and remember the server; If not found, it unset `globalized`.

Immediately before destroyed, it send GlobalMenuNotificationDestroy to the server if `globalized` is set.

At the server's request GlobalMenuNotificationSizeRequest, client should calculate it's minimal size and send it to the server via GlobalMenuNotificationSizeRequisition .

When a client receive GlobalMenuNotificationServerNew, if it is already globalized, ignore it, and panic(or assume last server dies and try to recover); if it is not globalized, send GlobalMenuNotificationNew to the server who issued the GlobalMenuNotificationServerNew message.
When a client receives GlobalMenuNotificationServerDestroy, if it is already globalized,
and the message is issued by its server, try to un-globalize. else, panic.

# Emergency #
## if the server dies accidentally ##
## if a client dies accidentally ##
## if two server was started ##