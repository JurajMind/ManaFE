//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_db_puf.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsDbPuf {
  /// Returns a new [SmartHookahModelsDbPuf] instance.
  SmartHookahModelsDbPuf({

     this.sId,

     this.T,

     this.D,

     this.M,

     this.P,
  });

  @JsonKey(
    
    name: r'SId',
    required: false,
    includeIfNull: false
  )


  String? sId;



  @JsonKey(
    
    name: r'T',
    required: false,
    includeIfNull: false
  )


  SmartHookahModelsDbPufTEnum? T;



  @JsonKey(
    
    name: r'D',
    required: false,
    includeIfNull: false
  )


  DateTime? D;



  @JsonKey(
    
    name: r'M',
    required: false,
    includeIfNull: false
  )


  int? M;



  @JsonKey(
    
    name: r'P',
    required: false,
    includeIfNull: false
  )


  int? P;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbPuf &&
     other.sId == sId &&
     other.T == T &&
     other.D == D &&
     other.M == M &&
     other.P == P;

  @override
  int get hashCode =>
    sId.hashCode +
    T.hashCode +
    D.hashCode +
    M.hashCode +
    P.hashCode;

  factory SmartHookahModelsDbPuf.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsDbPufFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsDbPufToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmartHookahModelsDbPufTEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
}


