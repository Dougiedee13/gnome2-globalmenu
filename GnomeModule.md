Send this application to

desktop-devel   ddd-list at --- gnome.org


## GlobalMenu Application for inclusion as a GNOME module ##

Dear GNOME maintainers,

This is a proposal on behalf of the GlobalMenu developers for its inclusion either in gnome-applets or as a dependancy of GNOME.

GlobalMenu is an applet that lets the user have its application menus displayed in the Panel rather than in the windows. For those who haven't heard about it, think of GNUStep or MacOS as an example. Or you can look at a screenshot to get an idea  http://code.google.com/p/gnome2-globalmenu

  * Target: proposed for the desktop module set
  * Dependencies: No new dependencies are introduced for either compiling the released tarball or the runtime. An up-to-date vala compiler for the developers.
  * Resource usage: currently no NOME infrastructure are allocated for the project.  Google Code is the main hosting service and Launchpad is used for Ubuntu packaging and translations. We have sent a mail to apply for GNOME ressources. Delete? >>If accepted the team would transport the project onto the GNOME infrastructure.<<
  * Adoption in Distributions: none so far.

  * GNOME-ness & community: The project uses vala as the main programming language. Various bugs in vala were discovered and fixed by the Global Menu developers. For the moment the team doesn't strongly need to cooperate with the internationalization, user documentation, accessibility, usability, bugsquad teams(and etc) of the community. The team is always open to such cooperation.

  * License : GlobalMenu is currently licensed under the GPLv2+ and LGPLv2+. The documentation and the majority of the code have all been written by team members; therefore the project can be easily re-licensed to meet the GNOME requirements.

  * We have a pool of developpers, committed doc writers, bug hunters and translators which is an asset to keep deadlines, and to bring innovation, along with quality assurance. We have a good track record, as can be seen throughout our issue tracker and our Ubuntuforums thread. We strive to keep aware of all the evolutions going around, we successfully coordinated with KDE for the spread of the GlobalMenu spec beyond our initial GNOME focus.

  * Willingness and ability to follow release rules and release schedule and progress on a regular basis: We have an Italian dev, but we also have a German dev and a Chinese dev. Overall, we have thus time-conscious people ;-)

  * Improving overall desktop usability: The document-centric functionnalities of Global Menu are available on GNUStep and MacOS, but most importantly we think that it's a very nice addition to the already strong GTK stack that will, playing along GNOME Shell, enable application developpers to build upon it. Moreover, it's implemented in a better way than the other globalmenu implementations, listening to user feedback and building upon Gnome's unique features. We have relatively wide compatibility, and we believe adoption in Gnome 2.30/3.0 would enable further adoption and standardisation on the developper side, pushing ISV to provide native GTK interfaces for at least the menus (Firefox, OpenOffice, Java to name a few). This will both push GNOME's interface forward, and push the GTK-toolkit forward.

  * Developer attitude: We like to engage with upstream (GNOME for the moment :-), possibly the Freedesktop's project afterwards for standardization) and downstream, as well as our user base. We're very open and our forum thread and our bug tracker testifies that. We have an open developpement process and we prefer daily commits to large code drops. We engaged with GNOME, we also engaged with XFCE and KDE. We're nice and cool people (really :-)

  * GNOME-ness: We use GTK2 and other GNOME2 technologies (VALA, all the standard GNOME guidelines and techniques) and we have a GNOME look and feel. We rewrote the software from ground to bottom to use the state of the art technologies. We of course don't use the obsolete stuff that GNOME 3 aims to get rid of.

  * UI: We have no problem engaging with the UI team to make GlobalMenu even better UI-wise. We strive to keep in line with the GNOME look and feel, HIG compliance, a careful choice of default settings, and clean interface design.

  * Accessibility: Though we haven't delved into the matter, we're also ready to engage should issues arise.

  * Internationalization is already done in the GNOME-compliant fashion. All text is i18n-ized and the app is localized (RTL).

  * Use of GNOME resources: While we don't currently use them, we'll be happy to switch should our inclusion be accepted, and we have actually already applied to get GlobalMenu on GNOME's infrastructure.

  * Documentation: Documentation already exists in the project wiki, and our code is clear and clean. We're willing either to help the existing docs team on incorperating our current document or to directly join them in this work. We're anyway motivated to make useful documentation available. Nevertheless we will strive to make GlobalMenu as simple as possible while increasing its power. We'll contact soon the GNOME Documentation Team to organize about the matter. We love ducks(**What is the relavency of a duck in this context?**)

  * Relation with GNOME 3.0: As proposed in GNOME 3.0, the Shell features a menu item which provides the access to the application's actions.
The idea is good, however most current applications in GNOME do not support this feature. Neither does the GTK toolkit provide the necessary facilities for it. While we need to systematically invent it in GNOME 3.0 (eg, by extending GtkUIBuilder), some kind of legacy support should also be provided. This is where Global Menu becomes relevant to GNOME 3.0.
Global Menu already has the code to extract the main menu bar from the applications. Once the global menu plugin for GTK is enabled (and it can be selectively enabled), each GtkWindow instance will carry a special property containing an introspection of its menu bar, and the sub menus. This information can be used to reconstruct a menu in the Shell's application menu item. Global Menu also provides a protocol to sync the selection and activation of menu items.

Thanks a lot for bearing with that long and overly detailed proposal. I look forward to your reviews, comments, suggestions, bashings, etc :-)

Yu and Pierre, on behalf of the whole GlobalMenu team

---


TODO:<<What's the status of 4 ?

4.Build testing: Make sure the module is added to the proposed modules list in the jhbuild moduleset. Ping the GARNOME mailing list to include it too.
5.Record the proposal: Maintainers of proposed modules should make sure their modules are listed in the relevant wiki pages (for example, 2.23 desktop suite page: http://live.gnome.org/TwoPointTwentythree/Desktop) with all the details (module name, link to svn, branch to use in svn, maintainers names, etc.)