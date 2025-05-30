/* libgitg-1.0.vapi generated by valac 0.57.0.169-9de8e, do not modify. */

[CCode (gir_namespace = "Gitg", gir_version = "1.0")]
namespace Gitg {
	[CCode (cheader_filename = "libgitg.h")]
	public class Async {
		public delegate void ThreadFunc () throws GLib.Error;
		public Async ();
		public static async void thread (Gitg.Async.ThreadFunc func) throws GLib.Error;
		public static async void thread_try (Gitg.Async.ThreadFunc func);
	}
	[CCode (cheader_filename = "libgitg.h")]
	[GtkTemplate (ui = "/org/gnome/gitg/ui/gitg-authentication-dialog.ui")]
	public class AuthenticationDialog : Gtk.Dialog {
		public AuthenticationDialog (string url, string? username, bool failed);
		public Gitg.AuthenticationLifeTime life_time { get; }
		public string password { get; }
		public string username { get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class AvatarCache : GLib.Object {
		public static Gitg.AvatarCache @default ();
		public async Gdk.Pixbuf? load (string email, int size = 50, GLib.Cancellable? cancellable = null);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class BranchBase : Ggit.Branch, Gitg.Ref, Gitg.Branch {
		public BranchBase ();
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class CellRendererLanes : Gtk.CellRendererText {
		public CellRendererLanes ();
		public override void get_preferred_width (Gtk.Widget widget, out int minimum_width, out int natural_width);
		public Gitg.Ref? get_ref_at_pos (Gtk.Widget widget, int x, int cell_w, out int hot_x);
		public override void render (Cairo.Context context, Gtk.Widget widget, Gdk.Rectangle area, Gdk.Rectangle cell_area, Gtk.CellRendererState flags);
		public Gitg.Commit? commit { get; set; }
		public uint dot_width { get; set; }
		public weak GLib.SList<Gitg.Ref> labels { get; set; }
		public uint lane_width { get; set; }
		public Gitg.Commit? next_commit { get; set; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Color : GLib.Object {
		public uint idx;
		public Color ();
		public void components (out double r, out double g, out double b);
		public Gitg.Color copy ();
		public static Gitg.Color next ();
		public Gitg.Color next_index ();
		public static void reset ();
		public double b { get; }
		public double g { get; }
		public double r { get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Commit : Ggit.Commit {
		public Commit ();
		public Ggit.Diff get_diff (Ggit.DiffOptions? options, int parent);
		public unowned GLib.SList<Gitg.Lane> get_lanes ();
		public Ggit.Note get_note ();
		public unowned GLib.SList<Gitg.Lane> insert_lane (Gitg.Lane lane, int idx);
		public unowned GLib.SList<Gitg.Lane> remove_lane (Gitg.Lane lane);
		public void update_lanes (owned GLib.SList<Gitg.Lane> lanes, int mylane);
		public string author_date_for_display { owned get; }
		public string committer_date_for_display { owned get; }
		public string format_patch_name { owned get; }
		public Gitg.Lane lane { get; }
		public uint mylane { get; set; }
		public Gitg.LaneTag tag { get; set; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class CommitListView : Gtk.TreeView, Gtk.Buildable {
		public CommitListView (Gitg.CommitModel model);
		public Gtk.CellRenderer? find_cell_at_pos (Gtk.TreeViewColumn column, Gtk.TreePath path, int x, out int width);
		public CommitListView.for_repository (Gitg.Repository repository);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class CommitModel : GLib.Object, Gtk.TreeModel {
		public CommitModel (Gitg.Repository? repository);
		public Gitg.Commit? commit_from_iter (Gtk.TreeIter iter);
		public Gitg.Commit? commit_from_path (Gtk.TreePath path);
		public override void dispose ();
		public new Gitg.Commit? @get (uint idx);
		public Ggit.OId[] get_include ();
		public Ggit.OId[] get_permanent_lanes ();
		public Gtk.TreePath? path_from_commit (Gitg.Commit commit);
		public void reload ();
		public void set_exclude (Ggit.OId[] ids);
		public void set_include (Ggit.OId[] ids);
		public void set_permanent_lanes (Ggit.OId[] value);
		public uint size ();
		public uint limit { get; set; }
		public Gitg.Repository repository { get; set; }
		public Ggit.SortMode sort_mode { get; set; }
		public signal void begin_clear ();
		public signal void end_clear ();
		public signal void finished ();
		public signal void started ();
		public signal void update (uint added);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class CredentialsManager {
		public CredentialsManager (Ggit.Config? config, Gtk.Window window, bool save_user_in_config);
		public Ggit.Cred? credentials (string url, string? username, Ggit.Credtype allowed_types) throws GLib.Error;
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Date : GLib.Object, GLib.Initable {
		public Date (string date) throws GLib.Error;
		public Date.for_date_time (GLib.DateTime dt);
		public string for_display ();
		public static GLib.DateTime parse (string date) throws GLib.Error;
		public GLib.DateTime date { get; }
		public string date_string { get; set construct; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class DiffStat : Gtk.DrawingArea {
		public DiffStat ();
		protected override bool draw (Cairo.Context context);
		protected override void get_preferred_height (out int minimum_height, out int natural_height);
		protected override void get_preferred_width (out int minimum_width, out int natural_width);
		protected override void style_updated ();
		public uint added { get; set; }
		public uint removed { get; set; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	[GtkTemplate (ui = "/org/gnome/gitg/ui/gitg-diff-view.ui")]
	public class DiffView : Gtk.Grid {
		public DiffView ();
		public void apply_link_tags (Gtk.TextBuffer buffer, GLib.Regex regex, string? replacement, Gdk.RGBA custom_color_link, bool is_custom_color, bool is_custom_link);
		public void clear_selection ();
		protected override void constructed ();
		public override void dispose ();
		public void follow_if_link (Gtk.Widget texview, Gtk.TextIter iter);
		public Gitg.PatchSet[] get_selection ();
		public bool changes_inline { get; set; }
		public Gitg.Commit? commit { get; set; }
		public int context_lines { get; set construct; }
		public bool default_collapse_all { get; set construct; }
		public Ggit.Diff? diff { get; set; }
		public bool handle_selection { get; set construct; }
		public bool has_selection { get; private set; }
		public bool highlight { get; set construct; }
		public bool ignore_whitespace { get; set; }
		public bool new_is_workdir { get; set; }
		public Ggit.DiffOptions options { get; }
		public Gitg.Repository? repository { get; set; }
		public bool show_parents { get; set; }
		public bool staged { get; set; }
		public int tab_width { get; set construct; }
		public bool unstaged { get; set; }
		public bool use_gravatar { get; set construct; }
		public bool wrap_lines { get; set construct; }
		public virtual signal void options_changed ();
	}
	[CCode (cheader_filename = "libgitg.h")]
	[GtkTemplate (ui = "/org/gnome/gitg/ui/gitg-diff-view-options.ui")]
	public class DiffViewOptions : Gtk.Toolbar {
		public DiffViewOptions (Gitg.DiffView? view = null);
		protected override void constructed ();
		public override void dispose ();
		public int context_lines { get; set; }
		public Gitg.DiffView? view { get; set construct; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class FontManager : GLib.Object {
		public FontManager (Gtk.TextView text_view, bool plugin);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class GPGUtils {
		public GPGUtils ();
		public static string sign_commit_object (string commit_content, string signing_key) throws GLib.Error;
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Hook : GLib.Object {
		public Hook (string name);
		public void add_argument (string arg);
		public bool exists_in (Ggit.Repository repository);
		public async int run (Ggit.Repository repository) throws GLib.SpawnError;
		public int run_sync (Ggit.Repository repository) throws GLib.SpawnError;
		public Gee.HashMap<string,string> environment { get; set; }
		public string name { get; set; }
		public string[] output { owned get; }
		public GLib.File? working_directory { get; set; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class LabelRenderer {
		public LabelRenderer ();
		public static void draw (Gtk.Widget widget, Pango.FontDescription font, Cairo.Context context, GLib.SList<Gitg.Ref> labels, Gdk.Rectangle area);
		public static Gitg.Ref? get_ref_at_pos (Gtk.Widget widget, Pango.FontDescription font, GLib.SList<Gitg.Ref> labels, int x, out int hot_x);
		public static Gdk.Pixbuf render_ref (Gtk.Widget widget, Pango.FontDescription font, Gitg.Ref r, int height, int minwidth);
		public static int width (Gtk.Widget widget, Pango.FontDescription* font, GLib.SList<Gitg.Ref> labels);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Lane : GLib.Object {
		public Ggit.OId? boundary_id;
		public Gitg.Color color;
		public GLib.SList<int> from;
		public Gitg.LaneTag tag;
		public Lane ();
		public Gitg.Lane copy ();
		public Gitg.Lane dup ();
		public Lane.with_color (Gitg.Color? color);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Lanes : GLib.Object {
		public Lanes ();
		public bool next (Gitg.Commit next, out GLib.SList<Gitg.Lane> lanes, out int nextpos, bool save_miss = false);
		public void reset (Ggit.OId[]? reserved = null, Gee.HashSet<Ggit.OId>? roots = null);
		public int inactive_collapse { get; set; }
		public bool inactive_enabled { get; set; }
		public int inactive_gap { get; set; }
		public int inactive_max { get; set; }
		public Gee.LinkedList<Gitg.Commit> miss_commits { get; set; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class ParsedRefName : GLib.Object {
		public ParsedRefName (string name);
		public string name { owned get; }
		public string? prefix { get; }
		public string? remote_branch { owned get; }
		public string? remote_name { owned get; }
		public Gitg.RefType rtype { get; private set; }
		public string shortname { owned get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class PatchSet {
		public struct Patch {
			public Gitg.PatchSet.Type type;
			public size_t old_offset;
			public size_t new_offset;
			public size_t length;
		}
		public enum Type {
			ADD,
			REMOVE
		}
		public string filename;
		public Gitg.PatchSet.Patch[] patches;
		public PatchSet ();
		public Gitg.PatchSet reversed ();
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class ProgressBin : Gtk.Bin {
		public ProgressBin ();
		public override bool draw (Cairo.Context cr);
		public override void realize ();
		public override void size_allocate (Gtk.Allocation allocation);
		public double fraction { get; set; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class RefBase : Ggit.Ref, Gitg.Ref {
		public RefBase ();
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Remote : Ggit.Remote {
		public Remote ();
		public new async void connect (Ggit.Direction direction, Ggit.RemoteCallbacks? callbacks = null) throws GLib.Error;
		public new async void disconnect () throws GLib.Error;
		public override void dispose ();
		public new async void download (Ggit.RemoteCallbacks? callbacks = null) throws GLib.Error;
		public new async void fetch (string? message, Ggit.RemoteCallbacks? callbacks = null) throws GLib.Error;
		public new async void push (string branch, Ggit.RemoteCallbacks? callbacks = null) throws GLib.Error;
		public Gitg.CredentialsProvider? credentials_provider { get; set; }
		public string[]? fetch_specs { owned get; set; }
		public string[]? push_specs { owned get; set; }
		public Gitg.RemoteState state { get; private set; }
		public double transfer_progress { get; }
		public signal void tip_updated (string refname, Ggit.OId a, Ggit.OId b);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Repository : Ggit.Repository {
		public Repository (GLib.File location, GLib.File? workdir) throws GLib.Error;
		public void clear_refs_cache ();
		public new Gitg.Branch create_branch (string name, Ggit.Object obj, Ggit.CreateFlags flags) throws GLib.Error;
		public new Gitg.Ref create_reference (string name, Ggit.OId oid, string message) throws GLib.Error;
		public new Gitg.Ref create_symbolic_reference (string name, string target, string message) throws GLib.Error;
		public new Gitg.Ref get_head () throws GLib.Error;
		public Ggit.Signature get_signature_with_environment (Gee.Map<string,string> env, string envname = "COMMITER") throws GLib.Error;
		public new static Gitg.Repository init_repository (GLib.File location, bool is_bare) throws GLib.Error;
		public new T? lookup<T> (Ggit.OId id) throws GLib.Error;
		public new Gitg.Ref lookup_reference (string name) throws GLib.Error;
		public new Gitg.Ref lookup_reference_dwim (string short_name) throws GLib.Error;
		public unowned GLib.SList<Gitg.Ref> refs_for_id (Ggit.OId id);
		public string? name { owned get; }
		public Gitg.Stage stage { owned get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class RepositoryListBox : Gtk.ListBox {
		[GtkTemplate (ui = "/org/gnome/gitg/ui/gitg-repository-list-box-row.ui")]
		public class Row : Gtk.ListBoxRow {
			public Row (Gitg.Repository? repository, string dirname);
			public string? branch_name { get; set; }
			public bool can_remove { get; set; }
			public string? dirname { get; set; }
			public double fraction { set; }
			public bool loading { get; set; }
			public Gitg.SelectionMode mode { get; set; }
			public Gitg.Repository? repository { get; set; }
			public string? repository_name { get; set; }
			public new bool selected { get; set; }
			public GLib.DateTime time { get; set; }
			public signal void request_delete_source ();
			public signal void request_remove ();
		}
		public RepositoryListBox ();
		public Gitg.RepositoryListBox.Row? add_repository (Gitg.Repository repository, GLib.DateTime? visited = null);
		public Gitg.RepositoryListBox.Row? begin_cloning (GLib.File location);
		protected override bool button_press_event (Gdk.EventButton event);
		public void end_cloning (Gitg.RepositoryListBox.Row row, Gitg.Repository? repository);
		public void filter_text (string? text);
		public Gitg.RepositoryListBox.Row[] get_selection ();
		public void populate_bookmarks ();
		protected override void row_activated (Gtk.ListBoxRow row);
		public bool bookmarks_from_recent_files { get; set; }
		public bool has_selection { get; }
		public GLib.File? location { get; set; }
		public Gitg.SelectionMode mode { get; set; }
		public signal void repository_activated (Gitg.Repository repository);
		public signal void show_error (string primary_message, string secondary_message);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Resource {
		public Resource ();
		public static Gtk.CssProvider? load_css (string id);
	}
	[CCode (cheader_filename = "libgitg.h")]
	[GtkTemplate (ui = "/org/gnome/gitg/ui/gitg-sidebar.ui")]
	public class Sidebar : Gtk.TreeView {
		public Sidebar ();
		protected override bool button_press_event (Gdk.EventButton event);
		public T? get_selected_item<T> ();
		public T[] get_selected_items<T> ();
		protected bool get_selected_iter (out Gtk.TreeIter iter);
		public bool is_selected (Gitg.SidebarItem item);
		protected override bool key_press_event (Gdk.EventKey event);
		protected override bool popup_menu ();
		protected override void row_activated (Gtk.TreePath path, Gtk.TreeViewColumn column);
		public void select (Gitg.SidebarItem item);
		protected virtual bool select_function (Gtk.TreeSelection sel, Gtk.TreeModel model, Gtk.TreePath path, bool cursel);
		protected virtual void selection_changed (Gtk.TreeSelection sel);
		public new Gitg.SidebarStore model { get; set; }
		public signal void deselected ();
		public signal void populate_popup (Gtk.Menu menu);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class SidebarStore : Gtk.TreeStore {
		public class SidebarHeader : Gitg.SidebarStore.SidebarText {
			public SidebarHeader (string text, uint id);
			public uint id { get; }
		}
		protected class SidebarText : GLib.Object, Gitg.SidebarItem {
			public SidebarText (string text);
		}
		public SidebarStore ();
		public void activate (Gtk.TreeIter iter, int numclick);
		public new Gitg.SidebarStore append (Gitg.SidebarItem item);
		public Gitg.SidebarStore append_dummy (string text);
		public Gitg.SidebarStore.SidebarHeader begin_header (string text, uint id = 0);
		public uint begin_section ();
		public new void clear ();
		public Gitg.SidebarStore end_header ();
		public void end_section ();
		public Gitg.SidebarItem item_for_iter (Gtk.TreeIter iter);
		public bool clearing { get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Stage : GLib.Object {
		public async Ggit.OId? commit (string message, Ggit.Signature author, Ggit.Signature committer, Gitg.StageCommitOptions options) throws GLib.Error;
		public async Ggit.OId? commit_index (Ggit.Index index, Ggit.Ref reference, string message, Ggit.Signature author, Ggit.Signature committer, Ggit.OId[]? parents, Gitg.StageCommitOptions options) throws GLib.Error;
		public async Ggit.OId? commit_tree (Ggit.OId treeoid, Ggit.Ref reference, string message, Ggit.Signature author, Ggit.Signature committer, Ggit.OId[]? parents, Gitg.StageCommitOptions options) throws GLib.Error;
		public async void @delete (GLib.File file) throws GLib.Error;
		public async void delete_path (string path) throws GLib.Error;
		public async Ggit.Diff? diff_index (Gitg.StageStatusItem f, Ggit.DiffOptions? defopts = null) throws GLib.Error;
		public async Ggit.Diff? diff_index_all (Gitg.StageStatusItem[]? files, Ggit.DiffOptions? defopts = null) throws GLib.Error;
		public async Ggit.Diff? diff_workdir (Gitg.StageStatusItem f, Ggit.DiffOptions? defopts = null) throws GLib.Error;
		public async Ggit.Diff? diff_workdir_all (Gitg.StageStatusItem[] files, Ggit.DiffOptions? defopts = null) throws GLib.Error;
		public Gitg.StageStatusEnumerator file_status (Ggit.StatusOptions? options = null);
		public async Ggit.Tree? get_head_tree () throws GLib.Error;
		public async void pre_commit_hook (Ggit.Signature author) throws Gitg.StageError;
		public async void refresh () throws GLib.Error;
		public async void revert (GLib.File file) throws GLib.Error;
		public async void revert_patch (Gitg.PatchSet patch) throws GLib.Error;
		public async void revert_path (string path) throws GLib.Error;
		public async void stage (GLib.File file) throws GLib.Error;
		public async void stage_commit (string path, Ggit.Commit commit) throws GLib.Error;
		public async void stage_patch (Gitg.PatchSet patch) throws GLib.Error;
		public async void stage_path (string path) throws GLib.Error;
		public async void unstage (GLib.File file) throws GLib.Error;
		public async void unstage_patch (Gitg.PatchSet patch) throws GLib.Error;
		public async void unstage_path (string path) throws GLib.Error;
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class StageStatusEnumerator : GLib.Object {
		public void cancel ();
		public async Gitg.StageStatusItem[] next_items (int num);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class StageStatusFile : GLib.Object, Gitg.StageStatusItem {
		public StageStatusFile (string path, Ggit.StatusFlags flags);
		public Ggit.StatusFlags flags { get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class StageStatusSubmodule : GLib.Object, Gitg.StageStatusItem {
		public StageStatusSubmodule (Ggit.Submodule submodule);
		public Ggit.SubmoduleStatus flags { get; }
		public bool is_dirty { get; }
		public Ggit.Submodule submodule { get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class TextConv {
		public TextConv ();
		public static uint8[] get_textconv_content (Gitg.Repository repository, Ggit.DiffFile file);
		public static uint8[] get_textconv_content_from_raw (Gitg.Repository repository, Ggit.DiffFile file, uint8[]? raw_content);
		public static bool has_textconv_command (Gitg.Repository repository, Ggit.DiffFile file);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Theme : Gtk.Widget {
		public Theme ();
		public static unowned Gitg.Theme instance ();
		public bool is_theme_dark ();
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class Utils {
		public Utils ();
		public static string expand_home_dir (string path);
		public static string replace_home_dir_with_tilde (GLib.File file);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public class WhenMapped {
		public delegate void OnMapped ();
		public WhenMapped (Gtk.Widget widget);
		public void update (owned Gitg.WhenMapped.OnMapped mapped, GLib.Object? lifetime = null);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public interface Branch : Ggit.Branch, Gitg.Ref {
		public new abstract Gitg.Ref get_upstream () throws GLib.Error;
	}
	[CCode (cheader_filename = "libgitg.h")]
	public interface CredentialsProvider : GLib.Object {
		public abstract Ggit.Cred? credentials (string url, string? username_from_url, Ggit.Credtype allowed_types) throws GLib.Error;
	}
	[CCode (cheader_filename = "libgitg.h")]
	public interface Ref : Ggit.Ref {
		public new abstract Gitg.Repository get_owner ();
		protected abstract Gitg.ParsedRefName d_parsed_name { get; set; }
		protected abstract GLib.List<Gitg.Ref>? d_pushes { get; owned set; }
		public Gitg.ParsedRefName parsed_name { owned get; }
		public GLib.List<Gitg.Ref> pushes { get; }
		public abstract Gitg.RefState state { get; set; }
		public abstract bool working { get; set; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public interface SidebarItem : GLib.Object {
		public virtual void activate (int numclick);
		public abstract string? icon_name { owned get; }
		public abstract string text { owned get; }
		public signal void activated (int numclick);
	}
	[CCode (cheader_filename = "libgitg.h")]
	public interface StageStatusItem : GLib.Object {
		public abstract string? icon_name { owned get; }
		public abstract bool is_staged { get; }
		public abstract bool is_unstaged { get; }
		public abstract bool is_untracked { get; }
		public abstract string path { owned get; }
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum AuthenticationLifeTime {
		FORGET,
		SESSION,
		FOREVER
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum CommitModelColumns {
		SHA1,
		SUBJECT,
		MESSAGE,
		AUTHOR,
		AUTHOR_NAME,
		AUTHOR_EMAIL,
		AUTHOR_DATE,
		COMMITTER,
		COMMITTER_NAME,
		COMMITTER_EMAIL,
		COMMITTER_DATE,
		COMMIT,
		NUM;
		public GLib.Type type ();
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum DeleteSources {
		CANCEL,
		TRASH,
		DELETE
	}
	[CCode (cheader_filename = "libgitg.h")]
	[Flags]
	public enum LaneTag {
		NONE,
		START,
		END,
		SIGN_STASH,
		SIGN_STAGED,
		SIGN_UNSTAGED,
		HIDDEN
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum RefState {
		NONE,
		SELECTED,
		PRELIGHT
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum RefType {
		NONE,
		BRANCH,
		REMOTE,
		TAG,
		STASH
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum RemoteState {
		DISCONNECTED,
		CONNECTING,
		CONNECTED,
		TRANSFERRING
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum SelectionMode {
		NORMAL,
		SELECTION
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum SidebarColumn {
		HINT,
		SECTION,
		ITEM
	}
	[CCode (cheader_filename = "libgitg.h")]
	public enum SidebarHint {
		NONE,
		HEADER,
		SEPARATOR,
		DUMMY
	}
	[CCode (cheader_filename = "libgitg.h")]
	[Flags]
	public enum StageCommitOptions {
		NONE,
		SIGN_OFF,
		AMEND,
		SKIP_HOOKS,
		SIGN_COMMIT
	}
	[CCode (cheader_filename = "libgitg.h")]
	public errordomain CredentialsError {
		CANCELLED
	}
	[CCode (cheader_filename = "libgitg.h")]
	public errordomain DateError {
		INVALID_FORMAT
	}
	[CCode (cheader_filename = "libgitg.h")]
	public errordomain InitError {
		THREADS_UNSAFE
	}
	[CCode (cheader_filename = "libgitg.h")]
	public errordomain RemoteError {
		ALREADY_CONNECTED,
		ALREADY_CONNECTING,
		ALREADY_DISCONNECTED,
		STILL_CONNECTING
	}
	[CCode (cheader_filename = "libgitg.h")]
	public errordomain StageError {
		PRE_COMMIT_HOOK_FAILED,
		COMMIT_MSG_HOOK_FAILED,
		NOTHING_TO_COMMIT,
		INDEX_ENTRY_NOT_FOUND,
		SIGN_CONFIG_NOT_FOUND,
		SIGN_CONFIG_ERROR,
		UPDATE_REF_ERROR
	}
	[CCode (cheader_filename = "libgitg.h")]
	public static void init () throws GLib.Error;
}
