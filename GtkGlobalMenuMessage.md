#GtkGlobalMenuMessage

# Definition #
```
typedef enum {
  GTK_GM_PT_SIZE,
  GTK_GM_PT_PIXMAP,
  GTK_GM_PT_COLOR,
} GtkGlobalMenuPropertyType;

struct _GtkGlobalMenuMessage {
   GtkGlobalMenuMessageType type;
   GdkNativeWindow source;
   GtkSocket * target;
   union {
      struct _ServerNew {
/*When a new server starts, it broadcast this message to all possible clients
  When a client receive this message, it prepares itself to be grabbed by server,
  then send a ClientNew message as a response to server.
*/
      } ServerNew;
      struct _ServerDestroy {
/*When a server dies, it broadcast this message to all of its clients
  When a client receives this message, it prepares itself be shown in it's master window.
  Don't send a ClientDestroy back to server, because server is already dead when client receive this message.
*/
/* Note: In 0.3, clients will never receive this message, when server is in applet mode, because the server never get a chance to broadcast this message. Need to fix this in 0.4*/
      } ServerDestroy;
      struct _ClientNew {
/*When a client starts, it find a server and send this message to server
  When server receives this message, it grabs the new discovered menu bar, and store the information (i.e. which master window contains which menu bar) to it's private data structure. Then server sends a SetProperty message to client to set its appearance.*/
      } ClientNew;
      struct _ClientDestroy {
/*When a client dies, it send this message to server.
  When a server receives this message, it cleans up its private data structures to remove the client from client list. Also need to take special care if server keeps the current active client and the dead client is the active client. This should rarely happen but just in case.*/
      } ClientDestroy;
      struct _Activate {
/*When a client's master window receive focus, server send this message to the client*/
/*It is client's obligation to make the menubar visible to user.*/
      } Activate;
      struct _Deactivate {
/*When a client's master window receive focus, server send this message to the client*/
/*It is client's obligation to make the menubar invisible to user.*/
      } Deactivate;
      struct _SetProperty {
/*When the configuration of menu server changes, server broadcast this message to all of its clients. The purpose is to maitain a consistent appearance between client and server.
When server receives a ClientNew message, it also sends to the new client this message. */
         GtkGlobalMenuPropertyType type;
         union {
             GdkNativeWindow pixmap;
             gchar color[8];
             struct {
                gint width;
                gint height;
             };
         };
      } SetProperty;
   };

};

```