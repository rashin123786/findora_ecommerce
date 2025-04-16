import 'package:shared_preferences/shared_preferences.dart';

class AuthPreference {
  Future<bool> getUserEntered() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoginSkip = prefs.getBool('loginSkip') ?? false;
    return isLoginSkip;
  }

  Future saveSKipLogin(bool isSkip) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loginSkip', isSkip);
  }
}
