class UserModels {
  late int id;
  late String name;
  late String email;
  late String password;
  late String token;

  UserModels({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.token,
  });

  UserModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'token': token,
    };
  }
}
