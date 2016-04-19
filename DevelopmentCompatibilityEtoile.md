# Current Status #
Nothing is specially done for this compatibility issue.

This screenshot (from sstasyuk) shows what happens when an etoile application is launched.

![http://code.google.com/p/gnome2-globalmenu/issues/attachment?aid=-871868239269497129&name=WildMenus.png](http://code.google.com/p/gnome2-globalmenu/issues/attachment?aid=-871868239269497129&name=WildMenus.png)


# Hints #
Things happen when a WildMenu Client is launched:

  1. Application tries to connect to the menu server
  1. Then obtain the geometry.(I think on X they actually will get the XWindow) of the container (or, in their archy it is more like a position holder) in the server. If can't find one, allocate a new rectangle (XWindow) directly at the top of the screen.
  1. Set the children's geometry in that rectangle. (Set the children's XWindow's parent to be the newly created or the menuserver's XWindow).

If we can allocate a rectangle in the menu server application with a proper name that WildMenu Clients' can recognized, Etoile applications will be happy.