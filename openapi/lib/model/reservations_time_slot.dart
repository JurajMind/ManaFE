//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ReservationsTimeSlot {
  /// Returns a new [ReservationsTimeSlot] instance.
  ReservationsTimeSlot({
    this.value,
    this.text,
    this.reserved,
    this.capacityLeft,
    this.tablesLeft,
    this.maxTable,
    this.id,
    this.orderIndex,
  });

  int value;

  String text;

  bool reserved;

  int capacityLeft;

  int tablesLeft;

  int maxTable;

  int id;

  int orderIndex;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ReservationsTimeSlot &&
     other.value == value &&
     other.text == text &&
     other.reserved == reserved &&
     other.capacityLeft == capacityLeft &&
     other.tablesLeft == tablesLeft &&
     other.maxTable == maxTable &&
     other.id == id &&
     other.orderIndex == orderIndex;

  @override
  int get hashCode =>
    (value == null ? 0 : value.hashCode) +
    (text == null ? 0 : text.hashCode) +
    (reserved == null ? 0 : reserved.hashCode) +
    (capacityLeft == null ? 0 : capacityLeft.hashCode) +
    (tablesLeft == null ? 0 : tablesLeft.hashCode) +
    (maxTable == null ? 0 : maxTable.hashCode) +
    (id == null ? 0 : id.hashCode) +
    (orderIndex == null ? 0 : orderIndex.hashCode);

  @override
  String toString() => 'ReservationsTimeSlot[value=$value, text=$text, reserved=$reserved, capacityLeft=$capacityLeft, tablesLeft=$tablesLeft, maxTable=$maxTable, id=$id, orderIndex=$orderIndex]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (value != null) {
      json[r'Value'] = value;
    }
    if (text != null) {
      json[r'Text'] = text;
    }
    if (reserved != null) {
      json[r'Reserved'] = reserved;
    }
    if (capacityLeft != null) {
      json[r'CapacityLeft'] = capacityLeft;
    }
    if (tablesLeft != null) {
      json[r'TablesLeft'] = tablesLeft;
    }
    if (maxTable != null) {
      json[r'MaxTable'] = maxTable;
    }
    if (id != null) {
      json[r'Id'] = id;
    }
    if (orderIndex != null) {
      json[r'OrderIndex'] = orderIndex;
    }
    return json;
  }

  /// Returns a new [ReservationsTimeSlot] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ReservationsTimeSlot fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ReservationsTimeSlot(
        value: json[r'Value'],
        text: json[r'Text'],
        reserved: json[r'Reserved'],
        capacityLeft: json[r'CapacityLeft'],
        tablesLeft: json[r'TablesLeft'],
        maxTable: json[r'MaxTable'],
        id: json[r'Id'],
        orderIndex: json[r'OrderIndex'],
    );

  static List<ReservationsTimeSlot> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ReservationsTimeSlot>[]
      : json.map((v) => ReservationsTimeSlot.fromJson(v)).toList(growable: true == growable);

  static Map<String, ReservationsTimeSlot> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ReservationsTimeSlot>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ReservationsTimeSlot.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ReservationsTimeSlot-objects as value to a dart map
  static Map<String, List<ReservationsTimeSlot>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ReservationsTimeSlot>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ReservationsTimeSlot.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

