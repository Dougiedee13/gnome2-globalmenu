using GLib;
using Gtk;
using XML;
namespace Gnomenu {
	public abstract class Document: XML.Document, Gtk.TreeModel {
		public abstract class Widget:XML.Document.Tag {
			public Gtk.TreeIter iter;
			public weak string name {
				get {return get("name");}
				set {
					if(name != null)
					(document as Document).dict.remove(name);
					set("name", value);
					if(name != null)
					(document as Document).dict.insert(name, this);
				}
			}
			public Widget(Document document) {
				this.document = document;
			}
			construct {}
			public override void dispose() {
				base.dispose();
				(document as Document).dict.remove(name);
				(this.document as Document).treestore.remove(this.iter);
			}
			~Widget(){
				message("WidgetNode %s is removed", name);
			}
			public abstract virtual void activate();
		}
		public abstract virtual Widget CreateWidget(string type, string name);
		public Gtk.TreeStore treestore;
		private HashTable <weak string, weak Widget> dict;
		construct {
			dict = new HashTable<weak string, weak XML.Document.Tag>(str_hash, str_equal);
			treestore = new Gtk.TreeStore(1, typeof(constpointer));
			treestore.row_changed += (o, p, i) => { row_changed(p, i);};
			treestore.row_deleted += (o, p) => { row_deleted(p);};
			treestore.row_has_child_toggled += (o, p, i) => { row_has_child_toggled(p, i);};
			treestore.row_inserted += (o, p, i) => { row_inserted(p, i);};
			treestore.rows_reordered += (o, p, i, n) => {rows_reordered(p, i, n);};
		}
		public virtual weak Widget? lookup(string name) {
			return dict.lookup(name);
		}
		public override void FinishNode(XML.Node n) {
			weak Widget node = n as Widget;
			if(node.parent is Widget) {
				treestore.insert(out node.iter, (node.parent as Widget).iter, node.parent.index(node));
			} else {
				treestore.insert(out node.iter, null, 0);
			}
			treestore.set(node.iter, 0, node, -1);
			node.unfreeze();
			base.FinishNode(node);
		}
		public GLib.Type get_column_type (int index_) {
			return treestore.get_column_type(index_);
		}
		public Gtk.TreeModelFlags get_flags () {
			return treestore.get_flags();
		}
		public bool get_iter (out Gtk.TreeIter iter, Gtk.TreePath path){
			return treestore.get_iter(out iter, path);
		}
		public int get_n_columns () {
			return treestore.get_n_columns();
		}
		public Gtk.TreePath get_path (Gtk.TreeIter iter) {
			return treestore.get_path(iter);
		}
		public void get_value (Gtk.TreeIter iter, int column, ref GLib.Value value) {
			treestore.get_value(iter, column, ref value);
		}
		public bool iter_children (out Gtk.TreeIter iter, Gtk.TreeIter? parent) {
			return treestore.iter_children(out iter, parent);
		}
		public bool iter_has_child (Gtk.TreeIter iter) {
			return treestore.iter_has_child(iter);
		}
		public int iter_n_children (Gtk.TreeIter? iter) {
			return treestore.iter_n_children(iter);
		}
		public bool iter_next (ref Gtk.TreeIter iter) {
			return treestore.iter_next(ref iter);
		}
		public bool iter_nth_child (out Gtk.TreeIter iter, Gtk.TreeIter? parent, int n) {
			return treestore.iter_nth_child(out iter, parent, n);
		}
		public bool iter_parent (out Gtk.TreeIter iter, Gtk.TreeIter child) {
			return treestore.iter_parent(out iter, child);
		}
		public void ref_node (Gtk.TreeIter iter) {
			treestore.ref_node(iter);	
		}
		public void unref_node (Gtk.TreeIter iter) {
			treestore.unref_node(iter);	
		}
	}
}