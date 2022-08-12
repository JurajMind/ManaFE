//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'seat_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SeatDto {
  /// Returns a new [SeatDto] instance.
  SeatDto({

     this.id,

     this.name,

     this.code,

     this.capacity,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'Code',
    required: false,
    includeIfNull: false
  )


  String? code;



  @JsonKey(
    
    name: r'Capacity',
    required: false,
    includeIfNull: false
  )


  int? capacity;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SeatDto &&
     other.id == id &&
     other.name == name &&
     other.code == code &&
     other.capacity == capacity;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    code.hashCode +
    capacity.hashCode;

  factory SeatDto.fromJson(Map<String, dynamic> json) => _$SeatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SeatDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

