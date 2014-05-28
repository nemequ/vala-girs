/*
 * Copyright (C) 2014, Carlos Garnacho <carlosg@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301, USA.
 */

[CCode (cprefix = "Tracker", lower_case_cprefix = "tracker_")]
namespace Tracker {
	[CCode (cheader_filename = "libtracker-control/tracker-control.h")]
	public class MinerManager : GLib.Object, GLib.Initable {
		[CCode (has_construct_function = false)]
		public MinerManager ();
		public unowned GLib.SList get_available ();
		public unowned string get_description (string miner);
		public unowned string get_display_name (string miner);
		public unowned GLib.SList get_running ();
		public bool get_status (string miner, string status, double progress);
		public bool ignore_next_update (string miner, string urls);
		public bool is_active (string miner);
		public bool is_paused (string miner, string[] applications, string[] reasons);
		public bool pause (string miner, string reason, uint32 cookie);
		public bool resume (string miner, uint32 cookie);
		public virtual void miner_activated (string miner_name);
		public virtual void miner_deactivated (string miner_name);
		public virtual void miner_paused (string miner_name);
		public virtual void miner_resumed (string miner_name);
		public virtual void miner_progress (string miner_name, string status, double progress);
	}
}
