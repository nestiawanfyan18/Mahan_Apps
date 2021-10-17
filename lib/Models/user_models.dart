class UserModels {
  late int? id;
  late String? name;
  late String? email;
  late String? password;
  late String? token;
  late String? asal_kampus;
  late String? gander;
  late String? kota;
  late String? provinsi;
  late String? test_psikologi;

  UserModels({
    this.id,
    this.name,
    this.email,
    this.password,
    this.token,
    this.asal_kampus,
    this.gander,
    this.kota,
    this.provinsi,
    this.test_psikologi,
  });

  UserModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    asal_kampus = json['asal_kampus'];
    gander = json['gander'];
    kota = json['kota'];
    provinsi = json['provinsi'];
    test_psikologi = json['test_psikologi'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'token': token,
      'asal_kampus': asal_kampus,
      'gander': gander,
      'kota': kota,
      'provinsi': provinsi,
      'test_psikologi': test_psikologi,
    };
  }
}
