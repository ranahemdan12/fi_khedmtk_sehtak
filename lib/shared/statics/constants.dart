class Constants {
  static const String enCode = "en";
  static const String arCode = "ar";
  static const String authorization = "Authorization";
  static const String acceptLanguage = "Accept-Language";
  static const String token = "Token";
  static const String onboarding = "onboarding";
  static const String baseUrl =
    'http://192.168.88.112:8000/en';
  // 'https://yourhealth-6joxm.ondigitalocean.app/ar';
  static const String login = '/core/login/';
  static const String logout = '/core/logout/';
  static const String profile = '/core/profile/';
  static const String signUp = '/core/register/';
  static const String governorates = '/core/city/';
  static const String changePassword = '/core/change_password/';
  static const String doctors = '/doctors/';
  static const String doctorsReservation = 'doctor_reservations/';
  static const String clinics = '/service/';
  static const String specializations = '/specializations/';
  static const String clinicAppointments = '/appointments/';
  static const String clinicReservations = '/reservations/';
  static const String confirmReservation = 'confirm_reservation/';
  static const String cities = '/region/';
  static const String package = '/hospitals/packages/';
  static const String fcm = '/core/fcm_register/';
  static const String notification = '/core/notification/';
  static const String resetPassword = '/core/reset_password/';
  static const String forgetPasswordEndPoint = '/core/forget_password/';
  static const String verifyOtp = '/core/verify_otp/';
  static const String egyptCountryCode = '+20';
  static const String ads = '/core/ads/';
  static const String categories = '/doctors/specializations/';
  static const String subCategories = '/subspecializations/';
  static const String labServices = '/labs/services/';
  static const String labLocation = '/labs/list_branch_location/';
  static const String scanLocation = '/scan/list_branch_location/';
  static const String therapyLocation = '/therapy/list_branch_location/';
  static const String hospitalLocation = '/hospitals/list_branch_location/';
  static const String filterClinics = '/doctors/list_clinic_location/';
  static const String labsService = '/labservice/';
  static const String appointments = '/appointments/';
  static const String getPharmacies = '/dashboard/list_branch_location/';
  static const String labBranches = '/branches/';
  static const String reserveLabService = '/reservations/';
  static const String hospitalBranches = '/hospitals/branches/';
  static const String hospitalServiceBranches = '/branchservice/';
  static const String hospitalServices = '/hospitals/services/';
  static const String hospitalReservation = '/hospitals/reservations/';
  static const String hospitalCancel = '/cancel_reservation/';
  static const String payment = '/payment/paymob_initialize/';

  //cart
  static const String getCartItems = '/core/cart/get_cart_items/';
  static const String addToCart = '/core/cart/add_cart_item/';
  static const String cartCheckOut = '/core/cart/checkout/';



  //scan
  static const String scanServices = '/scan/services/';
  static const String scanBranchService = '/scan_service/';
  static const String scanReservation = '/scan/reservations/';

// therapy

  static const String therapyServices = '/therapy/services/';
  static const String therapyBranchService = '/therapy_service/';
   static const String therapyReservation = '/therapy/reservations/';

  //action
  static const String register = 'register';
  static const String resetPasswordOtp = 'forget_password';
  static const String changePhoneNum = 'change_phone_number';
  static const String male = 'male';
  static const String maleAr = 'ذكر';
  static const String female = 'female';
  static const String femaleAr = 'انثي';
  static const String professor = 'Professor';
  static const String professorAr = 'استاذ';
  static const String lecturer = 'Lecturer';
  static const String lecturerAr = 'محاضر';
  static const String consultant = 'Consultant';
  static const String consultantAr = 'استشاري';
  static const String specialist = 'Specialist';
  static const String specialistAr = 'اخصائي';
  static const String orderByPriceEn = 'sehtak_fee';
  static const String orderLabByPriceEn = 'sehtak_fee';
  static const String orderByPriceAr = 'السعر من الأقل للأعلي';
  static const String orderByReviewEn = '-sehtak_fee';
  static const String orderLabByPriceF = '-sehtak_fee';
  static const String orderByReviewAr = 'الاكثر طلبا';
  static const String clinicsServiceEn = 'Clinics';
  static const String operationsEn = 'Operations';
  static const String labEn = 'Lab';
  static const String contactUs = '/dashboard/contactus/';
  static const String aboutUs = '/dashboard/aboutus/';
  static const String scanEn = 'Scans';
  static const String showLabsReservations = '/labs/reservations/';
  static const String showTherapyReservations = '/therapy/reservations/';
  static const String cancelLabReservation =
      '/labs/reservations/cancel_reservation/';
  static const String cancelScanReservation =
      '/scan/reservations/cancel_reservation/';
  static const String cancelTherapyReservation =
      '/therapy/reservations/cancel_reservation/';
  static const String doctorReservation = '/doctors/doctor_reservations/';
  static const String cancelDoctorReservation = '/doctors/doctor_reservations/cancel_reservation/';

  static const String notificationChannelId = "notificationChannelId";
  static const  String notificationChannelName = "notificationChannelName";
  static const String theme  = "theme";
  static const String light = 'light';
  static const String dark = 'dark';
}