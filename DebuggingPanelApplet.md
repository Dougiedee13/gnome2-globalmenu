# Debugging a Gnome Panel Applet #

This was originally from

http://www.davyd.id.au/articles/debugging-gnome-applets.shtml

The website has been closed. Therefore I am trying to recover some of its content here.

## Background Knowledge ##

A panel applet is a reusable Bonobo Component. Gnome Panel remotely creates the applet trhough Bonobo from another process. The UI of the applet is embbeded into Gnome Panel via BonoboUI, which presumably(As I am not so clear about this) is an extension of Bonobo.

A linux program is usually packaged with `autotools` and linked with `libtool`, which also adds some overhead when it comes to debugging.

### What is Bonobo ? ###

If it is helpful, think about Bonobo as ActiveX or COM on Windows platform. It is a highly abstract way for reusing binaries. All are interfaces.

In General, Bonobo Components(== ActiveX Controls) are manufactured by a Bonobo Factory. Factory resides in a running Bonobo Server(ActiveX Serve).

When there is a request to create a component of a specific type, Bonobo locates the Bonobo Server executable by scanning the `.server` files in `/usr/lib/bonobo/servers`. After the entry is found, Bonobo launches the server, find the Bonobo Factory interface from the server, and as the Factory to manufacture a component. This process is called Bonobo Activation.

### What is libtool ###

libtool helps you to build and link against libraries in a platform independent way. It is also opaque on your choices of dynamic or static libraries.


## Enough, Let's Debug ##

We use `GlobalMenu.PanelApplet` as the example.


Make sure there is no running server for the Panel Applet you are debugging.

```
killall GlobalMenu.PanelApplet
```

If the applet is already added to the Panel, you should get a dialog from gnome panel,
warning you a server has aborted, asking you whether to reload or not.
Ignore the dialog for now, that is, do not close it or click on any buttons.

Then launch the server from your build directory
```
# in source code directory (applet/)
libtool --mode=execute gdb ./GlobalMenu.PanelApplet
```

Gdb starts and gives you the interface. Type 'r' and enter to start the server. Count untill 10, waiting GDB finish loading all debug info.

If you had the warning dialog from gnome panel, click on reload now.
Gnome panel will create the applet from the server we have just launched with gdb.

If you did not get the warning dialog.
It is now the time to add the applet to your panel through regular steps.
Gnome panel will create the applet from the server we have just launched with gdb.

If the applet crashes, gdb will stops to a command-line. Type 'bt' to get the backtrace.