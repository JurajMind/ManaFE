//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_redis_competition_entry.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsRedisCompetitionEntry {
  /// Returns a new [SmartHookahModelsRedisCompetitionEntry] instance.
  SmartHookahModelsRedisCompetitionEntry({

     this.name,

     this.time,
  });

  @JsonKey(
    
    name: r'Name',
    required: false,
    includeIfNull: false
  )


  String? name;



  @JsonKey(
    
    name: r'Time',
    required: false,
    includeIfNull: false
  )


  double? time;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsRedisCompetitionEntry &&
     other.name == name &&
     other.time == time;

  @override
  int get hashCode =>
    name.hashCode +
    time.hashCode;

  factory SmartHookahModelsRedisCompetitionEntry.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsRedisCompetitionEntryFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsRedisCompetitionEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

