//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'pipe_accessory_usage_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PipeAccessoryUsageDto {
  /// Returns a new [PipeAccessoryUsageDto] instance.
  PipeAccessoryUsageDto({

     this.id,

     this.brandName,

     this.accName,

     this.type,

     this.used,

     this.owned,

     this.inMix,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'BrandName',
    required: false,
    includeIfNull: false
  )


  String? brandName;



  @JsonKey(
    
    name: r'AccName',
    required: false,
    includeIfNull: false
  )


  String? accName;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  String? type;



  @JsonKey(
    
    name: r'Used',
    required: false,
    includeIfNull: false
  )


  int? used;



  @JsonKey(
    
    name: r'Owned',
    required: false,
    includeIfNull: false
  )


  bool? owned;



  @JsonKey(
    
    name: r'InMix',
    required: false,
    includeIfNull: false
  )


  int? inMix;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PipeAccessoryUsageDto &&
     other.id == id &&
     other.brandName == brandName &&
     other.accName == accName &&
     other.type == type &&
     other.used == used &&
     other.owned == owned &&
     other.inMix == inMix;

  @override
  int get hashCode =>
    id.hashCode +
    brandName.hashCode +
    accName.hashCode +
    type.hashCode +
    used.hashCode +
    owned.hashCode +
    inMix.hashCode;

  factory PipeAccessoryUsageDto.fromJson(Map<String, dynamic> json) => _$PipeAccessoryUsageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PipeAccessoryUsageDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

