NULL=
SUBDIRS = . tests

VALASOURCES = \
	globalmenubar.vala \
	globalmenuitem.vala \
	globalmenuadapter.vala \
	adapter.vala \
	gnomenu.vala \
	monitor.vala \
	window.vala \
	parser.vala \
	serializer.vala \
	interfaces/shell.vala \
	interfaces/item.vala \
	widgets/menu.vala \
	widgets/menubar.vala \
	widgets/menuitem.vala \
	widgets/menubarbox.vala \
	widgets/menulabel.vala \
	utils/menushellutils.vala \
	utils/keygrab.vala \
	$(NULL)

lib_LTLIBRARIES = libgnomenu.la

libgnomenu_la_SOURCES = \
						$(VALASOURCES:.vala=.c) \
						libgnomenu.h \
						ccode/keygrab-ccode.c \
						ccode/menushellutils-ccode.c 

libgnomenu_la_CPPFLAGS = \
			 -I$(top_srcdir) \
			 $(GTK_CFLAGS) \
			 $(WNCK_CFLAGS) \
			 $(X11_CFLAGS) \
			 -DG_LOG_DOMAIN=\"libgnomenu\" \
			 -include $(CONFIG_HEADER) \
			 -include ../legacy-support/legacy-support.h

libgnomenu_la_LIBADD = ../legacy-support/liblegacy-support.la

libgnomenu_la_LDFLAGS = -version-info 2:0:0 -release $(VERSION) -Wl,--as-needed

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libgnomenu.pc

libgnomenu_includedir = $(includedir)/libgnomenu
libgnomenu_include_HEADERS = libgnomenu.h
if WITH_GIR
typelibdir = $(TYPELIBDIR)
typelib_DATA = Gnomenu-1.0.typelib
girdir = $(GIRDIR)
gir_DATA = Gnomenu-1.0.gir
SUFFIXES = .gir .typelib
.gir.typelib: libgnomenu.la
	LD_LIBRARY_PATH=$${LD_LIBRARY_PATH:+$$LD_LIBRARY_PATH:}. $(GIRCOMPILER) $^ -o $@
endif 

#VALAC=/home/rainwoodman/Projects/vala/compiler/valac
gnomenu.vapi: $(VALASOURCES) bindings.vapi
	$(VALAC) $(VALA_DEFAULT_PKGS) -C --basedir=$(top_srcdir) -H libgnomenu.h \
		--library $(@:.vapi=) $(VALASOURCES) \
		bindings.vapi \
		--pkg gtk+-2.0 \
		--pkg libwnck-1.0 \
		--pkg gnome-desktop-2.0 \
		--pkg gdk-x11-2.0

BUILT_SOURCES = gnomenu.vapi

EXTRA_DIST = $(VALASOURCES) gnomenu.vapi gnomenu.deps bindings.vapi Gnomenu-1.0.gir libgnomenu.pc.in libgnomenu-uninstalled.pc.in 

