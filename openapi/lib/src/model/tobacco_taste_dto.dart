//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'tobacco_taste_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TobaccoTasteDto {
  /// Returns a new [TobaccoTasteDto] instance.
  TobaccoTasteDto({

     this.czName,

     this.engName,

     this.id,

     this.originalName,
  });

  @JsonKey(
    
    name: r'CzName',
    required: false,
    includeIfNull: false
  )


  String? czName;



  @JsonKey(
    
    name: r'EngName',
    required: false,
    includeIfNull: false
  )


  String? engName;



  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'OriginalName',
    required: false,
    includeIfNull: false
  )


  String? originalName;



  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoTasteDto &&
     other.czName == czName &&
     other.engName == engName &&
     other.id == id &&
     other.originalName == originalName;

  @override
  int get hashCode =>
    czName.hashCode +
    engName.hashCode +
    id.hashCode +
    originalName.hashCode;

  factory TobaccoTasteDto.fromJson(Map<String, dynamic> json) => _$TobaccoTasteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TobaccoTasteDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

