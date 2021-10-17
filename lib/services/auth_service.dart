import 'dart:convert';

import 'package:delit_app/Models/user_models.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://mahan-dashoard.herokuapp.com/api';

  Future<UserModels> register({
    required String name,
    required String email,
    required String password,
  }) async {
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    // print(name);
    // print(email);

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

  Future<UserModels> login({
    required String email,
    required String password,
  }) async {
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModels user = UserModels.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModels> updateDataUser({
    required String email,
  }) async {
    var headers = {'content-type': 'application/json'};
    var body = jsonEncode({
      'email': email,
    });

    var response = await http.post(
      Uri.parse('$baseUrl/updateUser'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModels user = UserModels.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Perbaharui Data User');
    }
  }
}
