import 'package:dio/dio.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/extention.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/service_locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../data/local/local_data_source.dart';
import 'constants.dart';
import 'navigation_service.dart';


class DioHelper {
  Dio init() {
    final dio = Dio(
        BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 1 * 30),
        validateStatus: (state) {
          if (state == 401) {
            // Utils.showErrorToast(StringsManager.unAuthorizedUserMessage.tr());
            logout();
            return false;
          } else if (state == 500) {
            return false;
          }
          return state! < 500;
        }));

    dio.interceptors.add(
        PrettyDioLogger(
            requestBody: true,
            requestHeader: true,
            responseHeader: true
        ));
    return dio;
  }
  void addHeaders(/*String token, Dio
  dio*/) {
    final token = sl<LocalDataSource>().getToken();
    if (token.isEmpty) return;
    sl<Dio>().options.headers = {
      Constants.authorization: "${Constants.token} $token",
      Constants.acceptLanguage: sl<NavigationService>().navigatorKey.currentContext!.isArabic?"ar":"en"
    };
  }

  void removeHeader(){
    sl<Dio>().options.headers = {};
  }

  Future<void> logout() async {
    await sl<LocalDataSource>().removeToken();
    removeHeader();
    sl<NavigationService>().navigatePushNamedAndRemoveUntil(Routes.loginScreen);
  }
}