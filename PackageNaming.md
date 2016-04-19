# Package Naming Rules #

I suggest we have some package naming rules. The best solution I found is the way I name the rpms.
## gtk2-aqd ##
for gtk2-aqd:
```
gtk2-aqd-{global menu major version}_{svn version}-{packaging release number}-{gtk-version}
```

Then we make use of the packaging system's 'Deprecated' and 'Provides' keywords to indicate that
`````gtk2-aqd-...-{gtk-version}````` **deprecates** `````gtk2-{gtk-version}`````, while **Provides** `````gtk2-{gtk-version}`````.

## Others ##
for other components:
```
{component name}-{global menu major version}_{svn version}-{packaging release number}-{gtk_version}
```
where component name is
```
libgnomenu
xfce-globalmenu-plugin
gnome-globalmenu-applet
```