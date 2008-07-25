#ifndef _IPC_H_
#define _IPC_H_
#define IPC_SERVER_TITLE "GNOMENU_IPC_SERVER"
#define IPC_CLIENT_TITLE "GNOMENU_IPC_CLIENT"
#define IPC_CLIENT_MESSAGE_CALL (gdk_atom_intern("GNOMENU_IPC_CALL", FALSE))
#define IPC_PROPERTY_CALL (gdk_atom_intern("GNOMENU_IPC_CALL", FALSE))
#define IPC_PROPERTY_RETURN (gdk_atom_intern("GNOMENU_IPC_RETURN", FALSE))
#define IPC_CALL 0
GdkNativeWindow ipc_find_server();

#endif
