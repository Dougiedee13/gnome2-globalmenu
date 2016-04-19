

# About Google SOC #

Google is sponsoring students to work during this summer on open source projects.

# About Global Menu #

Global Menu is the globally-shared menu bar of all applications launched in your desktop session.

This project introduces document-oriented concepts into open source desktop enviroments. In GNOME, it improves GNOME's respect for Fitts's law. Most GTK applications work just fine with the current GNOME portion of Global Menu.

# Mentors #

Yu Feng, Luca, Mingxi Wu; the assignment will be decided later on.

# Ideas #

## XFCE port of Global Menu ##

### Background ###
Although there is already an XFCE panel plugin out there, its lacks functionalities comparing with the Gnome panel applet. The either switcher is missing, and there is no way to enable/disable Global Menu without modifying magic configuration files.

### Goals ###
The XFCE port shares the same GTK plugin module with the current Gnome port. Therefore a complete XFCE port of Global Menu should finish the panel plugin:
  * Tracking the current application (activity)'s title,
  * Switching focus between applications (NOT windows, refer to the application mode of metacity),
  * Launching new applications.
  * Enabling / Disabling the GTK Plugin module on the fly by modifying the GtkSettings on the screen.
  * Also, design a default menu when the desktop is focused, the default menu may incorporate the features listed above, or not.

The XFCE port is crucial for the Global Menu project in a long run. XFCE, being an light weight desktop environment targeting at low-end computers, may be more open to document-centric ideas than the already highly developed sophisticated GNOME.

### Requirements ###

  * GTK programming experience with C or Vala
  * experience with XFCE software development

## KDE Unification ##
### Background ###
Back in KDE 3.x, a global menu was implemented; however the implementation is incompatable with current Global Menu. In more recent KDE 4.x, that global menu implementation is removed. KDE people, have come up with a QStyle plugin for QT4, and a Plasma applet XBar, for their own global menu(referred as XBar). However, this implementation is not designed to be GUI toolkit independent. As a result, XBar is incompatible with Global Menu.

References:
  * XBar - http://frinring.wordpress.com/2009/01/29/mac-style-menubar-for-kde-4-and-others/
  * Global Menu Specification - http://code.google.com/p/gnome2-globalmenu/wiki/GlobalMenuSpecification

### Goals ###
Modify XBar to fully implement the Global Menu specification, so that QT applications and GTK applications can share the same, unified Global Menu.

### Requirements ###
  * QStyle knowledge
  * Knowledge in X11 program development
  * C++ experience

## Patch XUL runner, enable Global Menu with Firefox ##

### Background ###
It has been long known that XUL runner programs doesn't use native GTK, and therefore can not benefit from the Global Menu's GTK Plugin. However most distributions nowadays ship their GNOME desktop with Firefox or Firefox variations instead of the default GNOME browser Epiphany. The result is direct: on a desktop with Global Menu enabled, the default web browser, which is accessed by the user almost everyday becomes an exception that behaves differently from all other applications. Too bad. This proposed SOC project aims to provide a fix for the issue for our users.

References:
  * Global Menu Specification - http://code.google.com/p/gnome2-globalmenu/wiki/GlobalMenuSpecification

### Goals ###
Patch XUL runner to implement a Global Menu client inside it.
  * Interpolate the menu into Global Menu XML
  * Bind the XML to the toplevel window
  * Receive and understands the Global Menu events

### Requirements ###
  * Experience with XUL runner programming
  * C++ experience
  * Knowledge in X11 or GDK

## Patch Open Office ##
It has been long known that Open Office doesn't use native GTK, and therefore can not benefit from the Global Menu's GTK Plugin. However no fully usable office suite that utilizes native GTK is available. The result is direct: on a desktop with Global Menu enabled, the default office suite, which is accessed by the user almost everyday becomes an exception that behaves differently from all other applications. Too bad. This proposed SOC project aims to provide a patch for the Open Office & Global Menu users.

References:
  * Global Menu Specification - http://code.google.com/p/gnome2-globalmenu/wiki/GlobalMenuSpecification

### Goals ###
Patch Openoffice to implement a Global Menu client inside it.
  * Interpolate the menu into Global Menu XML
  * Bind the XML to the toplevel window
  * Receive and understands the Global Menu events

### Requirements ###
  * Experience with Openoffice programming model
  * C++ experience
  * Knowledge in X11 or GDK

## Patch Java Swing library ##

### Background ###
Java Swing programs are yet another category of Global Menu exceptions. Back in 2 years ago, the mac-menu patch was able to steal the Java Swing menu bar in a unstable manner. Without digging deep into Java Swing library's source code, a stable patch is nearly impossible.
This proposed SOC project aims to study the Swing library, to patch the library, and to make the library global menu friendly.

References:
  * Global Menu Specification - http://code.google.com/p/gnome2-globalmenu/wiki/GlobalMenuSpecification

### Goals ###
Patch Java Swing Library to implement a Global Menu client inside it.

### Requirements ###
  * Familiarity with Java Swing library
  * Skills in Java programming language
  * Perhaps also C/C++ depending on the language the swing library uses.
  * Knowledge in X11

## Add an instant preview of files functionnality to Nautilus ##
(mentor: BadChoice)
### Background ###
Gloobus is an extension of Gnome designed to enable a full screen preview of any kind of file. Designed as an extendable, standards-compliant previewer , Gloobus enables instant previewing of your files, without even having to open them. Hit space, and BANG, here's the content of your file, displayed as it would if it was opened. Currently, Gloobus supports MP3, TXT , PDF, JPG, PNG, TTF. There's also a Coverflow-like part which is being set aside for the time being.

Your proposal may include refactoring and propose a Nautilus extension to integrate the Coverflow-like plugin into Nautilus.
It may alternatively (or in addition) propose a given number of preview plugins for some extensions (eg odt, xcf...)
### Requirements ###
  * C++ knoweldege
  * Orientated object knoweldege
  * GTK knoweldege appreciated but it can be easily learned
  * for the Coverflow part, openGL or Clutter is required.
  * Note: https://edge.launchpad.net/gloobus


For guidance on how to shape your proposal, feel free to contact BadChoice at the above

# Application as an GSoC Organization #

> - Link to the GSoC application page: http://socghop.appspot.com/

> - Group Name: The GlobalMenu Project

> - Home Page URL: http://code.google.com/p/gnome2-globalmenu/

> - Public Email: pierre.slamich@gmail.com

> - Description:

The GlobalMenu Project aims to bring the features of modern document-centric desktops to Linux, especially global menus in its first phase. This task is actually quite hefty, given our aim for a standards-based cross-desktop solution, including Gnome, KDE and XFCE, and possibly more, thanks to a carefully designed specification.
Our other task is to enable the most popular toolkits and applications to detach their menus and thus provide compatibility.

> - Why is your group applying to participate? What do you hope to gain by participating?

We hope to foster the growth of the document-centric approach as the Open Source scene is trying to catch up on MacOSX which is the only other big player in that area. We also hope to find students passionate about this approach to the desktop, and to expand their skills to enable them to make further progress in the Free Desktop area, and possibly as a member of the GlobalMenu project.

> - What is the main public mailing list for your group?

http://groups.google.com/group/gnome-globalmenu

> - Where is the main IRC channel for your group?
We don't have an IRC channel.

> - What criteria do you use to select the members of your group? Please be as specific as possible.

> - We use patch submissions as a basis, as well as clear motivation. Members have to step forward, explain what they can bring - not necessarily in a formal way.

> - Has your group participated previously? If so, please summarize your involvement and any past successes and failures.

We never applied to SoC as an organization.

> - If your group has not previously participated, have you applied in the past? If so, for what sort of participation?

The Global Menu in Gnome project applied for GSOC2008 as a project mentored by GNOME project. The project was not selected, although the planned summer code project were eventually implemented.

> - What license does your organization use?

GNU Lesser General Public License v2.

> - What is the URL to the ideas list of your organization?

http://code.google.com/p/gnome2-globalmenu/wiki/SummerOfCode2009

> - What is the main development mailing list for your group?

http://groups.google.com/group/gnome-globalmenu

> - What is the application template you would like contributors to your organization to use.

Your application must be written in proper(Proofreading!) English and contain a detailed description of your project proposal, even though it is merely a proposed idea. If you are confused on any of the questions, post a message to the main mail list of the project at http://groups.google.com/group/gnome-globalmenu.

We are especially interested in the following questions. Feel free to add your own thoughts, as these are not exclusive.

  * What is the project's ultimate goal?
  * What benefits does it have for GlobalMenu, its community and the upstream desktop projects?
  * What components will the project have?
  * Why you'd like to complete this particular project?
  * How do you plan to achieve completion of your project?
> > o A schedule with dates and important milestones/deliveries will be sufficient.
  * Why should you be the right one to work on this project?
  * What are your past experiences (if any) within the open source software?
  * Could you describe us your perspective of an ideal desktop? Why are you interested in the Document-Centric idea?
  * Please (if applicable) attach a link to a bug containing a patch you've written (in any project related to your application - be it GlboalMenu, an upstream project or any relevant open-source project.

We love neat applications but there is not a clear guideline for the format. The formatting anyways will of course influence us in our selection. We indeed tend to think that both content and presentation are important. Anyways, why else would we work on a document-centric desktop?


> - What is your plan for dealing with disappearing contributors?

We have people in Germany, China, France, England and Italy to chase them and hunt them down ;-)
More seriously, we can do all that are expected, and more.
- Stay alarm for any potential problems, and make it clear to announce any snags proactively (even if they don't actually happen)
- Provide very quick feedback to the contributor
- Never be intrusive or annoying in a way that could further hinder the motivation

A physical address and phone number, or any way to communicate face to face with the students (more than online chatting) will be required from the student.
A regular (online) meeting will be set up between the mentor and the student. The student is responsible to show up in the meeting to ensure his existence and the good status of the summer project. If the student is absent for 2 continues meetings without valid reasons, we consider the student as disappeared, and project as aborted.

> - What is your plan for dealing with disappearing members?

This policy stems from the history of the project which developed from an orphaned hack.
- Politely warn other members ahead when a rough week due to personal work arrives.
- Document the work in a detailed basis so that we could all theoretically drop dead without jeopardizing the project.
In general we strive to be disappearing-proof. One person's absence may delay the progress but will never completely fail the project, because others will be able to pick up the work rapidly

> - What steps will you take to encourage contributors to interact with your community before, during, and after the program?

- Release Early Release Often.
If a proposed sub-project is chosen, we will introduce the contributor to the community at the first time. Whenever it is practical, we encourage the contributor to push the code to the community and the users, in order to receive additional feedback beyond the mentors. We will also make sure that he gets feedback from upstream (if applicable) thanks to our connection with upstream projects.

> - What will you do to ensure that your accepted contributors stick with the project after the program concludes?

Normally, the selection and the very special nature of the project should do the work, but we have many ideas to keep people busy, very rewarding mini-projects that are not too much time consuming, especially for students.

The team sincerely hope that the relationship built from this summer will last far more beyond this short period. We focus on reward, as all the work is highly visible.
After the summer code period, the team will be maintaining the projects in case the contributor decides to leave the project.

In order to avoid frustrating the students with the so called 'big patch waiting for review' issue, we will try to merge the work before completion, if possible and where relevant.