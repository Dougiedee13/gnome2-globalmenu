This module is deprecated by the utility library libserver. The general structure of the new moudle is the same as libgnomenu. Yet no document is written for it.


# Introduction #

`libgnomenu` is the GTK representation of Global Menu. This library contains:
  * three core Global Menu widgets:
    * `GnomenuMenuBar`, for the topmost menu in the Menu Context;
    * `GnomenuMenu`, for popup sub menus;
    * `GnomenuMenuItem` (and `GnomenuMenuLabel` as its child), for menu items;
  * two auxillary widgets:
    * `GnomenuWindow`, for easy setting/getting window properties;
    * `GnomenuMenuBarBox`, for alignment of multiple menu bars
  * two utilities:
    * `GnomenuSerializer`, to convert the widgets to XML;
    * `GnomenuParser`, to convert XML to widgets;