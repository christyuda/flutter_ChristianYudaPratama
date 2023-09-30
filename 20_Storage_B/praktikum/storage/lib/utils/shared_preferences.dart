import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static const String usernameKey = 'username';

  // Fungsi untuk menyimpan username
  static Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(usernameKey, username);
  }

  // Fungsi untuk mendapatkan username
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }

  // Fungsi untuk menghapus username (logout)
  static Future<void> clearUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(usernameKey);
  }

  static void clear() {}
}
