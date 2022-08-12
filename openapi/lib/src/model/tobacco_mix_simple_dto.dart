//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/pipe_accesory_like_dto.dart';
import 'package:openapi/src/model/tobacco_in_mix.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tobacco_mix_simple_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TobaccoMixSimpleDto {
  /// Returns a new [TobaccoMixSimpleDto] instance.
  TobaccoMixSimpleDto({

     this.likes,

     this.tobaccos,

     this.myMix,

     this.id,

     this.name,

     this.brand,

     this.brandId,

     this.picture,

     this.type,

     this.likeCount,

     this.disLikeCount,
  });

  @JsonKey(
    
    name: r'Likes',
    required: false,
    includeIfNull: false
  )


  List<PipeAccesoryLikeDto>? likes;



  @JsonKey(
    
    name: r'Tobaccos',
    required: false,
    includeIfNull: false
  )


  List<TobaccoInMix>? tobaccos;



  @JsonKey(
    
    name: r'MyMix',
    required: false,
    includeIfNull: false
  )


  bool? myMix;



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
    
    name: r'BrandId',
    required: false,
    includeIfNull: false
  )


  String? brandId;



  @JsonKey(
    
    name: r'Picture',
    required: false,
    includeIfNull: false
  )


  String? picture;



  @JsonKey(
    
    name: r'Type',
    required: false,
    includeIfNull: false
  )


  String? type;



  @JsonKey(
    
    name: r'LikeCount',
    required: false,
    includeIfNull: false
  )


  int? likeCount;



  @JsonKey(
    
    name: r'DisLikeCount',
    required: false,
    includeIfNull: false
  )


  int? disLikeCount;



  @override
  bool operator ==(Object other) => identical(this, other) || other is TobaccoMixSimpleDto &&
     other.likes == likes &&
     other.tobaccos == tobaccos &&
     other.myMix == myMix &&
     other.id == id &&
     other.name == name &&
     other.brand == brand &&
     other.brandId == brandId &&
     other.picture == picture &&
     other.type == type &&
     other.likeCount == likeCount &&
     other.disLikeCount == disLikeCount;

  @override
  int get hashCode =>
    likes.hashCode +
    tobaccos.hashCode +
    myMix.hashCode +
    id.hashCode +
    name.hashCode +
    brand.hashCode +
    brandId.hashCode +
    picture.hashCode +
    type.hashCode +
    likeCount.hashCode +
    disLikeCount.hashCode;

  factory TobaccoMixSimpleDto.fromJson(Map<String, dynamic> json) => _$TobaccoMixSimpleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TobaccoMixSimpleDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

