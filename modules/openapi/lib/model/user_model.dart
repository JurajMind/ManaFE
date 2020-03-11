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
    if (json['ConfirmPassword'] == null) {
      confirmPassword = null;
    } else {
          confirmPassword = json['ConfirmPassword'];
    }
    if (json['Password'] == null) {
      password = null;
    } else {
          password = json['Password'];
    }
    if (json['UserName'] == null) {
      userName = null;
    } else {
          userName = json['UserName'];
    }
    if (json['Email'] == null) {
      email = null;
    } else {
          email = json['Email'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (confirmPassword != null)
      json['ConfirmPassword'] = confirmPassword;
    if (password != null)
      json['Password'] = password;
    if (userName != null)
      json['UserName'] = userName;
    if (email != null)
      json['Email'] = email;
    return json;
  }

  static List<UserModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<UserModel>() : json.map((value) => new UserModel.fromJson(value)).toList();
  }

  static Map<String, UserModel> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, UserModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new UserModel.fromJson(value));
    }
    return map;
  }
}

