import 'dart:convert';
import 'package:flutter_task/services/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static Services shared = Services();

  static Future setUserLogin(tok) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", tok);
  }

  static Future<Future<bool>> setUsers(List<UserModel> list) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(list.map((e) => e.toJson()).toList());
    return prefs.setString("users", jsonString);
  }
}
