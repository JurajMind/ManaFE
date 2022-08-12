//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_services_gear_tobacco_filter.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahServicesGearTobaccoFilter {
  /// Returns a new [SmartHookahServicesGearTobaccoFilter] instance.
  SmartHookahServicesGearTobaccoFilter({

     this.tastes,

     this.sortBy,

     this.brand,

     this.owned,

     this.smoked,

     this.sortDirection,
  });

  @JsonKey(
    
    name: r'Tastes',
    required: false,
    includeIfNull: false
  )


  List<int>? tastes;



  @JsonKey(
    
    name: r'SortBy',
    required: false,
    includeIfNull: false
  )


  SmartHookahServicesGearTobaccoFilterSortByEnum? sortBy;



  @JsonKey(
    
    name: r'Brand',
    required: false,
    includeIfNull: false
  )


  String? brand;



  @JsonKey(
    
    name: r'Owned',
    required: false,
    includeIfNull: false
  )


  bool? owned;



  @JsonKey(
    
    name: r'Smoked',
    required: false,
    includeIfNull: false
  )


  bool? smoked;



  @JsonKey(
    
    name: r'SortDirection',
    required: false,
    includeIfNull: false
  )


  SmartHookahServicesGearTobaccoFilterSortDirectionEnum? sortDirection;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahServicesGearTobaccoFilter &&
     other.tastes == tastes &&
     other.sortBy == sortBy &&
     other.brand == brand &&
     other.owned == owned &&
     other.smoked == smoked &&
     other.sortDirection == sortDirection;

  @override
  int get hashCode =>
    tastes.hashCode +
    sortBy.hashCode +
    brand.hashCode +
    owned.hashCode +
    smoked.hashCode +
    sortDirection.hashCode;

  factory SmartHookahServicesGearTobaccoFilter.fromJson(Map<String, dynamic> json) => _$SmartHookahServicesGearTobaccoFilterFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahServicesGearTobaccoFilterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SmartHookahServicesGearTobaccoFilterSortByEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
  @JsonValue(2)
  number2,
  @JsonValue(3)
  number3,
  @JsonValue(4)
  number4,
}



enum SmartHookahServicesGearTobaccoFilterSortDirectionEnum {
  @JsonValue(0)
  number0,
  @JsonValue(1)
  number1,
}


