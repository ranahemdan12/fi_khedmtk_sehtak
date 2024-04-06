import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/view/clinic_details_screen/screen/clinic_details_screen.dart';
import 'package:fi_khedmtk_sehtak/view/detection_screen/screen/detection_screen.dart';
import 'package:fi_khedmtk_sehtak/view/doctor_profile_screen/screen/doctor_profile_screen.dart';
import 'package:fi_khedmtk_sehtak/view/select_area_in_screen/screen/select_area_in_screen.dart';
import 'package:fi_khedmtk_sehtak/view/select_city_screen/screen/select_city_screen.dart';
import 'package:fi_khedmtk_sehtak/view/shamel_screen/screen/shamel_screen.dart';
import 'package:flutter/cupertino.dart';



import '../../view/about_screen/screen/about_screen.dart';
import '../../view/add_prescription/screen/add_prescription.dart';
import '../../view/bottom_main_screen/main_screen.dart';
import '../../view/cart_screen/screen/cart_screen.dart';
import '../../view/clinc_services/screen/clinic_services.dart';
import '../../view/contact_us_screen/screen/contact_screen.dart';
import '../../view/dentistry_screen/screen/dentistry_screen.dart';
import '../../view/dermatology_screen/screen/dermatology_screen.dart';

import '../../view/doctor_screen/screen/doctor_screen.dart';
import '../../view/help_screen/screen/help_screen.dart';
import '../../view/hospitals_screen/screen/hospitals_screen.dart';
import '../../view/labs_details_screen/screen/labs_details_screen.dart';
import '../../view/labs_screen/screen/labs_screen.dart';
import '../../view/language_screen/screen/lang_screen.dart';
import '../../view/login_screen/screen/login_screen.dart';

import '../../view/onboarding_screen/screen/onBoarding_Screen.dart';
import '../../view/package_item_screen/screen/package_item_screen.dart';
import '../../view/packages_screen/screen/packages_screen.dart';
import '../../view/payment_screen/screen/payment_screen.dart';
import '../../view/points_screen/screen/points_screen.dart';
import '../../view/privacy_screen/screen/privacy_screen.dart';
import '../../view/profile_screen/screen/change_password_screen.dart';
import '../../view/profile_screen/screen/profile_screen.dart';
import '../../view/scan_screen/screen/scan_screen.dart';
import '../../view/select_area_screen/screen/select_area_screen.dart';
import '../../view/service_provider/screen/service_provider_screen.dart';
import '../../view/service_screen/screen/service_screen.dart';
import '../../view/signup_screen/screen/signup_screen.dart';
import '../../view/terms_screen/screen/terms_screen.dart';
import '../../view/visit_screen/screen/visit_screen.dart';

class RoutesManger {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return CupertinoPageRoute(
            builder: (_) => const OnBoardingScreen(), settings: routeSettings);
      case Routes.loginScreen:
        return CupertinoPageRoute(
            builder: (_) => const LoginScreen(), settings: routeSettings);

      case Routes.mainScreen:
        return CupertinoPageRoute(
            builder: (_) => const MainScreen(), settings: routeSettings);
      case Routes.signScreen:
        return CupertinoPageRoute(
            builder: (_) => const SignUpScreen(), settings: routeSettings);

      case Routes.serviceScreen:
        return CupertinoPageRoute(
            builder: (_) => const ServiceScreen(), settings: routeSettings);

        case Routes.doctorScreen:
        return CupertinoPageRoute(
            builder: (_) => const DoctorScreen(), settings: routeSettings);



      case Routes.visitScreen:
        return CupertinoPageRoute(
            builder: (_) => const VisitScreen(), settings: routeSettings);

      case Routes.hospitalsScreen:
        return CupertinoPageRoute(
            builder: (_) => const HospitalsScreen(), settings: routeSettings);

      case Routes.labsScreen:
        return CupertinoPageRoute(
            builder: (_) => const LabsScreen(), settings: routeSettings);

      case Routes.packagesScreen:
        return CupertinoPageRoute(
            builder: (_) => const PackagesScreen(), settings: routeSettings);

        case Routes.cartScreen:
        return CupertinoPageRoute(
            builder: (_) => const CartScreen(), settings: routeSettings);

      case Routes.packageItemScreen:
        return CupertinoPageRoute(
            builder: (_) => const PackageItemScreen(), settings: routeSettings);

      case Routes.profileScreen:
        return CupertinoPageRoute(
            builder: (_) =>  ProfileScreen(), settings: routeSettings);


      case Routes.changePasswordScreen:
        return CupertinoPageRoute(
            builder: (_) =>  ChangeCurrentPassword(), settings: routeSettings);



      case Routes.aboutScreen:
        return CupertinoPageRoute(
            builder: (_) => const AboutScreen(), settings: routeSettings);

      case Routes.contactScreen:
        return CupertinoPageRoute(
            builder: (_) => const ContactUsScreen(), settings: routeSettings);
      case Routes.termsScreen:
        return CupertinoPageRoute(
            builder: (_) => const TermsScreen(), settings: routeSettings);


      case Routes.privacyScreen:
        return CupertinoPageRoute(
            builder: (_) => const PrivacyScreen(), settings: routeSettings);
      case Routes.langScreen:
        return CupertinoPageRoute(
            builder: (_) => const LanguageScreen(), settings: routeSettings);

      case Routes.paymentScreen:
        return CupertinoPageRoute(
            builder: (_) => const PaymentScreen(), settings: routeSettings);
      case Routes.pointsScreen:
        return CupertinoPageRoute(
            builder: (_) => const PointsScreen(), settings: routeSettings);

      case Routes.helpScreen:
        return CupertinoPageRoute(
            builder: (_) => const HelpScreen(), settings: routeSettings);
      case Routes.clinicServicesScreen:
        return CupertinoPageRoute(
            builder: (_) => const ClinicServices(), settings: routeSettings);

      case Routes.dermatologyScreen:
        return CupertinoPageRoute(
            builder: (_) => const DermatologyScreen(), settings: routeSettings);

      case Routes.dentistryScreen:
        return CupertinoPageRoute(
            builder: (_) => const DentistryScreen(), settings: routeSettings);
      case Routes.scanScreen:
        return CupertinoPageRoute(
            builder: (_) => const ScanScreen(), settings: routeSettings);

      case Routes.addPresScreen:
        return CupertinoPageRoute(
            builder: (_) => const AddPrescriptionScreen(), settings: routeSettings);

      case Routes.selectAreaScreen:
        return CupertinoPageRoute(
            builder: (_) => const SelectAreaScreen(), settings: routeSettings);
      case Routes.labsDetailsScreen:
        return CupertinoPageRoute(
            builder: (_) => const LabsDetailsScreen(), settings: routeSettings);


      case Routes.serviceProviderScreen:
        return CupertinoPageRoute(
            builder: (_) => const ServiceProviderScreen(), settings: routeSettings);
      case Routes.clinicsDetailsScreen:
        return CupertinoPageRoute(
            builder: (_) => const ClinicDetailsScreen(), settings: routeSettings);
      case Routes.doctorProfileScreen:
        return CupertinoPageRoute(
            builder: (_) => const DoctorProfileScreen(), settings: routeSettings);

      case Routes.selectCityScreen:
        return CupertinoPageRoute(
            builder: (_) => const SelectCityScreen(), settings: routeSettings);


      case Routes.selectAreaInScreen:
        return CupertinoPageRoute(
            builder: (_) => const SelectAreaInScreen(), settings: routeSettings);
      case Routes.detectionScreen:
        return CupertinoPageRoute(
            builder: (_) => const DetectionScreen(), settings: routeSettings);

      case Routes.shamelScreen:
        return CupertinoPageRoute(
            builder: (_) => const ShamelScreen(), settings: routeSettings);

    }
  }
}
