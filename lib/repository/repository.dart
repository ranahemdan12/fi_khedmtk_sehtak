import 'package:fi_khedmtk_sehtak/models/response/get_ads/get_ads_model.dart';
import '../models/request/auth/change_password/change_password_request.dart';
import '../models/request/auth/forget_password/forget_pass_req_model.dart';
import '../models/request/auth/login/login_request.dart';
import '../models/request/auth/patch_profile/patch_profile_request.dart';
import '../models/request/auth/reset_password/resetpass_req_model.dart';
import '../models/request/auth/sign_up/signup_request.dart';
import '../models/request/auth/verify_otp/verify_otp_req_model.dart';
import '../models/request/cart/add_to_cart.dart';
import '../models/request/cart/post_checkout.dart';
import '../models/request/clinic/confirm_doctor_reservation/confirm_reservation.dart';
import '../models/request/clinic/get_clinics_by_speciality/get_clinics_by_speciality.dart';
import '../models/request/clinic/get_doctor_reservation/get_doctor_reservation.dart';
import '../models/request/filter_locations/filter_locations_request.dart';
import '../models/request/get_ads/get_ads.dart';
import '../models/request/get_region/get_region_request.dart';
import '../models/request/hospitals/cancel_hospital_reservation.dart';
import '../models/request/hospitals/confirm_hospital_reservation.dart';
import '../models/request/hospitals/get_hospital_reservation.dart';
import '../models/request/hospitals/get_hospital_branches_service.dart';
import '../models/request/hospitals/get_hospitals_request.dart';
import '../models/request/labs/cancel_lab_reservation.dart';
import '../models/request/labs/confirm_lab_reservation.dart';
import '../models/request/labs/get_labs_reservations.dart';
import '../models/request/labs/labs_request.dart';
import '../models/request/labs/services_request.dart';
import '../models/request/notification/fcm_register_request.dart';
import '../models/request/notification/get_notification_request.dart';
import '../models/request/package/package_request.dart';
import '../models/response/auth/change_password/change_password.dart';
import '../models/response/auth/forget_password/forget_pass_res_model.dart';
import '../models/response/auth/get_profile/get_profile.dart';
import '../models/response/auth/login/login_response.dart';
import '../models/response/auth/patch_profile/patch_profile.dart';
import '../models/response/auth/reser_password/reset_pass_res_model.dart';
import '../models/response/auth/sign_up/signup_response.dart';
import '../models/response/auth/verify_otp/verify_otp_res_model.dart';
import '../models/response/cart/add_to_cart.dart';
import '../models/response/cart/get_cart_items.dart';
import '../models/response/cart/post_checkout.dart';
import '../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../models/response/clinic/get_doctor_reservation/get_doctor_reservation.dart';
import '../models/response/clinic/get_specialization/get_specialization.dart';
import '../models/response/clinic/get_sub_specialization/get_sub_specialization.dart';
import 'package:dartz/dartz.dart';
import '../models/response/get_citiy/get_city_response.dart';
import '../models/response/get_region/get_region_response.dart';
import '../models/response/hospitals/get_hospital_reservation.dart';
import '../models/response/hospitals/get_hospitals_branches.dart';
import '../models/response/hospitals/get_hospitals_branches_service.dart';
import '../models/response/labs/labs_reservations.dart';
import '../models/response/labs/labs_response.dart';
import '../models/response/labs/reserve_lab_service_response.dart';
import '../models/response/labs/services_response.dart';
import '../models/response/more/about_us_response.dart';
import '../models/response/more/contact_us_response.dart';
import '../models/response/notification/fcm_logout_response.dart';
import '../models/response/notification/fcm_register_response.dart';
import '../models/response/notification/get_notification.dart';
import '../models/response/package/get_package.dart';
import '../models/response/pharmacy/get_pharmacy_response.dart';



abstract class Repository {

//auth

  Future<Either<SignUpErrorResponseModel, SignUpSuccessResponseModel>> signup(
      {required SignUpRequestModel requestModel});

  Future<Either<LoginErrorResponseModel, LoginSuccessResponseModel>> login(
      {required LoginRequestModel requestModel});

  Future<Either<FcmLogoutErrorResponse, FcmLogoutResponse>> logout();

  Future<Either<ProfileErrorResponse, ProfileSuccessResponseModel>> profile();

  Future<Either<PatchProfileErrorResponse, PatchProfileResponse>> patchProfile({required PatchProfileRequest request});

  Future<Either<String, RestPassResponseModel>> resetPassword({required ResetPassRequestModel requestModel});

  Future<Either<VerifyOtpErrorResponseModel, VerifyOtpResponseModel>> verifyOtpRequest({required VerifyOtpRequestModel requestModel});

  Future<Either<String, ForgetPasswordResModel>> forgetPassword({required ForgetPasswordReqModel requestModel});

  Future<Either<ChangePasswordErrorResponse, ChangePasswordResponse>> changePassword({required ChangePasswordRequest request});

  Future<Either<GetAdsErrorResponse, GetAdsSuccessResponseModel>> getAds({required GetAdsRequest request});

  Future<Either<SpecializationErrorResponse, SpecializationSuccessResponseModel>>
      categories();

  Future<Either<SubSpecializationErrorResponse, GetSubSpecializationModel>>
      subCategories({required int id});

  Future<Either<GetGovernoratesErrorResponse, GetCityResponseModel>>
      getGovernorates();

  Future<Either<GetCitiesErrorResponse, GetRegionResponse>> getCities(
      {required GetRegionReqModel requestModel});

  // notification

  Future<Either<FcmRegisterErrorResponse, FcmRegisterResponse>> postFcm(
      {required FcmRegisterRequest request});

  Future<Either<GetNotificationErrorResponse, GetNotificationResponse>> getNotification({required GetNotificationRequest request}
     );

  //clinic

  Future<
      Either<GetClinicsBySpecialityErrorResponse,
          GetClinicsBySpecialityResponse>> getClinicsBySpeciality(
      {required GetClinicsBySpecialityRequest requestModel});

  // Future<
  //     Either<GetDoctorReservationErrorResponse,
  //         GetDoctorReservationResponse>> getDoctorReservation(
  //      {required GetDoctorReservationRequest requestModel}
  //     );

  // Future<Either<MakeReservationErrorResponse, MakeReservationResponse>>
  //     postDoctorReservation({required PostDoctorReservation requestModel});


  Future<Either<GetDoctorReservationErrorResponse, DoctorReservationItem>>
  postConfirmDoctorReservation({required ConfirmReservationRequest request});


  Future<Either<GetDoctorReservationErrorResponse, DoctorReservationItem>>
  cancelClinicReservation({required appointmentId});


  //lab& scan& physical

  Future<Either<LabsServicesErrorResponse, LabsServicesSuccessResponse>>
      getLabsServices({required LabsServicesRequest request});

  Future<Either<LabsErrorResponse, LabsBranches>> getLabs(
      {required LabsRequest request});

  // Future<
  //     Either<MakeReservationErrorResponse,
  //         MakeReservationResponse>> reserveLabService(
  //     {required ReserveLabServiceRequest request});

  Future<
      Either<ReserveLabServiceErrorResponse,
          ReserveLabServiceSuccessResponse>> cancelLabReservations(
      {required CancelReservationRequest request});
  Future<
      Either<ReserveLabServiceErrorResponse,
          ReserveLabServiceSuccessResponse>> postConfirmLabReservation(
      {required ConfirmLabReservation request});

  // Future<Either<LabsReservationsErrorResponse, LabsReservationsSuccessResponse>>
  //     getLabReservations({required GetReservationsRequest request});


  // //location
  //
  // Future<Either<FilterClinicLocationsErrorResponse,
  //         FilterClinicLocationsSuccessResponse>> filterClinicLocations(
  //     {required FilterLocationsRequest request});
  //
  // Future<Either<FilterClinicLocationsErrorResponse,
  //     FilterLabsLocationsSuccessResponse>> filterLabsLocations(
  //     {required FilterLocationsRequest request});
  //
  // Future<Either<FilterClinicLocationsErrorResponse,
  //     FilterHospitalsLocationsResponse>> filterHospitalsLocations(
  //     {required FilterLocationsRequest request});
  //
  // Future<Either<GetPharmacyErrorResponse,
  //     GetPharmacyResponse>> filterPharmaciesLocations(
  //     {required FilterLocationsRequest request});





 //hospital

  Future<Either<GetHospitalsBranchesErrorResponse,
      GetHospitalsBranchesResponse>> getHospitalsBranches(
      {required GetHospitalsBranchesRequest request});


  Future<Either<GetHospitalsServiceBranchesErrorResponse,
      GetHospitalsBranchesServiceResponse>> getHospitalsServiceBranches(
      {required GetHospitalsServiceBranchesRequest request});


  // Future<Either<GetHospitalsReservationErrorResponse,
  //     GetHospitalsReservationResponse>> getHospitalReservation(
  //     {required GetHospitalReservationRequest request});

  // Future<Either<MakeReservationErrorResponse,
  //     MakeReservationResponse>> postHospitalReservation(
  //     {required PostHospitalReservationRequest request});


  Future<Either<GetHospitalsReservationErrorResponse,
      HospitalReservationItem>> cancelHospitalReservation(
      {required CancelHospitalReservationRequest request});

  Future<Either<GetHospitalsReservationErrorResponse,
      HospitalReservationItem>> postConfirmHospitalReservation(
      {required ConfirmHospitalReservationRequest request});


  //more details

  Future<Either<GetContactUsErrorResponse, GetContactUsResponse>> getContactUs();

  Future<Either<GetAboutUsErrorResponse, GetAboutUsResponse>> getAboutUs();

  Future<Either<GetPackageErrorResponse, GetPackageResponse>> getPackage(
      {required PackageRequest request});



  // cart

  Future<Either<GetCartItemsErrorResponse, GetCartItemsResponse>> getCartItems();

  Future<Either<AddToCartErrorResponse, Items>> addToCart(
      {required AddToCartRequest request});

  Future<Either<PostCheckOutErrorResponse, PostCheckOutResponse>> postCheckOut(
      {required PostCheckOutRequest request});

//   pharmacy

  Future<Either<GetPharmacyErrorResponse, GetPharmacyResponse>> getPharmacy(
      {required FilterLocationsRequest request});
}
