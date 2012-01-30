/*-*- Mode: C; c-basic-offset: 8 -*-*/

/***
    This file is part of libatasmart.

    Copyright 2008 Lennart Poettering

    libatasmart is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as
    published by the Free Software Foundation, either version 2.1 of the
    License, or (at your option) any later version.

    libatasmart is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with libatasmart. If not, If not, see
    <http://www.gnu.org/licenses/>.
***/

using GLib;

[CCode (cheader_filename="atasmart.h")]
namespace AtaSmart {

        [CCode (cname="SkSmartSelfTest", cprefix="SK_SMART_SELF_TEST_")]
        public enum SmartSelfTest {
                SHORT, EXTENDED, CONVEYANCE, ABORT;

                [CCode (cname="sk_smart_self_test_to_string")]
                public unowned string? to_string();
        }

        [Immutable]
        [CCode (cname="SkIdentifyParsedData")]
        public struct IdentifyParsedData {
                public string serial;
                public string firmware;
                public string model;
        }

        [CCode (cname="SkSmartOfflineDataCollectionStatus", cprefix="SK_SMART_OFFLINE_DATA_COLLECTION_STATUS_")]
        public enum SmartOfflineDataCollectionStatus {
                NEVER, SUCCESS, INPROGRESS, SUSPENDED, ABORTED, FATAL, UNKNOWN;

                [CCode (cname="sk_smart_offline_data_collection_status_to_string")]
                public unowned string? to_string();
        }

        [CCode (cname="SkSmartSelfTestExecutionStatus", cprefix="SK_SMART_SELF_TEST_EXECUTION_STATUS_")]
        public enum SmartSelfTestExecutionStatus {
                SUCCESS_OR_NEVER, ABORTED, INTERRUPTED, FATAL, ERROR_UNKNOWN, ERROR_ELECTRICAL, ERROR_SERVO, ERROR_READ, ERROR_HANDLING, INPROGRESS;

                [CCode (cname="sk_smart_self_test_execution_status_to_string")]
                public unowned string? to_string();
        }

        [Immutable]
        [CCode (cname="SkSmartParsedData")]
        public struct SmartParsedData {
                public SmartOfflineDataCollectionStatus offline_data_collection_status;
                public uint total_offline_data_collection_seconds;
                public SmartSelfTestExecutionStatus self_test_execution_status;
                public uint self_test_execution_percent_remaining;

                public bool conveyance_test_available;
                public bool short_and_extended_test_available;
                public bool start_test_available;
                public bool abort_test_available;

                public uint short_test_polling_minutes;
                public uint extended_test_polling_minutes;
                public uint conveyance_test_polling_minutes;

                [CCode (cname="sk_smart_self_test_available")]
                public bool self_test_available(SmartSelfTest test);

                [CCode (cname="sk_smart_self_test_polling_minutes")]
                public uint self_test_polling_minutes(SmartSelfTest test);
        }

        [CCode (cname="SkSmartAttributeUnit", cprefix="SK_SMART_ATTRIBUTE_UNIT_")]
        public enum SmartAttributeUnit {
                UNKNOWN, NONE, MSECONDS, SECTORS, MKELVIN;

                [CCode (cname="sk_smart_attribute_unit_to_string")]
                public unowned string? to_string();
        }

        [Immutable]
        [CCode (cname="SkSmartAttributeParsedData")]
        public struct SmartAttributeParsedData {
                public uint8 id;
                public string name;
                public SmartAttributeUnit pretty_unit;
                public uint16 flags;
                public uint8 threshold;
                public bool threshold_valid;
                public bool online;
                public bool prefailure;
                public bool good_now;
                public bool good_now_valid;
                public bool good_in_the_past;
                public bool good_in_the_past_valid;
                public bool current_value_valid;
                public bool worst_value_valid;
                public bool warn;
                public uint8 current_value;
                public uint8 worst_value;
                public uint64 pretty_value;
                public uint8[] raw;
        }

        [CCode (cname="SkSmartOverall", cprefix="SK_SMART_OVERALL_")]
        public enum SmartOverall {
                GOOD, BAD_ATTRIBUTE_IN_THE_PAST, BAD_SECTOR, BAD_ATTRIBUTE_NOW, BAD_SECTOR_MANY, BAD_STATUS;

                [CCode (cname="sk_smart_overall_to_string")]
                public unowned string? to_string();
        }

        [CCode (cname="SkSmartAttributeParseCallback")]
        public delegate void SmartAttributeParseCallback(Disk disk, SmartAttributeParsedData a);

        [Compact]
        [CCode (free_function="sk_disk_free", cname="SkDisk", cprefix="sk_disk_")]
        public class Disk {

                public static int open(string name, out Disk? disk);

                public int get_size(out uint64 bytes);

                public int check_sleep_mode(out bool awake);

                public int identify_is_available(out bool available);
                public int identify_parse(out unowned IdentifyParsedData* data);

                public int smart_is_available(out bool available);
                public int smart_status(out bool good);
                public int smart_read_data();
                public int smart_get_blob(out unowned void* blob, out size_t size);
                public int smart_set_blob(void* blob, size_t size);
                public int smart_parse_attributes(SmartAttributeParseCallback cb);
                public int smart_parse(out unowned SmartParsedData* data);
                public int smart_self_test(SmartSelfTest test);
                public int smart_get_power_on(out uint64 mseconds);
                public int smart_get_power_cycle(out uint64 count);
                public int smart_get_bad(out uint64 sectors);
                public int smart_get_temperature(out uint64 mkelvin);
                public int smart_get_overall(out SmartOverall overall);

                public int dump();
        }
}
