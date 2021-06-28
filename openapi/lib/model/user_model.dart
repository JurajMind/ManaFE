//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserModel {
  /// Returns a new [UserModel] instance.
  UserModel({
    this.confirmPassword,
    @required this.password,
    this.userName,
    @required this.email,
  });

  String confirmPassword;

  String password;

  String userName;

  String email;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserModel &&
     other.confirmPassword == confirmPassword &&
     other.password == password &&
     other.userName == userName &&
     other.email == email;

  @override
  int get hashCode =>
    (confirmPassword == null ? 0 : confirmPassword.hashCode) +
    (password == null ? 0 : password.hashCode) +
    (userName == null ? 0 : userName.hashCode) +
    (email == null ? 0 : email.hashCode);

  @override
  String toString() => 'UserModel[confirmPassword=$confirmPassword, password=$password, userName=$userName, email=$email]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (confirmPassword != null) {
      json[r'ConfirmPassword'] = confirmPassword;
    }
      json[r'Password'] = password;
    if (userName != null) {
      json[r'UserName'] = userName;
    }
      json[r'Email'] = email;
    return json;
  }

  /// Returns a new [UserModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static UserModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : UserModel(
        confirmPassword: json[r'ConfirmPassword'],
        password: json[r'Password'],
        userName: json[r'UserName'],
        email: json[r'Email'],
    );

  static List<UserModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <UserModel>[]
      : json.map((v) => UserModel.fromJson(v)).toList(growable: true == growable);

  static Map<String, UserModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, UserModel>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = UserModel.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of UserModel-objects as value to a dart map
  static Map<String, List<UserModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UserModel>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = UserModel.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

