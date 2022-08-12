//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/pipe_accesory_simple_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'used_with_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UsedWithDto {
  /// Returns a new [UsedWithDto] instance.
  UsedWithDto({

     this.accessory,

     this.usedCount,
  });

  @JsonKey(
    
    name: r'Accessory',
    required: false,
    includeIfNull: false
  )


  PipeAccesorySimpleDto? accessory;



  @JsonKey(
    
    name: r'UsedCount',
    required: false,
    includeIfNull: false
  )


  int? usedCount;



  @override
  bool operator ==(Object other) => identical(this, other) || other is UsedWithDto &&
     other.accessory == accessory &&
     other.usedCount == usedCount;

  @override
  int get hashCode =>
    accessory.hashCode +
    usedCount.hashCode;

  factory UsedWithDto.fromJson(Map<String, dynamic> json) => _$UsedWithDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsedWithDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

