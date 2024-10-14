import 'package:dio/dio.dart';
import 'package:fi_khedmtk_sehtak/models/request/labs/cancel_lab_reservation.dart';
import 'package:fi_khedmtk_sehtak/models/request/labs/get_labs_reservations.dart';
import 'package:fi_khedmtk_sehtak/models/request/labs/services_request.dart';
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
import '../../models/response/cart/add_to_cart.dart';
import '../../models/response/cart/get_cart_items.dart';
import '../../models/response/cart/post_checkout.dart';
import '../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../models/response/clinic/get_doctor_reservation/get_doctor_reservation.dart';
import '../../models/response/clinic/get_specialization/get_specialization.dart';
import '../../models/response/clinic/get_sub_specialization/get_sub_specialization.dart';
import '../../models/response/get_citiy/get_city_response.dart';
import '../../models/response/get_ads/get_ads_model.dart';
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
import '../../shared/statics/constants.dart';
import '../../shared/statics/dio_helper.dart';
import '../../shared/statics/enum.dart';
import 'remote_data_source.dart';





class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;
  final DioHelper dioHelper;

  RemoteDataSourceImpl({required this.dio, required this.dioHelper});
  //auth
  @override
  Future<SignUpSuccessResponseModel> signup(
      {required SignUpRequestModel request}) async {
    final response = await dio.post(Constants.signUp, data: request.toJson());

    if (response.statusCode == 201) {
      return SignUpSuccessResponseModel.fromJson(response.data);
    } else {
      throw SignUpErrorResponseModel.fromJson(response.data);
    }
  }

  @override
  Future<LoginSuccessResponseModel> login(
      {required LoginRequestModel request}) async {
    final response = await dio.post(Constants.login, data: request.toJson());
    if (response.statusCode == 200) {
      return LoginSuccessResponseModel.fromJson(response.data);
    } else {
      throw LoginErrorResponseModel.fromJson(response.data);
    }
  }



  @override
  Future<FcmLogoutResponse> logout() async {

    dioHelper.addHeaders();
    final response = await dio.post(Constants.logout,);

    if (response.statusCode == 200) {
      return FcmLogoutResponse.fromJson(response.data);
    } else {
      throw FcmLogoutErrorResponse.fromJson(response.data);
    }
  }


  @override
  Future<RestPassResponseModel> resetPassword(
      {required ResetPassRequestModel request}) async {
    final response =
        await dio.post(Constants.resetPassword, data: request.toJson());

    if (response.statusCode == 201) {
      return RestPassResponseModel.fromJson(response.data);
    } else {
      throw response.data['message'] ?? "Error";
    }
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtpRequest(
      {required VerifyOtpRequestModel request}) async {
    final response =
        await dio.post(Constants.verifyOtp, data: request.toJson());
    if (response.statusCode == 201) {
      return VerifyOtpResponseModel.fromJson(response.data);
    } else {
      throw VerifyOtpErrorResponseModel.fromJson(response.data);
    }
  }

  @override
  Future<ForgetPasswordResModel> forgetPassword(
      {required ForgetPasswordReqModel request}) async {
    final response = await dio.post(Constants.forgetPasswordEndPoint,
        data: request.toJson());

    if (response.statusCode == 201) {
      return ForgetPasswordResModel.fromJson(response.data);
    } else {
      throw response.data['message'];
    }
  }

  @override
  Future<ChangePasswordResponse> changePassword(
      {required ChangePasswordRequest request}) async {
    final response =
        await dio.post(Constants.changePassword, data: request.toJson());

    if (response.statusCode == 201) {
      return ChangePasswordResponse.fromJson(response.data);
    } else {
      throw response.data['message'];
    }
  }

  @override
  Future<ProfileSuccessResponseModel> profile() async {
    dioHelper.addHeaders();
    final response = await dio.get(Constants.profile,);
    if (response.statusCode == 200) {
      return ProfileSuccessResponseModel.fromJson(response.data);
    } else {
      throw ProfileErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<PatchProfileResponse> patchProfile({required PatchProfileRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.patch(Constants.profile);
    if (response.statusCode == 200) {
      return PatchProfileResponse.fromJson(response.data);
    } else {
      throw PatchProfileErrorResponse(message: 'Error');
    }
  }




  @override
  Future<GetAdsSuccessResponseModel> getAds(
      {required GetAdsRequest request}) async {
    final response = await dio.get(
      Constants.ads,
      queryParameters: request.toJson(),
    );

    if (response.statusCode == 200) {
      return GetAdsSuccessResponseModel.fromJson(response.data);
    } else {
      throw GetAdsErrorResponse.fromJson(response.data);
    }
  }


  // notification
  @override
  Future<FcmRegisterResponse> postFcm(
      {required FcmRegisterRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(Constants.fcm, data: request.toJson());
    if (response.statusCode == 200) {
      return FcmRegisterResponse.fromJson(response.data);
    } else {
      throw FcmRegisterErrorResponse.fromJson(response.data);
    }
  }


  @override
  Future<GetNotificationResponse> getNotification({required GetNotificationRequest request}
     ) async {
    dioHelper.addHeaders();
    final response = await dio.get(Constants.notification,
        queryParameters: request.toJson());
    if (response.statusCode == 200) {
      return GetNotificationResponse.fromJson(response.data);
    } else {
      throw GetNotificationErrorResponse.fromJson(response.data);
    }
  }

  //city & region

  @override
  Future<GetCityResponseModel> getCity() async {
    dioHelper.addHeaders();
    final response = await dio.get(
      Constants.governorates,
    );
    if (response.statusCode == 200) {
      return GetCityResponseModel.fromJson(jsonList: response.data);
    } else {
      throw GetGovernoratesErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<GetRegionResponse> getRegion(
      {required GetRegionReqModel request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
      '${Constants.governorates}${request.governoratesItem.id}${Constants.cities}',
    );
    if (response.statusCode == 200) {
      return GetRegionResponse.fromJson(jsonList: response.data);
    } else {
      throw GetCitiesErrorResponse.fromJson(response.data);
    }
  }
   //clinic


  @override
  Future<SpecializationSuccessResponseModel> specialization() async {
    final response = await dio.get(Constants.categories);
    if (response.statusCode == 200) {
      return SpecializationSuccessResponseModel.fromJson(
          categories: response.data);
    } else {
      throw SpecializationErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<GetSubSpecializationModel> subSpecialization({required int id}) async {
    final response =
    await dio.get('${Constants.categories}$id${Constants.subCategories}');
    if (response.statusCode == 200) {
      return GetSubSpecializationModel.fromJson(subCategories: response.data);
    } else {
      throw SubSpecializationErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<GetClinicsBySpecialityResponse> getClinicsBySpeciality(
      {required GetClinicsBySpecialityRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
      '${Constants.categories}${request.id}${Constants.clinics}',
      queryParameters: request.toJson(),
    );
    if (response.statusCode == 200) {
      return GetClinicsBySpecialityResponse.fromJson(response.data);
    } else {
      throw GetClinicsBySpecialityErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<GetDoctorReservationResponse> getDoctorReservation(
      {required GetDoctorReservationRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
        '${Constants.doctors}${Constants.doctorsReservation}',
        queryParameters: request.toJson());
    if (response.statusCode == 200) {
      return GetDoctorReservationResponse.fromJson(response.data);
    } else {
      throw GetDoctorReservationErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<DoctorReservationItem> postConfirmDoctorReservation(
      {required ConfirmReservationRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(
      '${Constants.doctors}${Constants.doctorsReservation}${Constants.confirmReservation}',
      data: request.toJson(),
    );
    if (response.statusCode == 200) {
      return DoctorReservationItem.fromJson(response.data);
    } else {
      throw GetDoctorReservationErrorResponse.fromJson(response.data);
    }
  }

  // @override
  // Future<MakeReservationResponse> postDoctorReservation(
  //     {required PostDoctorReservation request}) async {
  //   dioHelper.addHeaders();
  //   final response = await dio.post(
  //     '${Constants.categories}${request.specializationsId}${Constants.clinics}${request.serviceId}'
  //         '${Constants.clinicAppointments}${request.appointmentsId}${Constants.clinicReservations}',
  //   );
  //   if (response.statusCode == 200) {
  //     return MakeReservationResponse.fromJson(response.data,
  //     );
  //   }
  //   else {
  //     throw GetDoctorReservationErrorResponse.fromJson(response.data);
  //   }
  // }

  @override
  Future<DoctorReservationItem> cancelClinicReservation(
      {required appointmentId}) async {
    dioHelper.addHeaders();
    final response = await dio
        .post(Constants.cancelDoctorReservation, data: {"id": appointmentId});
    if (response.statusCode == 200) {
      return DoctorReservationItem.fromJson(
        response.data,
      );
    } else {
      throw GetDoctorReservationErrorResponse.fromJson(response.data);
    }
  }



  // labs& scan& physical
  @override
  Future<LabsReservationsSuccessResponse> getLabsReservations(
      {required GetReservationsRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
        request.serviceType == ServiceType.lab
            ? Constants.showLabsReservations
            : request.serviceType == ServiceType.scan
                ? Constants.scanReservation
                : Constants.therapyReservation,
        queryParameters: request.toJson());
    if (response.statusCode == 200) {
      return LabsReservationsSuccessResponse.fromJson(
          response.data, request.serviceType);
    } else {
      throw LabsErrorResponse.fromJson(json: response.data);
    }
  }


  @override
  Future<LabsBranches> getLabs({required LabsRequest request,}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
        request.serviceType == ServiceType.lab
            ? '${Constants.labServices}${request.serviceId}${Constants.labsService}'
            : request.serviceType == ServiceType.scan
                ? "${Constants.scanServices}${request.serviceId}${Constants.scanBranchService}"
                : "${Constants.therapyServices}${request.serviceId}${Constants.therapyBranchService}",
        queryParameters: request.toJson());
    if (response.statusCode == 200) {
      return LabsBranches.fromJson(response.data, request.serviceType);
    } else {
      throw LabsErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<LabsServicesSuccessResponse> getLabServices(
      {required LabsServicesRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
        request.serviceType == ServiceType.lab
            ? Constants.labServices
            : request.serviceType == ServiceType.scan
                ? Constants.scanServices
                : Constants.therapyServices,
        queryParameters: request.toJson());
    if (response.statusCode == 200) {
      return LabsServicesSuccessResponse.fromJson(
        json: response.data,
      );
    } else {
      throw LabsErrorResponse.fromJson(json: response.data);
    }
  }
  //
  // @override
  // Future<MakeReservationResponse> reserveLabService(
  //     {required ReserveLabServiceRequest request}) async {
  //   dioHelper.addHeaders();
  //   final response = await dio.post(request.serviceType == ServiceType.lab
  //       ? '${Constants.labServices}${request.serviceId}${Constants.labsService}${request.labServiceId}${Constants.appointments}${request.appointmentId}${Constants.reserveLabService}'
  //       : request.serviceType == ServiceType.scan
  //           ? "${Constants.scanServices}${request.serviceId}${Constants.scanBranchService}${request.labServiceId}${Constants.appointments}${request.appointmentId}${Constants.reserveLabService}"
  //           : "${Constants.therapyServices}${request.serviceId}${Constants.therapyBranchService}${request.labServiceId}${Constants.appointments}${request.appointmentId}${Constants.reserveLabService}");
  //   if (response.statusCode == 200) {
  //     return MakeReservationResponse.fromJson(
  //         response.data,);
  //   } else {
  //     throw ReserveLabServiceErrorResponse.fromJson(json: response.data);
  //   }
  // }

  @override
  Future<ReserveLabServiceSuccessResponse> cancelLabReservation(
      {required CancelReservationRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(
        request.serviceType == ServiceType.lab
            ? Constants.cancelLabReservation
            : request.serviceType == ServiceType.scan
            ? Constants.cancelScanReservation
            : Constants.cancelTherapyReservation,
        data: request.toJson());
    if (response.statusCode == 200) {
      return ReserveLabServiceSuccessResponse.fromJson(
          response.data, request.serviceType);
    } else {
      throw ReserveLabServiceErrorResponse.fromJson(json: response.data);
    }
  }

  @override
  Future<ReserveLabServiceSuccessResponse> postConfirmLabReservation(
      {required ConfirmLabReservation request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(
      request.serviceType == ServiceType.lab
          ? '${Constants.showLabsReservations}${Constants.confirmReservation}'
          : request.serviceType == ServiceType.scan
          ? '${Constants.scanReservation}${Constants.confirmReservation}'
          : '${Constants.showTherapyReservations}${Constants.confirmReservation}',
      data: request.toJson(),
    );
    if (response.statusCode == 200) {
      return ReserveLabServiceSuccessResponse.fromJson(
          response.data, request.serviceType);
    } else {
      throw ReserveLabServiceErrorResponse.fromJson(
        json: response.data,
      );
    }
  }

  //locations

  // @override
  // Future<FilterClinicLocationsSuccessResponse> filterClinicLocations(
  //     {required FilterLocationsRequest request}) async {
  //   dioHelper.addHeaders();
  //   final response = await dio.get(Constants.filterClinics,
  //       queryParameters: request.toJson());
  //   if (response.statusCode == 200) {
  //     return FilterClinicLocationsSuccessResponse.fromJson(
  //       jsonList: response.data,
  //     );
  //   } else {
  //     throw FilterClinicLocationsErrorResponse.fromJson(json: response.data);
  //   }
  // }

  // @override
  // Future<FilterLabsLocationsSuccessResponse> filterLabsLocations(
  //     {required FilterLocationsRequest request}) async {
  //   dioHelper.addHeaders();
  //   final response = await dio.get(
  //       request.serviceType == ServiceType.lab
  //           ? Constants.labLocation
  //           : request.serviceType == ServiceType.scan
  //               ? Constants.scanLocation
  //               : Constants.therapyLocation,
  //       queryParameters: request.toJson());
  //
  //   if (response.statusCode == 200) {
  //     return FilterLabsLocationsSuccessResponse.fromJson(
  //       jsonList: response.data,
  //       serviceType: request.serviceType!,
  //     );
  //   } else {
  //     throw FilterClinicLocationsErrorResponse.fromJson(json: response.data);
  //   }
  // }

  // @override
  // Future<FilterHospitalsLocationsResponse> filterHospitalsLocations(
  //     {required FilterLocationsRequest request}) async {
  //   dioHelper.addHeaders();
  //   final response = await dio.get(Constants.hospitalLocation,
  //       queryParameters: request.toJson());
  //
  //   if (response.statusCode == 200) {
  //     return FilterHospitalsLocationsResponse.fromJson(
  //       jsonList: response.data,
  //     );
  //   } else {
  //     throw FilterClinicLocationsErrorResponse.fromJson(json: response.data);
  //   }
  // }
  //
  // @override
  // Future<GetPharmacyResponse> filterPharmaciesLocations(
  //     {required FilterLocationsRequest request}) async {
  //   dioHelper.addHeaders();
  //   final response = await dio.get(Constants.getPharmacies,
  //       queryParameters: request.toJson());
  //   if (response.statusCode == 200) {
  //     return GetPharmacyResponse.fromJson(
  //       jsonList: response.data,
  //     );
  //   } else {
  //     throw GetPharmacyErrorResponse.fromJson(json: response.data);
  //   }
  // }





 //hospital
  @override
  Future<GetHospitalsBranchesResponse> getHospitalsBranches(
      {required GetHospitalsBranchesRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
      Constants.hospitalBranches,
      queryParameters: request.toJson(),
    );
    if (response.statusCode == 200) {
      return GetHospitalsBranchesResponse.fromJson(response.data);
    } else {
      throw GetHospitalsBranchesErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<GetHospitalsBranchesServiceResponse> getHospitalsServiceBranches(
      {required GetHospitalsServiceBranchesRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
      '${Constants.hospitalBranches}'
      '${request.branchesId}'
      '${Constants.hospitalServiceBranches}',
      queryParameters: request.toJson(),
    );
    if (response.statusCode == 200) {
      return GetHospitalsBranchesServiceResponse.fromJson(response.data);
    } else {
      throw GetHospitalsServiceBranchesErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<GetHospitalsReservationResponse> getHospitalReservation(
      {required GetHospitalReservationRequest request}) async {
    dioHelper.addHeaders();
    final stopwatch = Stopwatch()..start();
    final response = await dio.get(Constants.hospitalReservation,
        queryParameters: request.toJson());
    stopwatch.stop();
    // print('Function Execution Time : ${stopwatch.elapsed}');

    if (response.statusCode == 200) {
      return GetHospitalsReservationResponse.fromJson(response.data);
    } else {
      throw GetHospitalsReservationErrorResponse.fromJson(response.data);
    }
  }

  // @override
  // Future<MakeReservationResponse> postHospitalReservation(
  //     {required PostHospitalReservationRequest request}) async {
  //   dioHelper.addHeaders();
  //   final response = await dio.post(
  //     '${Constants.hospitalBranches}''${request.branchesId}''${Constants.hospitalServiceBranches}'
  //     '${request.branchServiceId}''${Constants.appointments}''${request.appointmentId}''${Constants.reserveLabService}',
  //   );
  //   if (response.statusCode == 200) {
  //     return MakeReservationResponse.fromJson(response.data);
  //   } else {
  //     throw GetHospitalsReservationErrorResponse.fromJson(response.data);
  //   }
  // }

  @override
  Future<HospitalReservationItem> cancelHospitalReservation(
      {required CancelHospitalReservationRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(
      '${Constants.hospitalReservation}' '${Constants.hospitalCancel}',
      data: request.toJson(),
    );
    if (response.statusCode == 200) {
      return HospitalReservationItem.fromJson(response.data);
    } else {
      throw GetHospitalsReservationErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<HospitalReservationItem> postConfirmHospitalReservation(
      {required ConfirmHospitalReservationRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(
      '${Constants.hospitalReservation}' '${Constants.confirmReservation}',
      data: request.toJson(),
    );
    if (response.statusCode == 200) {
      return HospitalReservationItem.fromJson(response.data);
    } else {
      throw GetHospitalsReservationErrorResponse.fromJson(response.data);
    }
  }


  //more details


  @override
  Future<GetContactUsResponse> getContactUs() async {
    final response = await dio.get(
      Constants.contactUs,

    );

    if (response.statusCode == 200) {
      return GetContactUsResponse.fromJson( response.data,);
    } else {
      throw GetContactUsErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<GetAboutUsResponse> getAboutUs() async {
    final response = await dio.get(
      Constants.aboutUs,

    );

    if (response.statusCode == 200) {
      return GetAboutUsResponse.fromJson( response.data, );
    } else {
      throw GetAboutUsErrorResponse.fromJson(response.data);
    }
  }



  @override
  Future<GetPackageResponse> getPackage({required PackageRequest request}) async {

    final response = await dio.get(
      Constants.package,
      queryParameters: request.toJson(),
    );

    if (response.statusCode == 200) {
      return GetPackageResponse.fromJson( response.data, );
    } else {
      throw GetPackageErrorResponse.fromJson(response.data);
    }
  }



  //cart

  @override
  Future<GetCartItemsResponse> getCartItems() async {

    final response = await dio.get(
      Constants.getCartItems,
    );

    if (response.statusCode == 200) {
      return GetCartItemsResponse.fromJson( response.data, );
    } else {
      throw GetCartItemsErrorResponse.fromJson(response.data);
    }
  }


  @override
  Future<Items> addToCart({required AddToCartRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(
      Constants.addToCart,
      data: request.toJson(),
    );

    if (response.statusCode == 201) {
      return Items.fromJson( response.data, );
    } else {
      throw AddToCartErrorResponse.fromJson(response.data);
    }
  }

  @override
  Future<PostCheckOutResponse> postCheckOut({required PostCheckOutRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.post(
      Constants.cartCheckOut,
      queryParameters: request.toJson()
    );

    if (response.statusCode == 200) {
      return PostCheckOutResponse.fromJson( response.data, );
    } else {
      throw PostCheckOutErrorResponse.fromJson(response.data);
    }
  }


  @override
  Future<GetPharmacyResponse> getPharmacy({required FilterLocationsRequest request}) async {
    dioHelper.addHeaders();
    final response = await dio.get(
      Constants.getPharmacies,queryParameters: request.toJson(),
    );

    if (response.statusCode == 200) {
      return GetPharmacyResponse.fromJson(  jsonList:  response.data, );
    } else {
      throw GetPharmacyErrorResponse.fromJson(response.data,);
    }
  }

}
