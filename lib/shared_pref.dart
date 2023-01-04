import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<bool> saveData(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isDark', isDark);
  }

  static Future<bool> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDark')!;
  }
}
