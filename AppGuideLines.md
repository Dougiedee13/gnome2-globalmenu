#Guide lines for global menu compatible applications.

# Introduction #

The purpose of this document is to help developers to improve the user experience when their GTK applications interference with Global Menu.

# Multi-Document Interface #

Please always clearly define the Active Document, and the window that contains a view to the active document, aka, the Active Document Window(**ADW**). Usually the **ADW** is just the last focused window that is a document view.

# Floating Toolboxes #

Definition: Floating windows that provides tool buttons or menus that operates on the active document. Typically, they operates on the last activated document, therefore their
ADW should be the last focused document window.

Examples: `GIMP` toolboxes and the `DIA` toolbox.

Guidelines:

Please set the `WM_TRANSIENT_FOR` the property of these toolboxes to the **ADW**.
If possible, please update the property whenever the **ADW** changes.

As by definition `WM_TRANSIENT_FOR` is not designed for this purpose, this is not a
perfect guideline. We may invent some new window property for this, if any complains
regarding this misuse is received.

# Transient Dialogs #
Definition: Model/Modeless dialogs that perform a temperory job on the AD.

Examples: Search/Replace Dialog in `GEdit`

Guidelines:

Please set the `WM_TRANSIENT_FOR` the property of these windows to the **ADW**.
This is actually required by the WM specifications and also specificly documented in
GTK under `gdk_window_set_transient_for`.

Many applications blindly ignore this GTK guideline. (`GEdit` is an exception)

# Not All Widgets are Supported in `GtkMenuItem`s #

Not all widgets in menuitems are supported by global menu. Actually,

NO WIDGETS are available in Global Menu menuitems.

Technically speaking, this is due to Global Menu's lack of knowledge of the client's widget types. Designed in a way that minimizes the interference with the applications, Global Menu deep-serializes `GtkMenuBar` into its own XML markups by a universal `GTK` plugin module, then reconstruct the menu as a specific set of `GtkWidget`s in a panel applet.

Therefore, Global Menu has to assume there are nothing more than simple `GtkImage` or `GtkLabel` with-in a menu, and based on the arrangement of the widgets, a guess on which image is the icon and which label is the menu text is made. If the essential content of the menu is neither contained in `GtkLabel` or `GtkImage`, it will show up as an empty entry in the Global Menu.

From a more general UI design point of view, menus should be simplely an entry to an  action. If things are more complicated then triggering an action, more complicated UI elements(eg, a side panel) should be used instead. Putting a guage or a button in a menu is therefore not a typical usage of menu, (if not a misuse). Think about how `GtkUIBuilder` is designed as an example.

The rule of thumb to make your application compatible with Global Menu is to avoid anything other than simple `GtkContainer`s, `GtkImage` and `GtkLabel` in your `GtkMenuItem`, if you ever need any customization of the menu.