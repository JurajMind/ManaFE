//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'search_pipe_accessory.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchPipeAccessory {
  /// Returns a new [SearchPipeAccessory] instance.
  SearchPipeAccessory({

     this.id,

     this.name,

     this.brand,

     this.type,

     this.nonVerified,
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
    
    name: r'Brand',
    required: false,
    includeIfNull: false
  )


  String? brand;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  String? type;



  @JsonKey(
    
    name: r'NonVerified',
    required: false,
    includeIfNull: false
  )


  bool? nonVerified;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchPipeAccessory &&
     other.id == id &&
     other.name == name &&
     other.brand == brand &&
     other.type == type &&
     other.nonVerified == nonVerified;

  @override
  int get hashCode =>
    id.hashCode +
    name.hashCode +
    brand.hashCode +
    type.hashCode +
    nonVerified.hashCode;

  factory SearchPipeAccessory.fromJson(Map<String, dynamic> json) => _$SearchPipeAccessoryFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPipeAccessoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

