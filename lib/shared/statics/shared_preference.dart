import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';



class PrefsHelper {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }

  static SharedPreferences? sharedPreferences;

   Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences?.setString(key, value);
    if (value is int) return await sharedPreferences?.setInt(key, value);
    if (value is bool) return await sharedPreferences?.setBool(key, value);

    return await sharedPreferences?.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences?.get(key);
  }

  getToken() {
    return sharedPreferences?.getString(Constants.token) ?? "1111";
  }

  removeToken() {}

 String getTheme(){
     return sharedPreferences?.getString(Constants.theme) ?? '';
 }
}
