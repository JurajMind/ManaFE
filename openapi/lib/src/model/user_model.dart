//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserModel {
  /// Returns a new [UserModel] instance.
  UserModel({

     this.confirmPassword,

    required  this.password,

     this.userName,

    required  this.email,
  });

  @JsonKey(
    
    name: r'ConfirmPassword',
    required: false,
    includeIfNull: false
  )


  String? confirmPassword;



  @JsonKey(
    
    name: r'Password',
    required: true,
    includeIfNull: false
  )


  String password;



  @JsonKey(
    
    name: r'UserName',
    required: false,
    includeIfNull: false
  )


  String? userName;



  @JsonKey(
    
    name: r'Email',
    required: true,
    includeIfNull: false
  )


  String email;



  @override
  bool operator ==(Object other) => identical(this, other) || other is UserModel &&
     other.confirmPassword == confirmPassword &&
     other.password == password &&
     other.userName == userName &&
     other.email == email;

  @override
  int get hashCode =>
    confirmPassword.hashCode +
    password.hashCode +
    userName.hashCode +
    email.hashCode;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

