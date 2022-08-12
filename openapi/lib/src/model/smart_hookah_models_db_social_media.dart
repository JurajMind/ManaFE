//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_db_social_media.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsDbSocialMedia {
  /// Returns a new [SmartHookahModelsDbSocialMedia] instance.
  SmartHookahModelsDbSocialMedia({

     this.id,

     this.code,

     this.url,
  });

  @JsonKey(
    
    name: r'Id',
    required: false,
    includeIfNull: false
  )


  int? id;



  @JsonKey(
    
    name: r'Code',
    required: false,
    includeIfNull: false
  )


  String? code;



  @JsonKey(
    
    name: r'Url',
    required: false,
    includeIfNull: false
  )


  String? url;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsDbSocialMedia &&
     other.id == id &&
     other.code == code &&
     other.url == url;

  @override
  int get hashCode =>
    id.hashCode +
    code.hashCode +
    url.hashCode;

  factory SmartHookahModelsDbSocialMedia.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsDbSocialMediaFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsDbSocialMediaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

