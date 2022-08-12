// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['Password', 'Email'],
        );
        final val = UserModel(
          confirmPassword:
              $checkedConvert('ConfirmPassword', (v) => v as String?),
          password: $checkedConvert('Password', (v) => v as String),
          userName: $checkedConvert('UserName', (v) => v as String?),
          email: $checkedConvert('Email', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'confirmPassword': 'ConfirmPassword',
        'password': 'Password',
        'userName': 'UserName',
        'email': 'Email'
      },
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfirmPassword', instance.confirmPassword);
  val['Password'] = instance.password;
  writeNotNull('UserName', instance.userName);
  val['Email'] = instance.email;
  return val;
}
