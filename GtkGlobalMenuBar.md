#Global Menu Bar Widget
# States #
```
REALIZED
MAPPED
DETACHED & !REALIZED
DETACHED & REALIZED
ATTACHED = !DETACHED
```
  * after the application creates the menu bar, it is `CREATED`
  * menu bar try to detect a menu server, if found, it is `DETACHED`; if not found, it is `ATTACHED`
  * at the begining of `_realize` method, it is `REALIZED`
  * when realizing, set up the GdkWindow configuration according to `DETACHED` or `ATTACHED`.
  * when received ServerDestroy or DeleteEvent, take action according to `DETACHED` and `REALIZED`.
    * `!REALIZED`, set state to `ATTACHED`
    * `REALIZED` and `DETACHED`,
    * `REALIZED` and `ATTACHED`,
gtk\_global\_menu\_bar\_new
gtk\_global\_menu\_bar\_init
gtk\_global\_menu\_bar\_real\_insert
gtk\_global\_menu\_bar\_hierachy\_changed
> -> gtk\_global\_menu\_bar\_add\_to\_window
> -> gtk\_global\_menu\_bar\_remove\_from\_window
gtk\_global\_menu\_bar\_size\_request
gtk\_global\_menu\_bar\_size\_allocate
gtk\_global\_menu\_bar\_realize
gtk\_global\_menu\_bar\_map
> -> gtk\_global\_menu\_bar\_connect\_to\_server
> -> gtk\_global\_menu\_bar\_send\_new\_client\_notify
> -> gtk\_global\_menu\_bar\_detach
gtk\_global\_menu\_bar\_menu\_server\_message\_cb
> -> on ServerDestroy: gtk\_global\_menu\_bar\_attach
> -> on SetVisibility: gtk\_global\_menu\_bar\_set\_visibility
> -> on SetBackground: gtk\_global\_menu\_bar\_set\_background
> -> on GetRequisition: gtk\_global\_menu\_bar\_size\_request
> > -> gtk\_global\_menu\_bar\_send\_get\_requisition\_response\_notify

> -> on SetAllocation: gtk\_global\_menu\_bar\_allocate
gtk\_global\_menu\_bar\_delete\_event
> -> gtk\_menu\_bar\_attach
gtk\_global\_menu\_bar\_unrealize
> -> gtk\_menu\_bar\_send\_client\_destroy\_notify
gtk\_global\_menu\_bar\_finalizeREALIZED
MAPPED
DETACHED & !REALIZED
DETACHED & REALIZED
ATTACHED = !DETACHED
}}}
= Function Callings =
{{{
}}}
= Types =


= Private Variables =

= Methods =

= Virtual Functions =

= Signals =```