# Introduction #

To install this software correctly you do 2 steps:
  * Patch gtk+
  * Install gnome2-globalmenu-applet

To use it in your desktop environment you should also add installed applet to you gnome-panel.

# Details #

Really, you do not need how it works at the bottom level. Package manager would do it for you. If not, please fill ebuild bug here: http://bugs.gentoo.org/show_bug.cgi?id=205203 or here in comments. I'll try to fix it ASAP and post corrected version.

## Fetching overlay ebuilds ##

You may fetch ebuilds manually or confide in layman (preferred).

### Adding layman overlay ###

If you have not installed layman already, do it now:
```
emerge -v layman
```

After successful installation of layman you would see `/etc/layman/layman.conf` file.
Open it with your favorite editor and find `overlays` option. By default it looks like
```
overlays  : http://www.gentoo.org/proj/en/overlays/layman-global.txt
```

Add gnome2-globalmenu overlay so it would looks like
```
overlays  : http://www.gentoo.org/proj/en/overlays/layman-global.txt
	    http://gnome2-globalmenu.googlecode.com/svn/gentoo-overlay/layman-globalmenu.xml
```

Save and exit. Check if it was successfully added:
```
hostname layman # layman -k -L | grep gnome2-globalmenu
* gnome2-globalmenu         [Subversion] (source: http://gnome2-globalmenu.g...)
```

If you see `gnome2-globalmenu` in output list, `/etc/layman/layman.conf` edited successfully. Next step is adding. This would fetch `gnome2-globalmenu` overlay repository to your host.
```
hostname layman # layman --add gnome2-globalmenu
* Running command "/usr/bin/svn co "http://gnome2-globalmenu.googlecode.com/svn/gentoo-overlay//" "/usr/portage/local/layman/gnome2-globalmenu""...
```

(fetch lines skipped)

Step completed.

### Manual ebuilds fetching ###

  1. Create directory for portage overlay (if you haven't your own one already). I use /usr/local/portage
```
mkdir /usr/local/portage
```
  1. Add this directory to PORTDIR\_OVERLAY in /etc/make.conf (read more about gentoo overlays (if you want) here http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=3&chap=5 and here http://www.gentoo.org/proj/en/devrel/handbook/handbook.xml?part=2&chap=1#doc_chap6_sect2).
  1. Change your working directory to created directory
```
cd /usr/local/portage
```
  1. Fetch ebuilds from http://gnome2-globalmenu.googlecode.com/svn/gentoo-overlay (complete directory or only some files if you know what are you doing) by subversion or simple plain HTTP downloader.
```
svn checkout http://gnome2-globalmenu.googlecode.com/svn/gentoo-overlay
```

## Merging packages ##

There are ebuilds for two versions:
  * release (aka "stable");
  * trunk (aka "development").

So, there are two ebuild packages:
  * gnome-extra/gnome2-globalmenu-applet-0.3.9999.ebuild - _current SVN release branch of applet_
  * gnome-extra/gnome2-globalmenu-applet-9999.ebuild - _SVN trunk version of applet_

Later one more ebuild would be added:
  * gnome-extra/gnome2-globalmenu-applet-0.3.ebuild - _release version of applet_

Steps are equal but you should choose appropriate version of ebuild. So, complete installation steps are:

  1. Add `>=x11-libs/gtk+-2.0 globalmenu` line to your /etc/portage/package.use (`euse -E globalmenu` adds this to global USE flags, but it is not recommended).
  1. `emerge -v1p x11-libs/gtk+` (check if version of gtk+ is correct, globalmenu useflag is on and number of your overlay is shown right to package name). If you want SVN trunk version, prepend GTK+ emerge command (or set global environment variable) with `GTKMENUBAR_PATCH_VERSION="trunk"`. Output should be like this:
```
These are the packages that would be merged, in order:

Calculating dependencies... done!
[ebuild   R   ] x11-libs/gtk+-2.12.1-r2  USE="X cups globalmenu jpeg tiff vim-syntax xinerama -debug -doc" 0 kB [1]

Total: 1 package (1 reinstall), Size of downloads: 0 kB
Portage tree and overlays:
 [0] /usr/portage
 [1] /usr/local/portage
```
  1. If check on above step is ok, do `emerge -v1 x11-libs/gtk+`. If not, recheck previous steps. Ebuild would download needed files with wget, so it is required to be installed.
  1. Add correct keyword for our packages. For 0.3 it should be ~_arch_, for trunk it should be -_arch_ (_arch_ is x86 or amd64 for now. if someone would test on other architecture, I'll be very thankful). To do it, put appropriate line into `/etc/portage/package.keywords`. For example for amd64 and 0.3 version of globalmenu:
```
gnome-extra/gnome2-globalmenu-applet    ~amd64
```
  1. `emerge -v gnome-extra/gnome2-globalmenu-applet` (I'll make more visible warning about gtk+ merged w/o globalmenu flag later to the ebuild).

If all steps completed successfully you are ready to add applet to GNOME panel. Right-click on the panel and click add to the panel. Look for Global Menubar. Add it. And voila. It should work.

## Updating packages ##
### With layman installation ###
```
layman --sync=gnome2-globalmenu
emerge -1av gtk+ gnome2-globalmenu-applet
```

### With manual installation ###
```
cd /usr/local/portage
svn up
emerge -1av gtk+ gnome2-globalmenu-applet
```