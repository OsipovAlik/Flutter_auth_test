import 'package:flutter_task/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DeviceUtils {
  static Future<void> initializeLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loginUserApp = prefs.getString('token') ?? '';
    globalLanguage = prefs.getString('globalLanguage') ?? "en";
  }
}


