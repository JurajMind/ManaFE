part of openapi.api;

class ReservationsTimeSlot {
  
  int value = null;
  
  String text = null;
  
  bool reserved = null;
  
  int capacityLeft = null;
  
  int tablesLeft = null;
  
  int maxTable = null;
  
  int id = null;
  
  int orderIndex = null;
  ReservationsTimeSlot();

  @override
  String toString() {
    return 'ReservationsTimeSlot[value=$value, text=$text, reserved=$reserved, capacityLeft=$capacityLeft, tablesLeft=$tablesLeft, maxTable=$maxTable, id=$id, orderIndex=$orderIndex, ]';
  }

  ReservationsTimeSlot.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Value'] == null) {
      value = null;
    } else {
          value = json['Value'];
    }
    if (json['Text'] == null) {
      text = null;
    } else {
          text = json['Text'];
    }
    if (json['Reserved'] == null) {
      reserved = null;
    } else {
          reserved = json['Reserved'];
    }
    if (json['CapacityLeft'] == null) {
      capacityLeft = null;
    } else {
          capacityLeft = json['CapacityLeft'];
    }
    if (json['TablesLeft'] == null) {
      tablesLeft = null;
    } else {
          tablesLeft = json['TablesLeft'];
    }
    if (json['MaxTable'] == null) {
      maxTable = null;
    } else {
          maxTable = json['MaxTable'];
    }
    if (json['Id'] == null) {
      id = null;
    } else {
          id = json['Id'];
    }
    if (json['OrderIndex'] == null) {
      orderIndex = null;
    } else {
          orderIndex = json['OrderIndex'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (value != null)
      json['Value'] = value;
    if (text != null)
      json['Text'] = text;
    if (reserved != null)
      json['Reserved'] = reserved;
    if (capacityLeft != null)
      json['CapacityLeft'] = capacityLeft;
    if (tablesLeft != null)
      json['TablesLeft'] = tablesLeft;
    if (maxTable != null)
      json['MaxTable'] = maxTable;
    if (id != null)
      json['Id'] = id;
    if (orderIndex != null)
      json['OrderIndex'] = orderIndex;
    return json;
  }

  static List<ReservationsTimeSlot> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReservationsTimeSlot>() : json.map((value) => new ReservationsTimeSlot.fromJson(value)).toList();
  }

  static Map<String, ReservationsTimeSlot> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ReservationsTimeSlot>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new ReservationsTimeSlot.fromJson(value));
    }
    return map;
  }
}

