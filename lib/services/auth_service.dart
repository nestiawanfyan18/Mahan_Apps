import 'dart:convert';

import 'package:delit_app/Models/user_models.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Uri baseUrl = 'http://localhost:8000/api' as Uri;

  Future<UserModels> register({
    required String name,
    required String email,
    required String password,
  }) async {
    var headers = {'conten-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(Uri.parse('$baseUrl/register'),
        headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModels user = UserModels.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }
}
