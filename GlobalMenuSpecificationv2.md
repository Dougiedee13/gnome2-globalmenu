

# Introduction #

# Synopsis #
  * Client
  * Server
  * ...
  * Client-side Popup Menu
  * Server-side Popup Menu

# Roles #
## Client ##
A client is a document window which requests a menu shown in the global menu area.
Typical examples of a client are
  * 
  * 
  * 
## Server ##
A server is an application or a component of an application that provide an area to show menus for the clients.

**It is not specified which client's menu is shown in the server.**

# Interfaces #
## Communication Channel ##

The communication channel is established via XWindow PropertyNotify and window properties.
  * `_NET_GLOBALMENU_COMM_WINDOW`: xid of the communication window tied to the toplevel;
> > if set, the communication will be via this window instead of the toplevel window.
  * `_NET_GLOBALMENU_MENU_EVENT`: an item is activated.
> > "%s", path of the activated item
  * `_NET_GLOBALMENU_CLIENT_POPUP`: request a client side popup of the sub menu located by the given path at the given absolution screen coordinate.
> > "%s@%d,%d", path, abs\_x, abs\_y
  * `_NET_GLOBALMENU_MENU_CONTEXT`: the global menu xml.

## Global Menu XML ##

Attributes:
  * `client-side`

## Binary Encoded XML? ##

# X11 Specified Topics #
## Window Properties ##
## Popup Menu Life Cycle ##
### Client-side ###
### Server-side ###

# Disclaimer #