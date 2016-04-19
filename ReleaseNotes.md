
---


<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/globalmenu.png'>

<h1>gnome-globalmenu 0.7.8 (draft)</h1>
<br>
<h2>1. Introduction</h2>

We are pleased to announce the release of Gnome GlobalMenu version 0.7.8. This version brings you a better than ever Global Menu for use with Gnome. It’s packed with new features, more stable than ever and now available in an easy to install way, in your native language!<br>
<br>
<br>
<code>svn checkout http://gnome2-globalmenu.googlecode.com/svn/tags/v0.7.8</code>

<a href='http://code.google.com/p/gnome2-globalmenu/downloads/list?can=2&q=0.7.8'>Downloads</a>

<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/GlobalMenuWindows.png'>


Let’s review some of the features of Gnome GlobalMenu 0.7<br>
<br>
<h2>2. What's New For Users</h2>
<h3>A Slick Windows Switcher</h3>
You can now change the program you’re working on with a simple click on that switch, part of GlobalMenu. You’ll be able to start working right away with menus a few pixel right of the switcher!<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Icon-switcher.png'>

<h3>Themes! Themes! Themes!</h3>
With true transparency and a lot of fixes, GlobalMenu plays nice with many themes, including Mac4Lin, as we’ve worked with its creators to ensure the best experience possible. Not only is GlobalMenu practical, it’s now looking gorgeous!<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Themes.png'>

<h3>Simple Integrated Settings</h3>

We’ve reworked GlobalMenu to integrate deep within Gnome Settings a.k.a  GConf. No more tweaks or extra steps: it just works, period. We also have improved preference dialog usability.<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Right-click.png'>

<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Applet-preferences.png'>

<h3>Shortcuts. For (even more) speed</h3>

As if the GlobalMenu didn’t make you gain time by enabling you to actually focus on the document, it now includes fully working shortcuts<br>
<h3>Enhanced multihead support(per-monitor-mode)</h3>

<h3>A Snap to install</h3>
We’ve built Ubuntu Packages, Fedora RPM and people install GlobalMenu without having to mess with the Command Line. And all the other distributions, we’ve streamlined the install process with easy tutorials, and have taken the necessary steps to make packaging a snap.<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Screenshot-Add to Panel.png'>

<h3>Get Graphic</h3>

You can now choose to display the application icon alongside or in place of the title. Because a good drawing is worth a thousand words!  And if you don’t remember the name of that obscure app you’re using,  the application title appears as a tooltip!<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Icon-Label.png'>

<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Icon-no-label-menu.png'>

<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Icon-no-label.png'>

<h3>64bits compatibility</h3>
We have fixed crashing 64bit apps (<a href='https://code.google.com/p/gnome2-globalmenu/issues/detail?id=408'>Issue 408</a>)<br>
<br>
<h3>Get personal</h3>

You can as well customize the title font displayed in the Global Menu and completely customize the appearance. You can even skin the Global Menu!<br>
We also added the option to disable the search box in window list (<a href='https://code.google.com/p/gnome2-globalmenu/issues/detail?id=439'>Issue 439</a>), to toggle RGBA via preference dialog<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Label.png'>

<h3>Now available on RHEL 5</h3>
Due to popular request, we've backported GlobalMenu to RHEL5 (glib 2.12 + gtk 2.10 + libwnck 2.16)<br>
<br>
<h3>The Mighty Workspace chooser</h3>
(<a href='https://code.google.com/p/gnome2-globalmenu/issues/detail?id=311'>issue 311</a> in progress)<br>
<br>
<h3>XFCE</h3>
GlobalMenu is now compatible with XFCE!<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/xfce.jpeg'>

<h3>Scrolling.</h3>

If a menu is too long, Global Menu now detects it, and provides handy buttons to access the remainder of the menus in a very practical and smart way.<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Scroll.png'>

<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Scroll-expanded.png'>


<h3>Window Actions.</h3>
For extra goodness, we’ve built in window actions so that you can get full control on you windows right from the menus, thus reducing visual and usability clutter.<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/ActionsWindows.png'>

<h3>Standard naming</h3>

Now, the label in GlobalMenu is consistent with your main menu for extra simplicity!<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/ConsistantNaming.png'>

<h2>3. What's New For Developers</h2>
<h3>A full Vala rewrite</h3>
The Global Menu is no longer hacky, and integrates a full Vala rewrite to integrate Gnome’s good practices and follow coding guidelines. Cleaner code means more developers, more progress and less bugs in the future.<br>
As a result, we now require Vala 0.7.6.<br>
<br>
<h3>Fully Compatible with Gnome-Shell, ready for a possible inclusion in Gnome 3.0</h3>

We also have a brand new approach for globally grabbing F10 (<a href='https://code.google.com/p/gnome2-globalmenu/issues/detail?id=298'>issue 298</a>), compatible with gnome-shell.<br>
We also implemented monitoring <i>NET_GLOBAL_MENU_XXX properties (<a href='https://code.google.com/p/gnome2-globalmenu/issues/detail?id=306'>issue 306</a>), compatible with gnome-shell.<br>
We're now also aware of 'gtk-icon-size' (<a href='https://code.google.com/p/gnome2-globalmenu/issues/detail?id=320'>issue 320</a>) and we switched to max label width (pixel) rather than max label length (chars) (<a href='https://code.google.com/p/gnome2-globalmenu/issues/detail?id=312'>issue 312</a>)<br>
In short, GlobalMenu longs to be a good GNOME citizen, and we look forward your feedback.</i>

<h3>Improved source code readability. More comments.</h3>
<h2>4. Internationalisation</h2>
<h3>Dans toutes les langues!</h3>

GlobalMenu is now available in French, Chinese, English, Italian, Spanish, Hungarian, Russian for your convenience. If your language is not there yet, just step in and take 20 minutes to make sure the next version of GlobalMenu features your translation work!<br>
<h2>5. Installing GlobalMenu</h2>
<h2>6. Looking Forward to GlobalMenu 0.7.9</h2>
<h2>7. Credits</h2>
<h3>Project members</h3>
pierre.slamich, Valiant.Wing, fengshenx, sstasyuk, bis0n.lives, dwatson031, lviggiani, globalmenul10n<br>
<br>
<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Credits.png'>
<h3>About Us</h3>

<img src='http://gnome2-globalmenu.googlecode.com/svn/wiki/Screenshot-About globalmenu-panel-applet.png'>







<h3>Links</h3>

[<a href='DevelopmentHome.md'>DevelopmentHome</a>]<br>
[<a href='FAQ.md'>FAQ</a>]<br>
[<a href='Installation.md'>Installation</a>]<br>
[<a href='https://launchpad.net/~globalmenu-team'>Ubuntu LaunchPad</a>]<br>
[<a href='http://ubuntuforums.org/showthread.php?t=241868'>Ubuntu Forum Thread</a>]<br>
[<a href='http://bugzilla.gnome.org/show_bug.cgi?id=353076'>Gnome Bug</a>]<br>
[<a href='https://bugzilla.mozilla.org/show_bug.cgi?id=411934'>Firefox Bug</a>]<br>
<br>
<br>
<br>
<h3>Vote for us on Ubuntu Brainstorm</h3>

<a href='http://brainstorm.ubuntu.com/idea/3136/'><img src='http://brainstorm.ubuntu.com/idea/3136/image/1/?filetype=.png'>

Unknown end tag for </a>

<br>
