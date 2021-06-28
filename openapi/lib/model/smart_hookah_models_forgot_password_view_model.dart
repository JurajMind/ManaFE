//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SmartHookahModelsForgotPasswordViewModel {
  /// Returns a new [SmartHookahModelsForgotPasswordViewModel] instance.
  SmartHookahModelsForgotPasswordViewModel({
    @required this.email,
  });

  String email;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SmartHookahModelsForgotPasswordViewModel &&
     other.email == email;

  @override
  int get hashCode =>
    (email == null ? 0 : email.hashCode);

  @override
  String toString() => 'SmartHookahModelsForgotPasswordViewModel[email=$email]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'Email'] = email;
    return json;
  }

  /// Returns a new [SmartHookahModelsForgotPasswordViewModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SmartHookahModelsForgotPasswordViewModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SmartHookahModelsForgotPasswordViewModel(
        email: json[r'Email'],
    );

  static List<SmartHookahModelsForgotPasswordViewModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SmartHookahModelsForgotPasswordViewModel>[]
      : json.map((v) => SmartHookahModelsForgotPasswordViewModel.fromJson(v)).toList(growable: true == growable);

  static Map<String, SmartHookahModelsForgotPasswordViewModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SmartHookahModelsForgotPasswordViewModel>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SmartHookahModelsForgotPasswordViewModel.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SmartHookahModelsForgotPasswordViewModel-objects as value to a dart map
  static Map<String, List<SmartHookahModelsForgotPasswordViewModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SmartHookahModelsForgotPasswordViewModel>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SmartHookahModelsForgotPasswordViewModel.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

