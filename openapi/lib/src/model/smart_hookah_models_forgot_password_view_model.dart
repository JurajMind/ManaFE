//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'smart_hookah_models_forgot_password_view_model.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SmartHookahModelsForgotPasswordViewModel {
  /// Returns a new [SmartHookahModelsForgotPasswordViewModel] instance.
  SmartHookahModelsForgotPasswordViewModel({

    required  this.email,
  });

  @JsonKey(
    
    name: r'Email',
    required: true,
    includeIfNull: false
  )


  String email;



  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsForgotPasswordViewModel &&
     other.email == email;

  @override
  int get hashCode =>
    email.hashCode;

  factory SmartHookahModelsForgotPasswordViewModel.fromJson(Map<String, dynamic> json) => _$SmartHookahModelsForgotPasswordViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$SmartHookahModelsForgotPasswordViewModelToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

