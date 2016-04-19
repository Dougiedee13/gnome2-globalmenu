

# Transparency #
The menubar can be set clear, and remain certified to the panel, using Compiz-Fusion (I hope it and others features will be possible also the new Metacity..) and appropriate parameters.
In General Options > Opacity Settings >
  * add
```
(dock) &! (class = Avant-window-navigator) 
```
  * add the value of transparency you want).

The problem is to use a theme that checks the same color to the panel and bg\_color windows (or pass an appropriate parameter in the "menubar-theme" and use an image for the panel).

# Skinning instructions #
The default install doesn't handle well transparency or colors , and you may want it to look like more a famous OS, or just add a bit more transparency. Head to [skinning](skinning.md) for detailed instructions.


Here’s an (non exhaustive) list of mac menu compatible themes for gtk :

  * imetal (http://gnome-look.org/content/show.php/imetal?content=63734)
  * snow leopard (http://gnome-look.org/content/show.php/snow+leopard?content=61924)
  * mac4lin (http://gnome-look.org/content/show.php?content=68411)
  * kougyoku black (http://gnome-look.org/content/show.php/Kougyoku-Black?content=65299)
  * and more kougyoku (make a search on http://gnome-look.org )

You can also hack your theme, like I did. I edited the gtkrc file of the theme I use. (the gtkrc file of your theme is located under ~/.themes/[YOUR\_THEME\_NAME](YOUR_THEME_NAME.md)/gtk-2.0/gtkrc)

Here’s the code I added in my gtkrc file :
```
#panel stuff
style "panelbg"
{
  xthickness                    = 0
  ythickness                    = 0
  bg_pixmap[NORMAL]             = "panel-bg.png"
  fg[NORMAL]                    = "#ffffff"
  fg[PRELIGHT]                  = "#ffffff"
  fg[ACTIVE]                    = "#555555"
  fg[SELECTED]                  = "#555555"

}
style "theme-menubar"
{
  xthickness                    = 0
  ythickness                    = 0
  #bg[NORMAL] = "#000000"
  bg_pixmap[NORMAL]             = "panel-bg.png"
  fg[NORMAL]                    = "#ffffff"
  fg[PRELIGHT]                  = "#ffffff"
  fg[ACTIVE]                    = "#555555"
  fg[SELECTED]                  = "#555555"
        engine "pixmap"
        {
                image
                {
                        function        = BOX
                        state = NORMAL
                        file            = "panel-bg.png"
                        border  = { 0, 0, 0, 0 }
                        stretch = TRUE
                }
    }
}

class "GtkMenuBar" style "theme-menubar"

# panel styles
#class "*Panel*" style "panelbg"
widget "*PanelApplet*" style "panelbg"
class "*notif*" style "panelbg"
class "*Notif*" style "panelbg"
class "*Tray*" style "panelbg"
class "*tray*" style "panelbg"
class "*Netstatus*" style "panelbg"
class "*netstatus*" style "panelbg"
class "*Deskbar*" style "panelbg"
class "*deskbar*" style "panelbg"

```

I saved the panel-bg.png image in the same directory as the gtkrc file, and also used this png as panel background image (right click on the panel, choose properties, then background tab where you specify the background image location).


---



.conkyrc: http://ubuntuforums.org/attachment.php?attachmentid=48019&d=1193501364

A rewrite would probably also include patches made for Gtk+ for OSX from Imendio. http://developer.imendio.com/projects/gtk-macosx

On the inability of KDE apps to use this menu, doesn't KDE already have support for a global menu bar? Wouldn't it be feasible to make some sort of link between the KDE menus and this menu bar?