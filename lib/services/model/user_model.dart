class UserModel {
  final String email;
  final String userName;
  final String password;


  UserModel({
    required this.email,
    required this.userName,
    required this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? "",
      userName: json['userName'] ?? "",
      password: json['password'] ?? "",

    );
  }
    Map<String, dynamic> toJson() {
    return {
      'email': email,
      'userName': userName,
      'password': password,
    };
  }

  static List<UserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }
}