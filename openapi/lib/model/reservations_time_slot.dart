part of openapi.api;

class ReservationsTimeSlot {
  
  int value = null;
  
  String text = null;
  
  bool reserved = null;
  
  int capacityLeft = null;
  
  int maxTable = null;
  
  int id = null;
  
  int orderIndex = null;
  ReservationsTimeSlot();

  @override
  String toString() {
    return 'ReservationsTimeSlot[value=$value, text=$text, reserved=$reserved, capacityLeft=$capacityLeft, maxTable=$maxTable, id=$id, orderIndex=$orderIndex, ]';
  }

  ReservationsTimeSlot.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    value = json['Value'];
    text = json['Text'];
    reserved = json['Reserved'];
    capacityLeft = json['CapacityLeft'];
    maxTable = json['MaxTable'];
    id = json['Id'];
    orderIndex = json['OrderIndex'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Value': value,
      'Text': text,
      'Reserved': reserved,
      'CapacityLeft': capacityLeft,
      'MaxTable': maxTable,
      'Id': id,
      'OrderIndex': orderIndex
    };
  }

  static List<ReservationsTimeSlot> listFromJson(List<dynamic> json) {
    return json == null ? new List<ReservationsTimeSlot>() : json.map((value) => new ReservationsTimeSlot.fromJson(value)).toList();
  }

  static Map<String, ReservationsTimeSlot> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ReservationsTimeSlot>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ReservationsTimeSlot.fromJson(value));
    }
    return map;
  }
}

