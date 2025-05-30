/* gcr-4.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Gcr", gir_namespace = "Gcr", gir_version = "4", lower_case_cprefix = "gcr_")]
namespace Gcr {
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_certificate_chain_get_type ()")]
	public class CertificateChain : GLib.Object {
		[CCode (has_construct_function = false)]
		public CertificateChain ();
		public void add (Gcr.Certificate certificate);
		public bool build (string purpose, string? peer, Gcr.CertificateChainFlags flags, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public async bool build_async (string purpose, string? peer, Gcr.CertificateChainFlags flags, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned Gcr.Certificate get_anchor ();
		public unowned Gcr.Certificate get_certificate (uint index);
		public unowned Gcr.Certificate get_endpoint ();
		public uint get_length ();
		public Gcr.CertificateChainStatus get_status ();
		public uint length { get; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_certificate_field_get_type ()")]
	public sealed class CertificateField : GLib.Object {
		[CCode (has_construct_function = false)]
		protected CertificateField ();
		public unowned string get_label ();
		public unowned Gcr.CertificateSection get_section ();
		public bool get_value (out GLib.Value value);
		public GLib.Type get_value_type ();
		public string label { get; construct; }
		public Gcr.CertificateSection section { get; construct; }
		[NoAccessorMethod]
		public GLib.Value value { owned get; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_certificate_request_get_type ()")]
	public sealed class CertificateRequest : GLib.Object {
		[CCode (has_construct_function = false)]
		protected CertificateRequest ();
		public static bool capable (Gck.Object private_key, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public static async bool capable_async (Gck.Object private_key, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool complete (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public async bool complete_async (GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (array_length_pos = 1.1, array_length_type = "gsize")]
		public uint8[] encode (bool textual);
		public Gcr.CertificateRequestFormat get_format ();
		public unowned Gck.Object get_private_key ();
		public static Gcr.CertificateRequest prepare (Gcr.CertificateRequestFormat format, Gck.Object private_key);
		public void set_cn (string cn);
		public Gck.Object private_key { get; construct; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_certificate_section_get_type ()")]
	public sealed class CertificateSection : GLib.Object {
		[CCode (has_construct_function = false)]
		protected CertificateSection ();
		public unowned GLib.ListModel get_fields ();
		public Gcr.CertificateSectionFlags get_flags ();
		public unowned string get_label ();
		public GLib.ListModel fields { get; }
		public string label { get; construct; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gcr_parsed_get_type ()")]
	[Compact]
	public class Parsed {
		public unowned Gck.Attributes? get_attributes ();
		public unowned GLib.Bytes get_bytes ();
		[CCode (array_length_pos = 0.1, array_length_type = "gsize")]
		public unowned uint8[]? get_data ();
		public unowned string? get_description ();
		public unowned string get_filename ();
		public Gcr.DataFormat get_format ();
		public unowned string? get_label ();
		public Gcr.Parsed @ref ();
		public static void unref (void* parsed);
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_parser_get_type ()")]
	public class Parser : GLib.Object {
		[CCode (has_construct_function = false)]
		public Parser ();
		public void add_password (string? password);
		public void format_disable (Gcr.DataFormat format);
		public void format_enable (Gcr.DataFormat format);
		public bool format_supported (Gcr.DataFormat format);
		public unowned string get_filename ();
		public unowned Gcr.Parsed get_parsed ();
		public unowned Gck.Attributes? get_parsed_attributes ();
		[CCode (array_length_pos = 0.1, array_length_type = "gsize")]
		public unowned uint8[]? get_parsed_block ();
		public unowned GLib.Bytes get_parsed_bytes ();
		public unowned string? get_parsed_description ();
		public Gcr.DataFormat get_parsed_format ();
		public unowned string? get_parsed_label ();
		public bool parse_bytes (GLib.Bytes data) throws GLib.Error;
		public bool parse_data ([CCode (array_length_cname = "n_data", array_length_pos = 1.1, array_length_type = "gsize")] uint8[] data) throws GLib.Error;
		public bool parse_stream (GLib.InputStream input, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public async bool parse_stream_async (GLib.InputStream input, GLib.Cancellable? cancellable) throws GLib.Error;
		public void set_filename (string? filename);
		public Gck.Attributes parsed_attributes { get; }
		public string parsed_description { get; }
		public string parsed_label { get; }
		public virtual signal bool authenticate (int count);
		public virtual signal void parsed ();
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_pkcs11_certificate_get_type ()")]
	public class Pkcs11Certificate : Gck.Object, Gcr.Certificate {
		[CCode (has_construct_function = false)]
		protected Pkcs11Certificate ();
		public unowned Gck.Attributes get_attributes ();
		public static Gcr.Certificate lookup_issuer (Gcr.Certificate certificate, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public static async Gcr.Certificate lookup_issuer_async (Gcr.Certificate certificate, GLib.Cancellable? cancellable) throws GLib.Error;
		public static Gcr.Certificate? new_from_uri (string pkcs11_uri, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public static async Gcr.Certificate? new_from_uri_async (string pkcs11_uri, GLib.Cancellable? cancellable) throws GLib.Error;
		public Gck.Attributes attributes { get; construct; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_secret_exchange_get_type ()")]
	public class SecretExchange : GLib.Object {
		[CCode (has_construct_function = false)]
		public SecretExchange (string? protocol);
		public string begin ();
		[NoWrapper]
		public virtual bool derive_transport_key (uint8 peer, size_t n_peer);
		[NoWrapper]
		public virtual bool generate_exchange_key (string scheme, uint8 public_key, size_t n_public_key);
		public unowned string get_protocol ();
		[CCode (array_length_pos = 0.1, array_length_type = "gsize")]
		public unowned string[] get_secret ();
		public bool receive (string exchange);
		public string send (string? secret, ssize_t secret_len);
		public string protocol { get; construct; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_simple_certificate_get_type ()")]
	public class SimpleCertificate : GLib.Object, Gcr.Certificate {
		[CCode (has_construct_function = false, type = "GcrCertificate*")]
		public SimpleCertificate ([CCode (array_length_cname = "n_data", array_length_pos = 1.1, array_length_type = "gsize")] uint8[] data);
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_ssh_askpass_get_type ()")]
	public sealed class SshAskpass : GLib.Object {
		[CCode (has_construct_function = false)]
		public SshAskpass (GLib.TlsInteraction interaction);
		public static void child_setup (void* askpass);
		public unowned GLib.TlsInteraction get_interaction ();
		public GLib.TlsInteraction interaction { get; construct; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_system_prompt_get_type ()")]
	public class SystemPrompt : GLib.Object, Gcr.Prompt, GLib.AsyncInitable, GLib.Initable {
		[CCode (has_construct_function = false)]
		protected SystemPrompt ();
		public bool close (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public async bool close_async (GLib.Cancellable? cancellable) throws GLib.Error;
		public static GLib.Quark error_get_domain ();
		public unowned Gcr.SecretExchange get_secret_exchange ();
		public static Gcr.SystemPrompt open (int timeout_seconds, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public static async Gcr.SystemPrompt open_async (int timeout_seconds, GLib.Cancellable? cancellable) throws GLib.Error;
		public static Gcr.SystemPrompt open_for_prompter (string? prompter_name, int timeout_seconds, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public static async void open_for_prompter_async (string? prompter_name, int timeout_seconds, GLib.Cancellable? cancellable);
		[NoAccessorMethod]
		public string bus_name { owned get; construct; }
		[NoAccessorMethod]
		public Gcr.SecretExchange secret_exchange { owned get; set; }
		[NoAccessorMethod]
		public int timeout_seconds { construct; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_system_prompter_get_type ()")]
	public class SystemPrompter : GLib.Object {
		[CCode (has_construct_function = false)]
		public SystemPrompter (Gcr.SystemPrompterMode mode, GLib.Type prompt_type);
		public Gcr.SystemPrompterMode get_mode ();
		public GLib.Type get_prompt_type ();
		public bool get_prompting ();
		public void register (GLib.DBusConnection connection);
		public void unregister (bool wait);
		public GLib.Type prompt_type { get; construct; }
		public bool prompting { get; }
		public signal Gcr.Prompt new_prompt ();
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_id = "gcr_certificate_get_type ()")]
	public interface Certificate : GLib.Object {
		public bool get_basic_constraints (out bool is_ca, out int path_len);
		[CCode (array_length_pos = 0.1, array_length_type = "gsize")]
		public abstract unowned uint8[] get_der_data ();
		public GLib.DateTime? get_expiry_date ();
		[CCode (array_length_pos = 1.1, array_length_type = "gsize")]
		public unowned uint8[]? get_fingerprint (GLib.ChecksumType type);
		public string? get_fingerprint_hex (GLib.ChecksumType type);
		public GLib.List<Gcr.CertificateSection> get_interface_elements ();
		public GLib.DateTime? get_issued_date ();
		public string? get_issuer_cn ();
		public string? get_issuer_dn ();
		public string? get_issuer_name ();
		public string? get_issuer_part (string part);
		[CCode (array_length_pos = 0.1, array_length_type = "gsize")]
		public uint8[]? get_issuer_raw ();
		public uint get_key_size ();
		[CCode (array_length_pos = 0.1, array_length_type = "gsize")]
		public unowned uint8[]? get_serial_number ();
		public string? get_serial_number_hex ();
		public string? get_subject_cn ();
		public string? get_subject_dn ();
		public string? get_subject_name ();
		public string? get_subject_part (string part);
		[CCode (array_length_pos = 0.1, array_length_type = "gsize")]
		public uint8[]? get_subject_raw ();
		public bool is_issuer (Gcr.Certificate issuer);
		public void mixin_emit_notify ();
		[NoAccessorMethod]
		public abstract string description { owned get; }
		[ConcreteAccessor]
		public abstract GLib.DateTime? expiry_date { owned get; }
		[ConcreteAccessor]
		public abstract string? issuer_name { owned get; }
		[NoAccessorMethod]
		public abstract string? label { owned get; }
		[ConcreteAccessor]
		public abstract string? subject_name { owned get; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_cname = "GcrImportInteractionInterface", type_id = "gcr_import_interaction_get_type ()")]
	public interface ImportInteraction : GLib.TlsInteraction {
		public abstract GLib.TlsInteractionResult supplement (Gck.Builder builder, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public abstract async GLib.TlsInteractionResult supplement_async (Gck.Builder builder, GLib.Cancellable? cancellable) throws GLib.Error;
		public abstract void supplement_prep (Gck.Builder builder);
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_cname = "GcrImporterInterface", type_id = "gcr_importer_get_type ()")]
	public interface Importer : GLib.Object {
		public static GLib.List<Gcr.Importer> create_for_parsed (Gcr.Parsed parsed);
		public unowned GLib.TlsInteraction? get_interaction ();
		public abstract async bool import_async (GLib.Cancellable? cancellable) throws GLib.Error;
		public static GLib.List<Gcr.Importer> queue_and_filter_for_parsed (GLib.List<Gcr.Importer> importers, Gcr.Parsed parsed);
		public abstract bool queue_for_parsed (Gcr.Parsed parsed);
		public static void register (GLib.Type importer_type, owned Gck.Attributes attrs);
		public static void register_well_known ();
		public void set_interaction (GLib.TlsInteraction interaction);
		[ConcreteAccessor]
		public abstract GLib.TlsInteraction interaction { get; set; }
		[NoAccessorMethod]
		public abstract string label { owned get; }
		[NoAccessorMethod]
		public abstract string uri { owned get; }
	}
	[CCode (cheader_filename = "gcr/gcr.h", type_cname = "GcrPromptInterface", type_id = "gcr_prompt_get_type ()")]
	public interface Prompt : GLib.Object {
		public void close ();
		public Gcr.PromptReply confirm (GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (vfunc_name = "prompt_confirm_async")]
		public abstract async Gcr.PromptReply confirm_async (GLib.Cancellable? cancellable) throws GLib.Error;
		public Gcr.PromptReply confirm_run (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public string get_caller_window ();
		public string get_cancel_label ();
		public bool get_choice_chosen ();
		public string get_choice_label ();
		public string get_continue_label ();
		public string get_description ();
		public string get_message ();
		public bool get_password_new ();
		public int get_password_strength ();
		public string get_title ();
		public string get_warning ();
		public unowned string password (GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (vfunc_name = "prompt_password_async")]
		public abstract async unowned string password_async (GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned string password_run (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public void reset ();
		public void set_caller_window (string window_id);
		public void set_cancel_label (string cancel_label);
		public void set_choice_chosen (bool chosen);
		public void set_choice_label (string? choice_label);
		public void set_continue_label (string continue_label);
		public void set_description (string description);
		public void set_message (string message);
		public void set_password_new (bool new_password);
		public void set_title (string title);
		public void set_warning (string? warning);
		[ConcreteAccessor]
		public abstract string caller_window { owned get; set construct; }
		[ConcreteAccessor]
		public abstract string cancel_label { owned get; set construct; }
		[ConcreteAccessor]
		public abstract bool choice_chosen { get; set; }
		[ConcreteAccessor]
		public abstract string choice_label { owned get; set construct; }
		[ConcreteAccessor]
		public abstract string continue_label { owned get; set construct; }
		[ConcreteAccessor]
		public abstract string description { owned get; set construct; }
		[ConcreteAccessor]
		public abstract string message { owned get; set construct; }
		[ConcreteAccessor]
		public abstract bool password_new { get; set; }
		[ConcreteAccessor]
		public abstract int password_strength { get; }
		[ConcreteAccessor]
		public abstract string title { owned get; set construct; }
		[ConcreteAccessor]
		public abstract string warning { owned get; set construct; }
		public virtual signal void prompt_close ();
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_CERTIFICATE_CHAIN_", has_type_id = false)]
	[Flags]
	public enum CertificateChainFlags {
		NONE,
		NO_LOOKUPS
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_CERTIFICATE_CHAIN_", has_type_id = false)]
	public enum CertificateChainStatus {
		UNKNOWN,
		INCOMPLETE,
		DISTRUSTED,
		SELFSIGNED,
		PINNED,
		ANCHORED
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_CERTIFICATE_REQUEST_", has_type_id = false)]
	public enum CertificateRequestFormat {
		[CCode (cname = "GCR_CERTIFICATE_REQUEST_PKCS10")]
		CERTIFICATE_REQUEST_PKCS10
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_CERTIFICATE_SECTION_", has_type_id = false)]
	[Flags]
	public enum CertificateSectionFlags {
		NONE,
		IMPORTANT
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_ERROR_", has_type_id = false)]
	public enum DataError {
		FAILURE,
		UNRECOGNIZED,
		CANCELLED,
		LOCKED;
		public static GLib.Quark get_domain ();
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_FORMAT_", has_type_id = false)]
	public enum DataFormat {
		ALL,
		INVALID,
		DER_PRIVATE_KEY,
		DER_PRIVATE_KEY_RSA,
		DER_PRIVATE_KEY_DSA,
		DER_PRIVATE_KEY_EC,
		DER_SUBJECT_PUBLIC_KEY,
		DER_CERTIFICATE_X509,
		DER_PKCS7,
		DER_PKCS8,
		DER_PKCS8_PLAIN,
		DER_PKCS8_ENCRYPTED,
		DER_PKCS10,
		DER_SPKAC,
		BASE64_SPKAC,
		DER_PKCS12,
		OPENSSH_PUBLIC,
		OPENPGP_PACKET,
		OPENPGP_ARMOR,
		PEM,
		PEM_PRIVATE_KEY_RSA,
		PEM_PRIVATE_KEY_DSA,
		PEM_CERTIFICATE_X509,
		PEM_PKCS7,
		PEM_PKCS8_PLAIN,
		PEM_PKCS8_ENCRYPTED,
		PEM_PKCS12,
		PEM_PRIVATE_KEY,
		PEM_PKCS10,
		PEM_PRIVATE_KEY_EC,
		PEM_PUBLIC_KEY
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_PROMPT_REPLY_", has_type_id = false)]
	public enum PromptReply {
		CANCEL,
		CONTINUE
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_SYSTEM_PROMPT_IN_", has_type_id = false)]
	public enum SystemPromptError {
		[CCode (cname = "GCR_SYSTEM_PROMPT_IN_PROGRESS")]
		SYSTEM_PROMPT_IN_PROGRESS
	}
	[CCode (cheader_filename = "gcr/gcr.h", cprefix = "GCR_SYSTEM_PROMPTER_", has_type_id = false)]
	public enum SystemPrompterMode {
		SINGLE,
		MULTIPLE
	}
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_MAJOR_VERSION")]
	public const int MAJOR_VERSION;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_MICRO_VERSION")]
	public const int MICRO_VERSION;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_MINOR_VERSION")]
	public const int MINOR_VERSION;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_PURPOSE_CLIENT_AUTH")]
	public const string PURPOSE_CLIENT_AUTH;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_PURPOSE_CODE_SIGNING")]
	public const string PURPOSE_CODE_SIGNING;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_PURPOSE_EMAIL")]
	public const string PURPOSE_EMAIL;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_PURPOSE_SERVER_AUTH")]
	public const string PURPOSE_SERVER_AUTH;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_SECRET_EXCHANGE_PROTOCOL_1")]
	public const string SECRET_EXCHANGE_PROTOCOL_1;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_UNLOCK_OPTION_ALWAYS")]
	public const string UNLOCK_OPTION_ALWAYS;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_UNLOCK_OPTION_IDLE")]
	public const string UNLOCK_OPTION_IDLE;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_UNLOCK_OPTION_SESSION")]
	public const string UNLOCK_OPTION_SESSION;
	[CCode (cheader_filename = "gcr/gcr.h", cname = "GCR_UNLOCK_OPTION_TIMEOUT")]
	public const string UNLOCK_OPTION_TIMEOUT;
	[CCode (array_length_pos = 2.1, array_length_type = "gsize", cheader_filename = "gcr/gcr.h")]
	public static uint8[]? fingerprint_from_attributes (Gck.Attributes attrs, GLib.ChecksumType checksum_type);
	[CCode (array_length_pos = 2.1, array_length_type = "gsize", cheader_filename = "gcr/gcr.h")]
	public static uint8[]? fingerprint_from_subject_public_key_info ([CCode (array_length_cname = "n_key_info", array_length_pos = 1.5, array_length_type = "gsize")] uint8[] key_info, GLib.ChecksumType checksum_type);
	[CCode (cheader_filename = "gcr/gcr.h")]
	[Version (replacement = "Importer.create_for_parsed")]
	public static GLib.List<Gcr.Importer> importer_create_for_parsed (Gcr.Parsed parsed);
	[CCode (cheader_filename = "gcr/gcr.h")]
	[Version (replacement = "Importer.queue_and_filter_for_parsed")]
	public static GLib.List<Gcr.Importer> importer_queue_and_filter_for_parsed (GLib.List<Gcr.Importer> importers, Gcr.Parsed parsed);
	[CCode (cheader_filename = "gcr/gcr.h")]
	[Version (replacement = "Importer.register")]
	public static void importer_register (GLib.Type importer_type, owned Gck.Attributes attrs);
	[CCode (cheader_filename = "gcr/gcr.h")]
	[Version (replacement = "Importer.register_well_known")]
	public static void importer_register_well_known ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void mock_prompter_disconnect ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void mock_prompter_expect_close ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void mock_prompter_expect_confirm_cancel ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void mock_prompter_expect_password_cancel ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static uint mock_prompter_get_delay_msec ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool mock_prompter_is_expecting ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool mock_prompter_is_prompting ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void mock_prompter_set_delay_msec (uint delay_msec);
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static unowned string mock_prompter_start ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void mock_prompter_stop ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	[Version (replacement = "Parsed.unref")]
	public static void parsed_unref (void* parsed);
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void pkcs11_add_module (Gck.Module module);
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool pkcs11_add_module_from_file (string module_path, void* unused) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static GLib.List<Gck.Module> pkcs11_get_modules ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static GLib.List<Gck.Slot> pkcs11_get_trust_lookup_slots ();
	[CCode (array_length = false, array_null_terminated = true, cheader_filename = "gcr/gcr.h")]
	public static unowned string[]? pkcs11_get_trust_lookup_uris ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static Gck.Slot? pkcs11_get_trust_store_slot ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static unowned string? pkcs11_get_trust_store_uri ();
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool pkcs11_initialize (GLib.Cancellable? cancellable = null) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static async bool pkcs11_initialize_async (GLib.Cancellable? cancellable) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void pkcs11_set_modules (GLib.List<Gck.Module> modules);
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void pkcs11_set_trust_lookup_uris (string? pkcs11_uris);
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static void pkcs11_set_trust_store_uri (string? pkcs11_uri);
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool trust_add_pinned_certificate (Gcr.Certificate certificate, string purpose, string peer, GLib.Cancellable? cancellable = null) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static async bool trust_add_pinned_certificate_async (Gcr.Certificate certificate, string purpose, string peer, GLib.Cancellable? cancellable) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool trust_is_certificate_anchored (Gcr.Certificate certificate, string purpose, GLib.Cancellable? cancellable = null) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static async bool trust_is_certificate_anchored_async (Gcr.Certificate certificate, string purpose, GLib.Cancellable? cancellable) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool trust_is_certificate_distrusted ([CCode (array_length_cname = "serial_nr_len", array_length_pos = 1.5, array_length_type = "gsize")] uint8[] serial_nr, [CCode (array_length_cname = "issuer_len", array_length_pos = 2.5, array_length_type = "gsize")] uint8[] issuer, GLib.Cancellable? cancellable = null) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static async bool trust_is_certificate_distrusted_async ([CCode (array_length_cname = "serial_nr_len", array_length_pos = 1.5, array_length_type = "gsize")] uint8[] serial_nr, [CCode (array_length_cname = "issuer_len", array_length_pos = 2.5, array_length_type = "gsize")] uint8[] issuer, GLib.Cancellable? cancellable) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool trust_is_certificate_pinned (Gcr.Certificate certificate, string purpose, string peer, GLib.Cancellable? cancellable = null) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static async bool trust_is_certificate_pinned_async (Gcr.Certificate certificate, string purpose, string peer, GLib.Cancellable? cancellable) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static bool trust_remove_pinned_certificate (Gcr.Certificate certificate, string purpose, string peer, GLib.Cancellable? cancellable = null) throws GLib.Error;
	[CCode (cheader_filename = "gcr/gcr.h")]
	public static async bool trust_remove_pinned_certificate_async (Gcr.Certificate certificate, string purpose, string peer, GLib.Cancellable? cancellable) throws GLib.Error;
}
