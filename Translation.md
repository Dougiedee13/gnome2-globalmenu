# Introduction #

Since Version 0.4, localization becomes one of our considerations. We are glad to announce that the localization framework has been set up. This page contains a Howto for making translations; and a summary of current available translations.

# Howto: Make a new translation #
## Without SVN write access ##
  * Checkout the pot file at
`http://code.google.com/p/gnome2-globalmenu/source/browse/trunk/po/gnome-globalmenu.pot`
  * Save it to you computer, rename to `{your locale string}.po`. E.g: `en_GB.po`
  * Edit it, make sure
    * you should use utf8 for your translate file.
    * the first "" string's information is properly filled in, especially your name, and email address. (so that when we need to change strings you can be notified)
    * "translater\_credit" shall be translated into your name, in your own language and you can optionally provide your email.
    * replace other localized strings with the strings in your languages.
  * Save the modified file, email it to:
> > gnome-globalmenu at googlegroups dot com
  * If there isn't any troubles, within a few days or hours you'll find your .po file in the svn.

## With SVN write access ##
  * go to your working copy of trunk/po
  * copy `gnome-globalmenu.pot` to `{your language}.po`
  * you should use utf8 for your translate file.
  * translate it according to the guidelines above.
  * edit LINGUAS, add your language to the tail.
  * svn commit

# Translation Summary #
|**Language**|**Translator**|
|:-----------|:-------------|
| zh\_CN     | rainwoodman    |
| fr\_FR     | pierre.slamich |
| it\_IT     |  	 lviggiani |
| es\_ES     |      acidrums4 |