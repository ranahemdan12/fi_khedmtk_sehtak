abstract class LocalDataSource {

  Future <bool> setData({

    required String key,
    required dynamic value,
  });

  String getData(String key);
  Future<bool> setLogin(bool isPatient);
  String getToken();
  Future<bool> disableOnboarding();
  bool getOnBoarding();
  Future removeToken() ;
}
