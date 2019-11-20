part of openapi.api;

class SmartHookahModelsForgotPasswordViewModel {
  
  String email = null;
  SmartHookahModelsForgotPasswordViewModel();

  @override
  String toString() {
    return 'SmartHookahModelsForgotPasswordViewModel[email=$email, ]';
  }

  SmartHookahModelsForgotPasswordViewModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['Email'] == null) {
      email = null;
    } else {
          email = json['Email'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (email != null)
      json['Email'] = email;
    return json;
  }

  static List<SmartHookahModelsForgotPasswordViewModel> listFromJson(List<dynamic> json) {
    return json == null ? new List<SmartHookahModelsForgotPasswordViewModel>() : json.map((value) => new SmartHookahModelsForgotPasswordViewModel.fromJson(value)).toList();
  }

  static Map<String, SmartHookahModelsForgotPasswordViewModel> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, SmartHookahModelsForgotPasswordViewModel>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = new SmartHookahModelsForgotPasswordViewModel.fromJson(value));
    }
    return map;
  }
}

