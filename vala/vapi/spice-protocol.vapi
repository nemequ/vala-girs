namespace SpiceProtocol {
	[CCode (cprefix = "Controller", cheader_filename = "spice/controller_prot.h")]
	namespace Controller {
		[CCode (cname = "CONTROLLER_MAGIC")]
		public const uint32 MAGIC;
		[CCode (cname = "CONTROLLER_VERSION")]
		public const int VERSION;

		[Compact]
		public struct InitHeader {
			uint32 magic;
			uint32 version;
			uint32 size;
		}

		[Compact]
		public struct Init {
			InitHeader base;
			uint64 credentials;
			uint32 flags;
		}

		[CCode (cprefix = "CONTROLLER_FLAG_")]
		[Flags]
		public enum Flag {
			EXCLUSIVE,
		}

		[Compact]
		public struct Msg {
			uint32 id;
			uint32 size;
		}

		[CCode (cprefix = "CONTROLLER_")]
		public enum MsgId {
			//external app -> spice client
			HOST,
			PORT,
			SPORT,
			PASSWORD,

			SECURE_CHANNELS,
			DISABLE_CHANNELS,

			TLS_CIPHERS,
			CA_FILE,
			HOST_SUBJECT,

			FULL_SCREEN,
			SET_TITLE,

			CREATE_MENU,
			DELETE_MENU,

			HOTKEYS,
			SEND_CAD,

			CONNECT,
			SHOW,
			HIDE,

			ENABLE_SMARTCARD,

			ENABLE_USB,
			ENABLE_USB_AUTOSHARE,
			USB_FILTER,

			PROXY,

			//spice client -> external app
			MENU_ITEM_CLICK,

			COLOR_DEPTH,
			DISABLE_EFFECTS,
		}

		[CCode (cname = "unsigned int", cprefix = "CONTROLLER_", has_type_id = false)]
		[Flags]
		public enum Display {
			SET_FULL_SCREEN,
			AUTO_DISPLAY_RES,
		}

		[Compact]
		[CCode (cname = "ControllerValue")]
		public struct MsgValue: Msg {
			Msg base;
			uint32 value;
		}

		[Compact]
		[CCode (cname = "ControllerData")]
		public struct MsgData {
			Msg base;
			uint8 data[0];
		}

		[CCode (cname = "CONTROLLER_MENU_ITEM_DELIMITER")]
		public static string MENU_ITEM_DELIMITER;
		[CCode (cname = "CONTROLLER_MENU_PARAM_DELIMITER")]
		public static string MENU_PARAM_DELIMITER;

		[CCode (cname = "SPICE_MENU_INTERNAL_ID_BASE")]
		public static int MENU_INTERNAL_ID_BASE;
		[CCode (cname = "SPICE_MENU_INTERNAL_ID_SHIFT")]
		public static int MENU_INTERNAL_ID_SHIFT;

		[CCode (cprefix = "CONTROLLER_MENU_FLAGS_", cname = "unsigned int", has_type_id = false)]
		[Flags]
		public enum MenuFlags {
			SEPARATOR,
			DISABLED,
			POPUP,
			CHECKED,
			GRAYED,
		}
	}

    [CCode (cprefix = "FrgMenu", cheader_filename = "spice/foreign_menu_prot.h")]
    namespace ForeignMenu {
        [CCode (cname = "FOREIGN_MENU_MAGIC")]
        public const uint32 MAGIC;
        [CCode (cname = "FOREIGN_MENU_VERSION")]
        public const int VERSION;

        [Compact]
        public struct InitHeader {
            uint32 magic;
            uint32 version;
            uint32 size;
        }

        [Compact]
        [CCode (has_destroy_function = false)]
        public struct Init {
            InitHeader base;
            uint64 credentials;
            string title; // utf8
        }

        [Compact]
        public struct Msg {
            uint32 id;
            uint32 size;
        }

        [CCode (cprefix = "FOREIGN_MENU_", cname = "int")]
        public enum MsgId {
            //external app -> spice client
            SET_TITLE,
            ADD_ITEM,
            MODIFY_ITEM,
            REMOVE_ITEM,
            CLEAR,

            //spice client -> external app
            ITEM_EVENT,
            APP_ACTIVATED,
            APP_DEACTIVATED,
        }

        [Compact]
        [CCode (cname = "FrgMenuSetTitle")]
        public struct SetTitle {
            Msg base;
            string string; // utf8
        }

        [CCode (cprefix = "FOREIGN_MENU_ITEM_TYPE_", cname = "unsigned int", has_type_id = false)]
        [Flags]
        public enum MenuFlags {
            CHECKED,
            DIM,
            SEPARATOR
        }

        [Compact]
        [CCode (cname = "FrgMenuAddItem")]
        public struct AddItem {
            Msg base;
            uint32 id;
            uint32 type;
            uint32 position;
            string string; // utf8
        }

        [Compact]
        [CCode (cname = "FrgMenuRmItem")]
        public struct RmItem {
            Msg base;
            uint32 id;
        }

        [CCode (cprefix = "FOREIGN_MENU_EVENT_", cname = "int")]
        public enum EventType {
            CLICK,
            CHECKED,
            UNCHECKED,
        }

        [Compact]
        [CCode (cname = "FrgMenuEvent")]
        public struct Event {
            Msg base;
            uint32 id;
            uint32 action;
        }
    }
}
