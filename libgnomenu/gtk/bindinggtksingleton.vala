using GLib;
using Gtk;
using Gnomenu;
using XML;
namespace GnomenuGtk {

	protected class Singleton {
		static Singleton _instance;
		public Client client;
		public weak Document document;
		private int unique_id;
		public int unique {
			get {
				unique_id++;
				return unique_id;
			}
		}
		private Gtk.Window window;
		public static Singleton instance() {
			if(_instance == null)
				_instance = new Singleton();
			return _instance;
		}
		private Singleton() {
			Document document = new Document();
			this.document = document;
			client = new Client(document);
			unique_id = 99;
			if(Environment.get_variable("GNOMENU_FUN") != null) {
				window = new Gtk.Window(Gtk.WindowType.TOPLEVEL);
				ListView viewer = new ListView(document);
				window.add(viewer);
				window.show_all();
			}
		}
	}
}
