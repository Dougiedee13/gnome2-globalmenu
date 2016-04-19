#Socket communication layer in GDK

Our socket is connectionless, and is blind to the source of the message.

# Types #

# Variables #
```
struct _GdkSocketPrivate{
   GdkWindow * window;
   GdkDisplay * display;
   gchar * name;
   GdkSocketStatus status;
   GdkNativeWindow target;
};
```
# Methods #
```
/* Constructor */
  GdkSocket * gdk_socket_init (GdkSocket * self);
  GdkSocket * gdk_socket_new (gchar *name);
/* Send message to target socket by its GdkNativeWindow ID */
  gboolean gdk_socket_send (GdkSocket * self, GdkNativeWindow target, gpointer data, guint bytes);
/* Find a target's GdkNativeWindow ID via its name, only the first one is returned */
  GdkNativeWindow gdk_socket_find_target_by_name (GdkSocket * self, gchar * target_name);
/* Broadcast a message to all the target socket that has a name target_name */
  void gdk_socket_broadcast (GdkSocket * self, gchar * target_name, gpointer data, guint bytes);
/* Deconstruction */
  void gdk_socket_finalize (GdkSocket *self);
  void gdk_socket_dispose (GdkSocket *self);
```
# Virtual Functions #

# Signals #
```
  void data-arrival (GdkSocket * self, gpointer data, guint bytes)
```