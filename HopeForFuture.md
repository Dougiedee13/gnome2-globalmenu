Actually there is no clear way for the menu server to distinguish menubars that we want to float and ones we don't. Every thrown menubar should be managed by the server. It is upto the application to determine which menubar is global and which is not. Anyway we don't want to have such dirty reversed dependence in GTK.

So I think the best solution is to make the patch stronger, push it into GTK with a new class GtkGlobalMenuBar, and then hope gnome programs will use GtkGlobalMenuBar for global menu bar s.
At the same time provide some trigger in environment variables to make gtk\_menu\_bar\_new returns a GtkGlobalMenuBar, and disable it by default. That is also why I initial the google project with name gnome2-global-menu, instead of gtk-global-menu.

The global menu look and feel is for a desktop environment, rather than for a gui toolkit. Gui toolkit should provides a possibility for building a global menu look and feel. But it is entirely upto DEs to take advantages of the new techs.

If gtk don't accept the new patch or gnome don't patch their programs with globalmenubar, then perhaps we will have to provide our own distribution with all patched gnome applications(and even XFCE since it is also based on gtk). It will be terrible, though not impractical. The global menu is then, by no meaning, a hack.

I am just an idealist.