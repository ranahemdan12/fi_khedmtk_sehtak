import 'package:fi_khedmtk_sehtak/shared/statics/add_card_webview.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/view/custom_screen/screen/cash_screen.dart';
import 'package:fi_khedmtk_sehtak/view/custom_screen/screen/payment_screen.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/screen/cart_screen.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/screen/notification_screen.dart';
import 'package:fi_khedmtk_sehtak/view/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import '../../view/auth/forget_password/screen/forget_password_otp_screen.dart';
import '../../view/auth/forget_password/screen/forget_screen.dart';
import '../../view/auth/forget_password/screen/reset_password.dart';
import '../../view/auth/login_screen/screen/login_screen.dart';
import '../../view/auth/otp_screen/screen/otp_screen.dart';
import '../../view/auth/signup_screen/screen/signup_screen.dart';
import '../../view/bottom_main_screen/main_screen.dart';
import '../../view/clinic/dentist_screen/screen/dentist_screen.dart';
import '../../view/clinic/doc_specialization_screen/screen/doc_specialization_screen.dart';
import '../../view/clinic/doctor_filter_screen/screen/doctor_filter_screen.dart';
import '../../view/clinic/doctor_filter_screen/screen/select_subspeciality_screen.dart';
import '../../view/clinic/doctor_info_in_speciality_screen/screen/doctor_info_in_speciality_screen.dart';
import '../../view/clinic/doctors_in_speciality_screen/screen/doctors_in_specialty_screen.dart';
import '../../view/custom_screen/screen/appointment_screen.dart';
import '../../view/google_map/screen/google_map_screen.dart';
import '../../view/hospitals/screen/hospital_screen.dart';
import '../../view/hospitals/screen/hospital_service_screen.dart';
import '../../view/hospitals/screen/hospitals_clinic_specialization.dart';
import '../../view/hospitals/screen/hospitals_services_details.dart';
import '../../view/custom_screen/screen/branch_profile_screen.dart';
import '../../view/labs/screens/lab_branches_screen.dart';
import '../../view/labs/screens/lab_scan_grid _screen.dart';
import '../../view/labs/screens/labs_services_screen.dart';
import '../../view/more/about_screen/screen/about_screen.dart';
import '../../view/more/contact_us_screen/screen/contact_screen.dart';
import '../../view/more/language_screen/screen/lang_screen.dart';
import '../../view/more/points_screen/screen/points_screen.dart';
import '../../view/more/privacy_screen/screen/privacy_screen.dart';
import '../../view/more/profile_screen/screen/change_password_screen.dart';
import '../../view/more/profile_screen/screen/profile_screen.dart';
import '../../view/onboarding_screen/screen/on_boarding_screen.dart';
import '../../view/orders_screen/screen/labs_reservation.dart';
import '../../view/packages_screen/screen/packages_screen.dart';
import '../../view/pharmacy_screen/screen/pharmacy_screen.dart';
import '../../view/select_city_screen/screen/city_screen.dart';
import '../../view/select_region_screen/screen/select_region_screen.dart';




class RoutesManger {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return CupertinoPageRoute(
            builder: (_) => const OnBoardingScreen(), settings: routeSettings);
      case Routes.loginScreen:
        return CupertinoPageRoute(
            builder: (_) => const LoginScreen(), settings: routeSettings);
      case Routes.splashScreen:

        return CupertinoPageRoute(
            builder: (_) => const SplashScreen(), settings: routeSettings);
      case Routes.mainScreen:
        return CupertinoPageRoute(
            builder: (_) => const MainScreen(), settings: routeSettings);
      case Routes.signScreen:
        return CupertinoPageRoute(
            builder: (_) => const SignUpScreen(), settings: routeSettings);
      case Routes.firstForgetScreen:
        return CupertinoPageRoute(
            builder: (_) => const FirstForgetScreen(), settings: routeSettings);
      case Routes.otpScreen:
        return CupertinoPageRoute(
            builder: (_) => const OtpScreen(), settings: routeSettings);
      // case Routes.map:
      //    return CupertinoPageRoute(
      //        builder: (_) =>  const GoogleMapClinics(), settings: routeSettings);

      case Routes.resetPasswordScreen:
        return CupertinoPageRoute(
            builder: (_) => const ResetPasswordScreen(), settings: routeSettings);
      case Routes.forgetOtpScreen:
        return CupertinoPageRoute(
            builder: (_) => const ForgetPasswordOtpScreen(), settings: routeSettings);

        case Routes.specializationScreen:
        return CupertinoPageRoute(
            builder: (_) => const DoctorSpecializationScreen(), settings: routeSettings);

        case Routes.packagesScreen:
        return CupertinoPageRoute(
            builder: (_) => const PackagesScreen(), settings: routeSettings);
        case Routes.profileScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const ProfileScreen(), settings: routeSettings);


      case Routes.changePasswordScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const ChangeCurrentPassword(), settings: routeSettings);



      case Routes.aboutScreen:
        return CupertinoPageRoute(
            builder: (_) => const AboutScreen(), settings: routeSettings);

      case Routes.contactScreen:
        return CupertinoPageRoute(
            builder: (_) => const ContactUsScreen(), settings: routeSettings);



      case Routes.privacyScreen:
        return CupertinoPageRoute(
            builder: (_) => const PrivacyScreen(), settings: routeSettings);
      case Routes.langScreen:
        return CupertinoPageRoute(
            builder: (_) => const LanguageScreen(), settings: routeSettings);


      case Routes.pointsScreen:
        return CupertinoPageRoute(
            builder: (_) => const PointsScreen(), settings: routeSettings);
        case Routes.paymentWebView:
        return CupertinoPageRoute(
            builder: (_) => const PaymentWebView(), settings: routeSettings);




      case Routes.doctorsScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const DoctorsInSpecialityScreen(), settings: routeSettings);

      case Routes.labsServicesScreen:
        return CupertinoPageRoute(
            builder: (_) => const LabsServicesScreen(), settings: routeSettings);


      case Routes.doctorInfoInScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const DoctorInfoInSpecialityScreen(), settings: routeSettings);

        case Routes.labBranchesScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const LabBranchesScreen(), settings: routeSettings);

        case Routes.selectCityScreen:
        return CupertinoPageRoute(
            builder: (_) => const SelectRegionScreen(), settings: routeSettings);


      case Routes.governorateScreen:
        return CupertinoPageRoute(
            builder: (_) => const CityScreen(), settings: routeSettings);

        case Routes.doctorFilterScreen:
        return CupertinoPageRoute(
            builder: (_) => DoctorFilterScreen(), settings: routeSettings);

      case Routes.subSpecialityScreen:
        return CupertinoPageRoute(
            builder: (_) => const SubSpecialityScreen(), settings: routeSettings);

        case Routes.hospitalServices:
        return CupertinoPageRoute(
            builder: (_) =>  const HospitalServiceScreen(), settings: routeSettings);
      case Routes.hospitalsNamesScreen:
        return CupertinoPageRoute(
            builder: (_) => const HospitalsScreen(), settings: routeSettings);

      case Routes.hospitalServicesDetails:
        return CupertinoPageRoute(
            builder: (_) =>  const HospitalsServicesDetailsScreen(), settings: routeSettings);
      case Routes.hospitalClinicSpecialization:
        return CupertinoPageRoute(
            builder: (_) => const HospitalsClinicSpecialization(), settings: routeSettings);

      case Routes.orderLabsReservation:
        return CupertinoPageRoute(
            builder: (_) => const OrderLabsReservation(), settings: routeSettings);

      case Routes.branchProfile:
        return CupertinoPageRoute(
            builder: (_) => const BranchProfileScreen(), settings: routeSettings);


      case Routes.appointmentScreen:
        return CupertinoPageRoute(
            builder: (_) => const AppointmentScreen(), settings: routeSettings);

      case Routes.notificationScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const NotificationScreen(
            ), settings: routeSettings);

      case Routes.labScanScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const LabScanScreen(), settings: routeSettings);
      case Routes.dentistScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const DentistScreen(), settings: routeSettings);
      case Routes.pharmacyScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const PharmacyScreen(), settings: routeSettings);
      case Routes.cartScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const CartScreen(), settings: routeSettings);
      case Routes.cashScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const CashScreen(), settings: routeSettings);
      case Routes.paymentScreen:
        return CupertinoPageRoute(
            builder: (_) =>  const PaymentScreen(), settings: routeSettings);

    }


  }
}
