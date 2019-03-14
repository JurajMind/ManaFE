part of openapi.api;

class UserModel {
  String confirmPassword = null;

  String password = null;

  String userName = null;

  String email = null;
  UserModel();

  @override
  String toString() {
    return 'UserModel[confirmPassword=$confirmPassword, password=$password, userName=$userName, email=$email, ]';
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    confirmPassword = json['ConfirmPassword'];
    password = json['Password'];
    userName = json['UserName'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'ConfirmPassword': confirmPassword,
      'Password': password,
      'UserName': userName,
      'Email': email
    };
  }

  static List<UserModel> listFromJson(List<dynamic> json) {
    return json == null
        ? new List<UserModel>()
        : json.map((value) => new UserModel.fromJson(value)).toList();
  }

  static Map<String, UserModel> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, UserModel>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) =>
          map[key] = new UserModel.fromJson(value));
    }
    return map;
  }
}
