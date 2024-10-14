import 'package:fi_khedmtk_sehtak/data/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/statics/constants.dart';
import '../../shared/statics/service_locator.dart';

class LocalDataSourceImpl extends LocalDataSource{

  SharedPreferences  prefsHelper;
  LocalDataSourceImpl({required this.prefsHelper});

  @override
  Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await prefsHelper.setString(key, value);
    } else if (value is int) {
      return await prefsHelper.setInt(key, value);
    } else if (value is bool) {
      return await prefsHelper.setBool(key, value);
    } else if (value is double) {
      return await prefsHelper.setDouble(key, value);
    } else if (value is List<String>) {
      return await prefsHelper.setStringList(key, value);
    } else {
      return false;
    }
  }

  @override
  String getData(String key) {
    return sl<SharedPreferences>().getString(key) ?? "";
  }

  @override
  Future<bool> setLogin(bool isPatient) async {
    return await sl<SharedPreferences>()
        .setBool(Constants.login, isPatient);
  }

  @override
  String getToken() {
    return prefsHelper.getString(Constants.token) ?? "";
  }

  @override
  Future<bool> disableOnboarding()async {
    return  await prefsHelper.setBool(Constants.onboarding,true) ;
  }

  @override
  bool getOnBoarding() {
    return prefsHelper.getBool(Constants.onboarding) ?? false;
  }

  @override
  removeToken()async {
   await prefsHelper.remove(Constants.token);
  }
}