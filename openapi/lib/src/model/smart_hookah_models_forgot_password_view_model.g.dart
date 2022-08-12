// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_hookah_models_forgot_password_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartHookahModelsForgotPasswordViewModel
    _$SmartHookahModelsForgotPasswordViewModelFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'SmartHookahModelsForgotPasswordViewModel',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              requiredKeys: const ['Email'],
            );
            final val = SmartHookahModelsForgotPasswordViewModel(
              email: $checkedConvert('Email', (v) => v as String),
            );
            return val;
          },
          fieldKeyMap: const {'email': 'Email'},
        );

Map<String, dynamic> _$SmartHookahModelsForgotPasswordViewModelToJson(
        SmartHookahModelsForgotPasswordViewModel instance) =>
    <String, dynamic>{
      'Email': instance.email,
    };
