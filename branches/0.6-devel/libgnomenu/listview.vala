using GLib;
using Gtk;
using Gnomenu;
using GMarkupDoc;

namespace Gnomenu {
	[CCode (cname="gtk_tree_view_insert_column_with_data_func")]
	public extern int gtk_tree_view_insert_column_with_data_func(
		Gtk.TreeView tw, int pos, 
		string title, Gtk.CellRenderer cell, 
		Gtk.TreeCellDataFunc func, 
		GLib.DestroyNotify? dnotify);

	public class ListView : Gtk.ScrolledWindow {
		private Gtk.TreeView treeview;
		private Document _document;
		public weak Document? document {
			get {
				return _document;
			} set {
				_document = value;
				treeview.set_model(document);
			}
		}
		public ListView(Document? document) {
			this.document = document;
		}
		construct {
			message("constructing the viewer");
			treeview = new Gtk.TreeView();
			this.add(treeview);
			gtk_tree_view_insert_column_with_data_func (treeview, 0, "Title", new Gtk.CellRendererText(), 
				(tree_column, c, model, iter) => {
					Gtk.CellRendererText cell = c as Gtk.CellRendererText;
					weak GMarkupDoc.Tag node;
					model.get(iter, 0, out node, -1);
					weak string text = null;
					text = node.get("label");
					if(text == null) text = node.get("name");
					if(text == null) text = node.tag;
					cell.text = text;
					weak string visible = node.get("visible");
					if(visible == "false") 
						cell.foreground = "gray";
					else
						cell.foreground = "black";
					weak string enabled = node.get("sensitive");
					if(enabled == "false")
						cell.background = "red";
					else
						cell.background = "white";
				}, null);
			gtk_tree_view_insert_column_with_data_func (treeview, 1, "GMarkup", new Gtk.CellRendererText(), 
				(tree_column, cell, model, iter) => {
					weak GMarkupDoc.Node node;
					model.get(iter, 0, out node, -1);
					(cell as Gtk.CellRendererText).text = node.summary();
				}, null);
			treeview.row_activated +=(treeview, path, column) => {
				Gtk.TreeModel model = treeview.model;
				weak GMarkupDoc.Node node;
				Gtk.TreeIter iter;
				model.get_iter(out iter, path);
				model.get(iter, 0, out node, -1);
				if(node is Document.Widget) {
					(node as Document.Widget).activate();
				}
			};
		}
	}
}
