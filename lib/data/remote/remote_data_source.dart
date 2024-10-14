import 'package:fi_khedmtk_sehtak/models/request/labs/cancel_lab_reservation.dart';
import 'package:fi_khedmtk_sehtak/models/request/labs/get_labs_reservations.dart';
import '../../models/request/auth/change_password/change_password_request.dart';
import '../../models/request/auth/forget_password/forget_pass_req_model.dart';
import '../../models/request/auth/login/login_request.dart';
import '../../models/request/auth/patch_profile/patch_profile_request.dart';
import '../../models/request/auth/reset_password/resetpass_req_model.dart';
import '../../models/request/auth/sign_up/signup_request.dart';
import '../../models/request/auth/verify_otp/verify_otp_req_model.dart';
import '../../models/request/cart/add_to_cart.dart';
import '../../models/request/cart/post_checkout.dart';
import '../../models/request/clinic/confirm_doctor_reservation/confirm_reservation.dart';
import '../../models/request/clinic/get_clinics_by_speciality/get_clinics_by_speciality.dart';
import '../../models/request/clinic/get_doctor_reservation/get_doctor_reservation.dart';
import '../../models/request/filter_locations/filter_locations_request.dart';
import '../../models/request/get_ads/get_ads.dart';
import '../../models/request/get_region/get_region_request.dart';
import '../../models/request/hospitals/cancel_hospital_reservation.dart';
import '../../models/request/hospitals/confirm_hospital_reservation.dart';
import '../../models/request/hospitals/get_hospital_reservation.dart';
import '../../models/request/hospitals/get_hospital_branches_service.dart';
import '../../models/request/hospitals/get_hospitals_request.dart';
import '../../models/request/labs/confirm_lab_reservation.dart';
import '../../models/request/labs/labs_request.dart';
import '../../models/request/labs/services_request.dart';
import '../../models/request/notification/fcm_register_request.dart';
import '../../models/request/notification/get_notification_request.dart';
import '../../models/request/package/package_request.dart';
import '../../models/response/auth/change_password/change_password.dart';
import '../../models/response/auth/forget_password/forget_pass_res_model.dart';
import '../../models/response/auth/get_profile/get_profile.dart';
import '../../models/response/auth/login/login_response.dart';
import '../../models/response/auth/patch_profile/patch_profile.dart';
import '../../models/response/auth/reser_password/reset_pass_res_model.dart';
import '../../models/response/auth/sign_up/signup_response.dart';
import '../../models/response/auth/verify_otp/verify_otp_res_model.dart';
import '../../models/response/cart/get_cart_items.dart';
import '../../models/response/cart/post_checkout.dart';
import '../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../models/response/clinic/get_doctor_reservation/get_doctor_reservation.dart';
import '../../models/response/clinic/get_specialization/get_specialization.dart';
import '../../models/response/clinic/get_sub_specialization/get_sub_specialization.dart';
import '../../models/response/get_ads/get_ads_model.dart';
import '../../models/response/get_citiy/get_city_response.dart';
import '../../models/response/get_region/get_region_response.dart';
import '../../models/response/hospitals/get_hospital_reservation.dart';
import '../../models/response/hospitals/get_hospitals_branches.dart';
import '../../models/response/hospitals/get_hospitals_branches_service.dart';
import '../../models/response/labs/labs_reservations.dart';
import '../../models/response/labs/labs_response.dart';
import '../../models/response/labs/reserve_lab_service_response.dart';
import '../../models/response/labs/services_response.dart';
import '../../models/response/more/about_us_response.dart';
import '../../models/response/more/contact_us_response.dart';
import '../../models/response/notification/fcm_logout_response.dart';
import '../../models/response/notification/fcm_register_response.dart';
import '../../models/response/notification/get_notification.dart';
import '../../models/response/package/get_package.dart';
import '../../models/response/pharmacy/get_pharmacy_response.dart';


abstract class RemoteDataSource {

  //auth

  Future<SignUpSuccessResponseModel> signup({required SignUpRequestModel request});
  Future<LoginSuccessResponseModel> login({required LoginRequestModel request});
  Future<ProfileSuccessResponseModel> profile();
  Future<PatchProfileResponse> patchProfile({required PatchProfileRequest request});
  Future<GetCityResponseModel> getCity();
  Future<GetRegionResponse> getRegion({required GetRegionReqModel request,});
  Future<RestPassResponseModel> resetPassword({required ResetPassRequestModel request});
  Future<VerifyOtpResponseModel> verifyOtpRequest({required VerifyOtpRequestModel  request,});
  Future< ForgetPasswordResModel>forgetPassword({required  ForgetPasswordReqModel  request,});
  Future<ChangePasswordResponse>changePassword({ required ChangePasswordRequest request});
  Future<GetAdsSuccessResponseModel> getAds ({required  GetAdsRequest  request });

  // notification
  Future<FcmRegisterResponse> postFcm ({required  FcmRegisterRequest  request });
  Future<GetNotificationResponse> getNotification ({required GetNotificationRequest request});
  Future<FcmLogoutResponse> logout ();


  //Doctor

  Future<SpecializationSuccessResponseModel> specialization();
  Future<GetSubSpecializationModel> subSpecialization({required int id});
  Future<GetClinicsBySpecialityResponse> getClinicsBySpeciality (  { required  GetClinicsBySpecialityRequest  request});
  // Future<GetDoctorReservationResponse>  getDoctorReservation({required GetDoctorReservationRequest request});
  // Future<MakeReservationResponse> postDoctorReservation({required PostDoctorReservation request});
  Future<DoctorReservationItem> cancelClinicReservation({required appointmentId});
  Future<DoctorReservationItem> postConfirmDoctorReservation({required ConfirmReservationRequest request});


  // //locations
  // Future<FilterClinicLocationsSuccessResponse>  filterClinicLocations({required FilterLocationsRequest request});
  // Future<FilterLabsLocationsSuccessResponse>  filterLabsLocations({required FilterLocationsRequest request});
  // Future<FilterHospitalsLocationsResponse>  filterHospitalsLocations({required FilterLocationsRequest request});





  //  pharmacy

  Future<GetPharmacyResponse>  getPharmacy({required FilterLocationsRequest request});


  //labs&scan&therapy
  Future<LabsServicesSuccessResponse> getLabServices ({required LabsServicesRequest request});
  Future<LabsBranches>  getLabs({required LabsRequest request});
  // Future<MakeReservationResponse>  reserveLabService({required ReserveLabServiceRequest request});
  // Future<LabsReservationsSuccessResponse>  getLabsReservations({required GetReservationsRequest request});
  Future<ReserveLabServiceSuccessResponse>  cancelLabReservation({required CancelReservationRequest request});
  Future<ReserveLabServiceSuccessResponse>  postConfirmLabReservation({required ConfirmLabReservation request});

  //hospitals
  Future<GetHospitalsBranchesResponse> getHospitalsBranches ({required GetHospitalsBranchesRequest request});
  Future<GetHospitalsBranchesServiceResponse> getHospitalsServiceBranches ({required GetHospitalsServiceBranchesRequest request});
  // Future<GetHospitalsReservationResponse> getHospitalReservation ({required GetHospitalReservationRequest request});
  // Future<MakeReservationResponse> postHospitalReservation ({required PostHospitalReservationRequest request});
  Future<HospitalReservationItem> cancelHospitalReservation ({required CancelHospitalReservationRequest request});
  Future<HospitalReservationItem> postConfirmHospitalReservation ({required ConfirmHospitalReservationRequest request});

  //more details
 Future<GetContactUsResponse>getContactUs();
 Future<GetAboutUsResponse>getAboutUs();
 Future<GetPackageResponse> getPackage ({required PackageRequest request});



 //cart

  Future<GetCartItemsResponse> getCartItems ();
  Future<Items> addToCart({ required AddToCartRequest request});
  Future<PostCheckOutResponse> postCheckOut({ required PostCheckOutRequest request});

}
