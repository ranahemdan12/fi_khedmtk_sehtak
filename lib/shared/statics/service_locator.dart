import 'package:dio/dio.dart';
import 'package:fi_khedmtk_sehtak/data/local/local_data_source.dart';
import 'package:fi_khedmtk_sehtak/data/local/local_data_source_implemntation.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/theme_cubit.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/shared_preference.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/labs_cubit/labs_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/orders_screen/cubit/doctor_reservation/doctor_reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/remote/remote_data_source.dart';
import '../../data/remote/remote_data_source_implemntation.dart';
import '../../repository/repository.dart';
import '../../repository/repository_implementation.dart';
import '../../view/auth/forget_password/cubit/forget_password_otp_cubit.dart';
import '../../view/auth/login_screen/login_cubit/login_cubit.dart';
import '../../view/auth/otp_screen/cubit/otp_cubit.dart';
import '../../view/auth/signup_screen/cubit/signup_cubit.dart';
import '../../view/clinic/doc_specialization_screen/cubit/categories_cubit.dart';
import '../../view/clinic/doctor_filter_screen/cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import '../../view/clinic/doctor_filter_screen/cubit/supspecialization_cubit/subspecialize_cubit.dart';
import '../../view/clinic/doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
import '../../view/custom_screen/payment_cubit/payment_filter_cubit.dart';
import '../../view/home_screen/cubit/ads_cubit/ads_cubit.dart';
import '../../view/home_screen/cubit/cart_cubit/add_to_cart_screen/add_to_cart_cubit.dart';
import '../../view/home_screen/cubit/cart_cubit/get_cart_items/cart_items_cubit.dart';
import '../../view/home_screen/cubit/cart_cubit/post_checkout/post_checkout_cubit.dart';
import '../../view/home_screen/cubit/notification_cubit/notification_cubit.dart';
import '../../view/hospitals/cubit/hospital_cubit/hospitals_cubit.dart';
import '../../view/hospitals/cubit/hospital_fiter_cubit/hospital_filter__cubit.dart';
import '../../view/hospitals/cubit/hospital_service_details/hospital_service_details_cubit.dart';
import '../../view/hospitals/cubit/hospital_service_filter/hospital_service_filter_cubit.dart';
import '../../view/labs/cubit/lab_filtter_cubit/labs_filtter_cubit.dart';
import '../../view/labs/cubit/labs_services_cubit/labs_services_cubit.dart';
import '../../view/more/about_screen/cubit/about_cubit.dart';
import '../../view/more/contact_us_screen/cubit/contact_cubit.dart';
import '../../view/more/profile_screen/cubit/change_password/change_password_cubit.dart';
import '../../view/more/profile_screen/cubit/patch_profile/patch_profile_cubit.dart';
import '../../view/more/profile_screen/cubit/profile_cubit/profile_cubit.dart';
import '../../view/orders_screen/cubit/cancel_clinic_reservation/cancel_clinic_reservation_cubit.dart';
import '../../view/orders_screen/cubit/cancel_hospital_reservation/cancel_hospital_reservation_cubit.dart';
import '../../view/orders_screen/cubit/cancel_labs_reservatiom/cancel_labs_reservation_cubit.dart';
import '../../view/orders_screen/cubit/hospital_reservation/hospital_reservation_cubit.dart';
import '../../view/orders_screen/cubit/labs_reservation/labs_reservation_cubit.dart';
import '../../view/packages_screen/package_cubit/package_cubit.dart';
import '../../view/pharmacy_screen/pharmacy_search_cubit/pharmacy_search_cubit.dart';
import '../../view/select_city_screen/cubit/city_cubit.dart';
import '../../view/select_region_screen/cubit/region_cubit.dart';
import 'dio_helper.dart';
import 'internet_checker.dart';
import 'navigation_service.dart';



final sl = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    // register helpers, datasource
    await _registerLazySingleton();

    // register cubits/blocs
    await _registerFactory();
  }
}

Future<void> _registerLazySingleton() async {


  if (sl.isRegistered<Dio>()) {

    sl.unregister<Dio>();
    sl.unregister<DioHelper>();
  }
  final Dio dio = DioHelper().init();
  debugPrint(
      '------------------- register Dio: ${dio.options.baseUrl} --------------------');
  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton<DioHelper>(() => DioHelper());
  sl.registerLazySingleton<Location>(() => Location());
  //register shared preferences
 /* if (sl.isRegistered<SharedPreferences>()) {
    sl.unregister<SharedPreferences>();
  }*/
  final sharedPrefs = await PrefsHelper().init();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
/*  if (sl.isRegistered<PrefsHelper>()) {
    sl.unregister<PrefsHelper>();
  }*/

  sl.registerLazySingleton<PrefsHelper>(() => PrefsHelper());
  // network info
  if (sl.isRegistered<NetworkInfo>()) {
    sl.unregister<NetworkInfo>();
  }
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()));
  // remote datasource
  if (sl.isRegistered<RemoteDataSource>()) {
    sl.unregister<RemoteDataSource>();
  }

  sl.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(dio: sl(), dioHelper: sl()));


  // local datasource
  if (sl.isRegistered<LocalDataSource>()) {
    sl.unregister<LocalDataSource>();
  }

  sl.registerLazySingleton<LocalDataSource>(
          () => LocalDataSourceImpl( prefsHelper: sl<SharedPreferences>()));

  // repositories
  if (sl.isRegistered<Repository>()) {
    sl.unregister<Repository>();
  }

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // navigation service
  if (sl.isRegistered<NavigationService>()) {
    sl.unregister<NavigationService>();
  }
  sl.registerLazySingleton<NavigationService>(() => NavigationService());
}

Future<void> _registerFactory() async {
/*
  if (sl.isRegistered<LoginCubit>()) {
    sl.unregister<LoginCubit>();
  }
*/

  sl.registerFactory(() => SignupCubit(repository: sl()));
  sl.registerFactory(() => LoginCubit(repository: sl()));
  sl.registerFactory(() => ProfileCubit(repository: sl()));
  sl.registerFactory(() => PatchProfileCubit(repository: sl()));
  sl.registerFactory(() => ForgetPasswordOtpCubit(repository: sl()));
  sl.registerFactory(() => OtpCubit(repository: sl()));
  sl.registerFactory(() => CityCubit(repository: sl()));
  sl.registerFactory(() => RegionCubit(repository: sl()));
  sl.registerFactory(() => AdsCubit(repository: sl()));
  sl.registerFactory(() => CategoriesCubit(repository: sl()));
  // sl.registerFactory(() => MapCubit(repository: sl()));
  sl.registerFactory(() => DoctorsInSpecialityCubit(repository: sl()));
  sl.registerFactory(() => DoctorFilterCubit());
  sl.registerFactory(() => LabsCubit(repository: sl()));
  // sl.registerFactory(() => ReserveLabServiceCubit(repository: sl()));
  sl.registerFactory(() => LabsServicesCubit(repository: sl()));
  // sl.registerFactory(() => PostDoctorReservationCubit(repository: sl()));
  sl.registerFactory(() => LabsReservationCubit(repository: sl()));
  sl.registerFactory(() => ChangePasswordCubit(repository: sl()));
  sl.registerFactory(() => SubSpecializeCubit(repository: sl()));
  sl.registerFactory(() => DoctorReservationCubit(repository: sl()));
  sl.registerFactory(() => CancelClinicReservationCubit(repository: sl()));
  sl.registerFactory(() => HospitalsCubit(repository: sl()));
  sl.registerFactory(() => HospitalFilterCubit());
  sl.registerFactory(() => HospitalServiceDetailsCubit(repository: sl()));
  sl.registerFactory(() => HospitalServiceFilterCubit());
  sl.registerFactory(() => LabsFilterCubit());
  sl.registerFactory(() => CancelLabsReservationCubit(repository:sl()));
  sl.registerFactory(() => HospitalReservationCubit(repository:sl()));
  sl.registerFactory(() => CancelHospitalReservationCubit(repository:sl()));
  // sl.registerFactory(() => PostReserveHospitalCubit(repository:sl()));
   sl.registerFactory(() => PharmacySearchCubit(repository:sl()));
  sl.registerFactory(() => ContactCubit(repository:sl()));
  sl.registerFactory(() => AboutCubit(repository:sl()));
  sl.registerFactory(() => NotificationCubit(repository:sl()));
  sl.registerFactory(() => PackageCubit(repository:sl()));
  sl.registerFactory(() => CartItemsCubit(repository:sl()));
  sl.registerFactory(() => AddToCartCubit(repository:sl()));
  sl.registerFactory(() => PostCheckoutCubit(repository:sl()));
  sl.registerFactory(() => ThemeCubit());
  sl.registerFactory(() => PaymentFilterCubit());



}
