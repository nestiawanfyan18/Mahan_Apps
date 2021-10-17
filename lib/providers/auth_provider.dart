import 'dart:convert';

import 'package:delit_app/Models/user_models.dart';
import 'package:delit_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModels _user;

  UserModels get user => _user;

  set user(UserModels user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserModels user = await AuthService().register(
        name: name,
        email: email,
        password: password,
      );

      _user = user;

      // print(jsonEncode(user));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserModels user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      print(jsonEncode(user));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateData({
    required String email,
  }) async {
    try {
      UserModels user = await AuthService().updateDataUser(
        email: email,
      );

      _user = user;
      print(jsonEncode(user));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
