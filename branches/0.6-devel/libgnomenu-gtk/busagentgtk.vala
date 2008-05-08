using GLib;
using Gtk;
using Gnomenu;

namespace GnomenuGtk{
public class BusAgentGtk: BusAgent {
	private static void clear_menu_shell_callback(Widget widget){
		Gtk.MenuShell shell = (Gtk.MenuShell) (widget.get_parent());
		shell.remove(widget);
	}
	public BusAgentGtk (){
	}
	public void setup_menu_shell(MenuShell menu_shell, string path){
		bool visible; // for type casting the dynamic objs
		dynamic DBus.Object menu_r = this.get_object(path, "Menu");
		menu_shell.set_data_full("dbus-obj", menu_r.ref(), g_object_unref);
		menu_r.propChanged += menu_prop_changed;

		/*clear the menu*/
		menu_shell.foreach((Gtk.Callback)clear_menu_shell_callback);

		if(visible = menu_r.getVisible()) menu_shell.show();

		string [] item_paths = menu_r.getMenuItems();
		dynamic DBus.Object[] items = this.get_objects(item_paths, "MenuItem");
		foreach(dynamic DBus.Object item in items){
			Gtk.MenuItem menu_item = new Gtk.MenuItem.with_label(item.getTitle());
			menu_item.set_data_full("dbus-obj", item.ref(), g_object_unref);

			if(visible = item.getVisible()) menu_item.show();
			item.propChanged += item_prop_changed;

			menu_shell.append(menu_item);
			string submenu_path = item.getMenu();
			if(submenu_path != null && submenu_path.size() >0) {
				Gtk.Menu submenu = new Gtk.Menu();
				this.setup_menu_shell(submenu, submenu_path);
				menu_item.set_submenu(submenu);
			} else {
				menu_item.activate += (sender) =>{
					dynamic DBus.Object item = (DBus.Object)sender.get_data("dbus-obj");
					item.activate();
				};
			}
		}
	}
	void item_prop_changed(dynamic DBus.Object sender, string prop_name){
		string sender_path = sender.get_path();
		message("%s.%s is changed", sender_path, prop_name);
	}
	void menu_prop_changed(dynamic DBus.Object sender, string prop_name){
		string sender_path = sender.get_path();
		message("%s.%s is changed", sender_path, prop_name);
	}

}
}
