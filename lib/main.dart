import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/theme_cubit.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/notifications_services.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/service_locator.dart';
import 'package:fi_khedmtk_sehtak/view/auth/forget_password/cubit/forget_password_otp_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/auth/login_screen/login_cubit/login_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/auth/otp_screen/cubit/otp_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/auth/signup_screen/cubit/signup_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/bottom_main_screen/cubit/bottom_navigation_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/clinic/doc_specialization_screen/cubit/categories_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/clinic/doctor_filter_screen/cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/clinic/doctor_filter_screen/cubit/supspecialization_cubit/subspecialize_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/clinic/doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/custom_screen/payment_cubit/payment_filter_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/cart_cubit/add_to_cart_screen/add_to_cart_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/cart_cubit/get_cart_items/cart_items_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/cart_cubit/post_checkout/post_checkout_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/notification_cubit/notification_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/cubit/hospital_cubit/hospitals_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/cubit/hospital_fiter_cubit/hospital_filter__cubit.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/cubit/hospital_service_details/hospital_service_details_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/hospitals/cubit/hospital_service_filter/hospital_service_filter_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/lab_filtter_cubit/labs_filtter_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/labs_cubit/labs_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/labs/cubit/labs_services_cubit/labs_services_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/more/about_screen/cubit/about_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/more/contact_us_screen/cubit/contact_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/more/profile_screen/cubit/change_password/change_password_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/more/profile_screen/cubit/patch_profile/patch_profile_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/more/profile_screen/cubit/profile_cubit/profile_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/orders_screen/cubit/cancel_clinic_reservation/cancel_clinic_reservation_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/orders_screen/cubit/cancel_hospital_reservation/cancel_hospital_reservation_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/orders_screen/cubit/cancel_labs_reservatiom/cancel_labs_reservation_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/orders_screen/cubit/doctor_reservation/doctor_reservation_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/orders_screen/cubit/hospital_reservation/hospital_reservation_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/orders_screen/cubit/labs_reservation/labs_reservation_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/packages_screen/package_cubit/package_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/pharmacy_screen/pharmacy_search_cubit/pharmacy_search_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/select_city_screen/cubit/city_cubit.dart';
import 'package:fi_khedmtk_sehtak/view/select_region_screen/cubit/region_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'shared/statics/bloc_observer.dart';



Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
   debugPrint(
       "-------- firebaseMessagingBackgroundHandler  ---------");
}
Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initNotification();
  await NotificationService().requestFCMPermissions();
  await ServiceLocator.init();
  await EasyLocalization.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(EasyLocalization(
    saveLocale: true,
    path: 'assets/translation',
    supportedLocales: const [Locale('en'), Locale('ar')],
    fallbackLocale: const Locale('ar'),
    startLocale: const Locale('ar'),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 1034),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NavigationCubit()),
            BlocProvider(create: (_) => sl<SignupCubit>()),
            BlocProvider(create: (_) => sl<ThemeCubit>()..getSavedTheme()),
            BlocProvider(create: (_) => sl<ForgetPasswordOtpCubit>()),
            BlocProvider(create: (_) => sl<OtpCubit>()),
            BlocProvider(create: (_) => sl<LoginCubit>()),
            BlocProvider(create: (_) => sl<ProfileCubit>()),
            BlocProvider(create: (_) => sl<PatchProfileCubit>()),
            BlocProvider(create: (_) => sl<CategoriesCubit>()),
            BlocProvider(create: (_) => sl<CityCubit>()),
            BlocProvider(create: (_) => sl<RegionCubit>()),
            // BlocProvider(create: (_) => sl<MapCubit>()),
            // BlocProvider(create: (_) => sl<DoctorReservationCubit>()),
            BlocProvider(create: (_) => sl<DoctorsInSpecialityCubit>()),
            BlocProvider(create: (_) => sl<DoctorFilterCubit>()),
            BlocProvider(create: (_) => sl<LabsServicesCubit>()),
            BlocProvider(create: (_) => sl<LabsCubit>()),
            // BlocProvider(create: (_) => sl<ReserveLabServiceCubit>()),
            BlocProvider(create: (_) => sl<SubSpecializeCubit>()),
            // BlocProvider(create: (_) => sl<PostDoctorReservationCubit>()),
            BlocProvider(create: (_) => sl<CancelClinicReservationCubit>()),
            BlocProvider(create: (_) => sl<HospitalsCubit>()),
            BlocProvider(create: (_) => sl<HospitalFilterCubit>()),
            BlocProvider(create: (_) => sl<HospitalServiceDetailsCubit>()),
            BlocProvider(create: (_) => sl<HospitalServiceFilterCubit>()),
            // BlocProvider(create: (_) => sl<HospitalReservationCubit>()),
            BlocProvider(create: (_) => sl<CancelHospitalReservationCubit>()),
            // BlocProvider(create: (_) => sl<PostReserveHospitalCubit>()),
            BlocProvider(create: (_) => sl<LabsFilterCubit>()),
            // BlocProvider(create: (_) => sl<LabsReservationCubit>()),
            BlocProvider(create: (_) => sl<CancelLabsReservationCubit>()),
            BlocProvider(create: (_) => sl<ChangePasswordCubit>()),
           BlocProvider(create: (_) => sl<PharmacySearchCubit>()),
            BlocProvider(create: (_) => sl<AboutCubit>()),
            BlocProvider(create: (_) => sl<ContactCubit>()),
            BlocProvider(create: (_) => sl<NotificationCubit>()),
            BlocProvider(create: (_) => sl<PackageCubit>()),
            BlocProvider(create: (_) => sl<CartItemsCubit>()),
            BlocProvider(create: (_) => sl<AddToCartCubit>()),
            BlocProvider(create: (_) => sl<PostCheckoutCubit>()),
            BlocProvider(create: (_) => sl<PaymentFilterCubit>()),
          ],
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: BlocBuilder<ThemeCubit, ThemeModeChanged>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Sehtak',
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  theme: state.userTheme,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: RoutesManger.onGenerateRoute,
                  navigatorKey: sl<NavigationService>().navigatorKey,
                  initialRoute: Routes.splashScreen,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
