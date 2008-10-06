using GLib;
using Gtk;
using XML;
using Gnomenu;
using Wnck;
using WnckCompat;
using Panel;
public extern GLib.Object gnome_program_init_easy(string name, string version,
		string[] args, GLib.OptionContext #context);
public class Applet : Panel.Applet{
static const string FACTORY_IID = "OAFIID:GlobalMenu_PanelApplet_Factory";
static const string APPLET_IID = "OAFIID:GlobalMenu_PanelApplet";
	private WnckCompat.Screen screen;
	private Gnomenu.MenuBar menubar;
	public Applet() {
	}
	construct {
		menubar = new Gnomenu.MenuBar();
		Gtk.Box box = new Gtk.HBox(false, 0);
		menubar.show_tabs = false;
		box.pack_start_defaults(menubar);
		this.add(box);
		screen = WnckCompat.Screen.get_default();
		screen.active_window_changed += (screen, previous_window) => {
			weak Wnck.Window window = screen.get_active_window();
			if(window != previous_window) {
				string xid = window.get_xid().to_string();
				menubar.switch(xid);
			}
		};
		this.set_flags(Panel.AppletFlags.EXPAND_MINOR | Panel.AppletFlags.HAS_HANDLE | Panel.AppletFlags.EXPAND_MAJOR );
		Gtk.rc_parse_string("""
			style "globalmenu_event_box_style"
			{
			 	GtkWidget::focus-line-width=0
			 	GtkWidget::focus-padding=0
			}
			style "globalmenu_menu_bar_style"
			{
				ythickness = 0
				bg[NORMAL] = @bg_color
				GtkMenuBar::shadow-type = none
				GtkMenuBar::internal-padding = 0
			}
			class "GtkEventBox" style "globalmenu_event_box_style"
			class "GtkMenuBar" style "globalmenu_menu_bar_style"
"""
);
	}
	public static int main(string[] args) {
		GLib.OptionContext context = new GLib.OptionContext("");
		GLib.Object program = gnome_program_init_easy(
			"GlobalMenu.PanelApplet",
			"0.6", args, #context);
		int retval = Panel.Applet.factory_main(FACTORY_IID, typeof(Applet), 
			(applet, iid) => {
				if(iid == APPLET_IID) {
					applet.show_all();
					return true;
				} else return false;
			}) ;	
		return retval;
	}

}

