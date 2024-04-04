// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:dio/io.dart';
// import 'package:ehkam/shared/statics/routes.dart';
// import 'package:ehkam/shared/statics/service_locator.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
// import 'constants.dart';
// import 'navigation_service.dart';
//
// class DioHelper{
//
//   Dio init() {
//     Dio dio = Dio(BaseOptions(contentType: "application/json",
//         baseUrl: Constants.baseUrl,
//         receiveDataWhenStatusError: true,
//         receiveTimeout: const Duration(milliseconds: 30000),
//         followRedirects: false,
//         validateStatus: (status) {
//           if (status == 401) {
//             // showToast("your Token is Invalid");
//
//           }
//           return status! < 500;
//         }));
//     (dio.httpClientAdapter as  IOHttpClientAdapter).createHttpClient = () {
//       HttpClient client = HttpClient();
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       return client;
//     };
//     dio.interceptors.add(PrettyDioLogger(
//       requestHeader: true,
//       requestBody: true,
//       responseBody: true,
//       responseHeader: false,
//       compact: false,
//     ));
//     return dio;
//   }
//
//   void addHeaders(String token , Dio dio) {
//     dio.options.headers = {"Authorization": "JWT $token"};
//   }
//   void removeHeaders(Dio dio) {
//     dio.options.headers = {"Authorization": null};
//   }
//
//   // Future<void> logout() async {
//   //   removeHeaders(sl<Dio>());
//   //   await sl<LocalDataSource>().clearTokenProperties();
//   //   await sl<NavigationService>().navigatePushNamedAndRemoveUntil(Routes.mainScreen);
//   //
//   //   //navigate to login screen
//   // }
// }