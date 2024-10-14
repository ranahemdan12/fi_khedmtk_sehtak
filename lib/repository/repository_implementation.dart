import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/models/request/labs/cancel_lab_reservation.dart';
import 'package:fi_khedmtk_sehtak/models/response/get_ads/get_ads_model.dart';
import 'package:fi_khedmtk_sehtak/repository/repository.dart';
import 'package:flutter/material.dart';
import '../data/remote/remote_data_source.dart';
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
import '../models/request/filter_locations/filter_locations_request.dart';
import '../models/request/get_ads/get_ads.dart';
import '../models/request/get_region/get_region_request.dart';
import '../models/request/hospitals/cancel_hospital_reservation.dart';
import '../models/request/hospitals/confirm_hospital_reservation.dart';
import '../models/request/hospitals/get_hospital_branches_service.dart';
import '../models/request/hospitals/get_hospitals_request.dart';
import '../models/request/labs/confirm_lab_reservation.dart';
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
import '../models/response/get_citiy/get_city_response.dart';
import '../models/response/get_region/get_region_response.dart';
import '../models/response/hospitals/get_hospital_reservation.dart';
import '../models/response/hospitals/get_hospitals_branches.dart';
import '../models/response/hospitals/get_hospitals_branches_service.dart';
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
import '../shared/resources/strings_manger.dart';
import '../shared/statics/error_handler.dart';
import '../shared/statics/internet_checker.dart';



class RepositoryImpl extends Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({required this.networkInfo, required this.remoteDataSource});

  //auth
  @override
  Future<Either<LoginErrorResponseModel, LoginSuccessResponseModel>> login(
      {required LoginRequestModel requestModel}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final login = await remoteDataSource.login(request: requestModel);

        return Right(login);
      } catch (error) {
        debugPrint(
            '-------------- on LoginErrorResponse error: $error --------------');
        return left(LoginErrorResponseModel(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return left(
          LoginErrorResponseModel(message: StringManger.noInternetConn.tr()));
    }
  }



  @override
  Future<Either<FcmLogoutErrorResponse, FcmLogoutResponse>> logout() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final logout = await remoteDataSource.logout();

        return Right(logout);
      } catch (error) {
        debugPrint(
            '-------------- on logoutErrorResponse error: $error --------------');
        return left(FcmLogoutErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return left(
          FcmLogoutErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }



  @override
  Future<Either<SignUpErrorResponseModel, SignUpSuccessResponseModel>> signup(
      {required SignUpRequestModel requestModel}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final register = await remoteDataSource.signup(request: requestModel);

        return Right(register);
      } on SignUpErrorResponseModel catch (error) {
        debugPrint('-------------- on signup error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- on signuperror: $error --------------');
        return Left(SignUpErrorResponseModel(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      // no internet connection error
      return Left(
          SignUpErrorResponseModel(message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<FcmRegisterErrorResponse, FcmRegisterResponse>> postFcm(
      {required FcmRegisterRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final postFcm = await remoteDataSource.postFcm(request: request);

        return Right(postFcm);
      } on FcmRegisterErrorResponse catch (error) {
        debugPrint('-------------- on FcmRegisterErrorResponse error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- on FcmRegisterErrorResponse: $error --------------');
        return Left(FcmRegisterErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      // no internet connection error
      return Left(
          FcmRegisterErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<Either<GetNotificationErrorResponse, GetNotificationResponse>> getNotification(
      {required GetNotificationRequest request} ) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getNotification = await remoteDataSource.getNotification(
            request: request
        );

        return Right(getNotification);
      } on GetNotificationErrorResponse catch (error) {
        debugPrint('-------------- on GetNotificationErrorResponse: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- on GetNotificationErrorResponse: $error --------------');
        return Left(GetNotificationErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      // no internet connection error
      return Left(
          GetNotificationErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<Either<String, RestPassResponseModel>> resetPassword(
      {required ResetPassRequestModel requestModel}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final register = await remoteDataSource.resetPassword(
          request: requestModel,
        );

        return Right(register);
      } catch (error) {
        debugPrint(
            '-------------- on resetPassword error: $error --------------');
        return Left(ErrorHandler.handle(error).failure);
      } /* catch (error) {
        debugPrint(
            '-------------- on ownerRegisterErrorResponse error: $error --------------');

      }*/
    } else {
      // no internet connection error
      return  Left(StringManger.noInternetConn.tr());
    }
  }

  @override
  Future<Either<VerifyOtpErrorResponseModel, VerifyOtpResponseModel>>
      verifyOtpRequest({required VerifyOtpRequestModel requestModel}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final register = await remoteDataSource.verifyOtpRequest(
          request: requestModel,
        );

        return Right(register);
      } on VerifyOtpErrorResponseModel catch (error) {
        debugPrint(
            '-------------- on verifyOtpRequest error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- on verifyOtpRequest error: $error --------------');
        return Left(VerifyOtpErrorResponseModel(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      // no internet connection error
      return Left(
          VerifyOtpErrorResponseModel(message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<String, ForgetPasswordResModel>> forgetPassword(
      {required ForgetPasswordReqModel requestModel}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final register = await remoteDataSource.forgetPassword(
          request: requestModel,
        );

        return Right(register);
      } catch (error) {
        debugPrint(
            '-------------- on forgetPassword error: $error --------------');
        return Left(ErrorHandler.handle(error).failure);
      } /* catch (error) {
        debugPrint(
            '-------------- on ownerRegisterErrorResponse error: $error --------------');

      }*/
    } else {
      // no internet connection error
      return  Left(StringManger.noInternetConn.tr());
    }
  }

  @override
  Future<Either<ChangePasswordErrorResponse, ChangePasswordResponse>> changePassword(
      {required ChangePasswordRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final changePassword = await remoteDataSource.changePassword(
          request: request,
        );

        return Right(changePassword);
      } on ChangePasswordErrorResponse catch (error) {
        debugPrint(
            '-------------- on ChangePasswordErrorResponse error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '--------------ChangePasswordErrorResponse: $error --------------');
        return Left(ChangePasswordErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          ChangePasswordErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<ProfileErrorResponse, ProfileSuccessResponseModel>>
      profile() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final userProfile = await remoteDataSource.profile();
        return Right(userProfile);
      } on ProfileErrorResponse catch (error) {
        debugPrint(
            '-------------- on firstUserProfileErrorResponse error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- userProfile error: $error --------------');
        return Left(
            ProfileErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(ProfileErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<Either<PatchProfileErrorResponse, PatchProfileResponse>>
  patchProfile({required PatchProfileRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final patchProfile = await remoteDataSource.patchProfile(request: request);
        return Right(patchProfile);
      } on PatchProfileErrorResponse catch (error) {
        debugPrint(
            '-------------- on PatchProfileErrorResponse error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- PatchProfileErrorResponse error: $error --------------');
        return Left(
            PatchProfileErrorResponse(message: ErrorHandler.handle(error).failure
          ) );
      }

    } else {
      return Left(PatchProfileErrorResponse(message:StringManger.noInternetConn.tr() ));

    }
  }


  @override
  Future<Either<GetGovernoratesErrorResponse, GetCityResponseModel>>
      getGovernorates() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getGovernorates = await remoteDataSource.getCity();
        return Right(getGovernorates);
      } on GetGovernoratesErrorResponse catch (error) {
        debugPrint(
            '-------------- on getGovernoratesResponse error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- getGovernorates error: $error --------------');
        return Left(GetGovernoratesErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetGovernoratesErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<GetAdsErrorResponse, GetAdsSuccessResponseModel>> getAds({
    required  GetAdsRequest request
   }) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final ads = await remoteDataSource.getAds(request: request);
        return Right(ads);
      } on GetAdsErrorResponse catch (error) {
        debugPrint(
            '-------------- on AdsErrorResponse error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- ads Error: $error --------------');
        return Left(
            GetAdsErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(GetAdsErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<SpecializationErrorResponse, SpecializationSuccessResponseModel>>
      categories() async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final category = await remoteDataSource.specialization();
        return Right(category);
      } on SpecializationErrorResponse catch (error) {
        debugPrint(
            '-------------- on CategoryErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- category Error: $error --------------');
        return Left(SpecializationErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          SpecializationErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<Either<SubSpecializationErrorResponse, GetSubSpecializationModel>> subCategories({required int id}) async{
    final bool isConnected = await networkInfo.isConnected;
    if(isConnected){
      try{
        final subCategory = await remoteDataSource.subSpecialization(id:id );
        return Right(subCategory);
      } on SubSpecializationErrorResponse catch (error){
        debugPrint('----------------- on subCategoryErrorResponse error $error -------------');
        return Left(error);
      } catch (error){
        debugPrint('--------------------- subCategory Error: $error ----------------');
        return Left(SubSpecializationErrorResponse(
            message: ErrorHandler.handle(error).failure
        ));
      }
    }else {
      return Left(SubSpecializationErrorResponse(
          message: StringManger.noInternetConn.tr()
      ));
    }
  }

  @override
  Future<Either<GetCitiesErrorResponse, GetRegionResponse>> getCities(
      {required GetRegionReqModel requestModel}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getCities = await remoteDataSource.getRegion(
          request: requestModel,
        );
        return Right(getCities);
      } on GetCitiesErrorResponse catch (error) {
        debugPrint('-------------- on getCities error: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- getCities error: $error --------------');
        return Left(GetCitiesErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(GetCitiesErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }





  @override
  Future<
      Either<GetClinicsBySpecialityErrorResponse,
          GetClinicsBySpecialityResponse>> getClinicsBySpeciality(
      {required GetClinicsBySpecialityRequest requestModel}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getClinicsBySpeciality =
            await remoteDataSource.getClinicsBySpeciality(
          request: requestModel,
        );
        return Right(getClinicsBySpeciality);
      } on GetClinicsBySpecialityErrorResponse catch (error) {
        debugPrint(
            '-------------- on getClinicsBySpeciality: $error --------------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- getClinicsBySpeciality error: $error --------------');
        return Left(GetClinicsBySpecialityErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(GetClinicsBySpecialityErrorResponse(
          message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<LabsErrorResponse, LabsBranches>> getLabs(
      {required LabsRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final labs = await remoteDataSource.getLabs(request: request);
        return Right(labs);
      } on LabsErrorResponse catch (error) {
        debugPrint('-------------- on get Labs error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint('-------------- get Labs: $error --------------');
        return Left(
            LabsErrorResponse(message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(LabsErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<LabsServicesErrorResponse, LabsServicesSuccessResponse>>
      getLabsServices({required LabsServicesRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final labsServices =
            await remoteDataSource.getLabServices(request: request);
        return Right(labsServices);
      } on LabsServicesErrorResponse catch (error) {
        debugPrint(
            '-------------- on get Labs Services error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- get get Labs Services: $error --------------');
        return Left(LabsServicesErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          LabsServicesErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }

  // @override
  // Future<
  //     Either<MakeReservationErrorResponse,
  //         MakeReservationResponse>> reserveLabService(
  //     {required ReserveLabServiceRequest request}) async {
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final reserveLabService =
  //           await remoteDataSource.reserveLabService(request: request);
  //       return Right(reserveLabService);
  //     } on MakeReservationErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on reserve Lab Service error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '--------------  reserve Lab Service Services: $error --------------');
  //       return Left(MakeReservationErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(
  //         MakeReservationErrorResponse(message: StringManger.noInternetConn.tr()));
  //   }
  // }

  // @override
  // Future<
  //     Either<FilterClinicLocationsErrorResponse,
  //         FilterClinicLocationsSuccessResponse>> filterClinicLocations(
  //     {required FilterLocationsRequest request}) async {
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final filterClinicLocations =
  //           await remoteDataSource.filterClinicLocations(request: request);
  //       return Right(filterClinicLocations);
  //     } on FilterClinicLocationsErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on filter Clinic Locations error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '-------------- get filter Clinic Locations Services: $error --------------');
  //       return Left(FilterClinicLocationsErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(FilterClinicLocationsErrorResponse(
  //         message: StringManger.noInternetConn.tr()));
  //   }
  // }



  // @override
  // Future<
  //     Either<FilterClinicLocationsErrorResponse,
  //         FilterLabsLocationsSuccessResponse>> filterLabsLocations(
  //     {required FilterLocationsRequest request}) async {
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final filterLabsLocations =
  //       await remoteDataSource.filterLabsLocations(request: request);
  //       return Right(filterLabsLocations);
  //     } on FilterClinicLocationsErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on filterLabsLocations error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '-------------- get filterLabsLocations Services: $error --------------');
  //       return Left(FilterClinicLocationsErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(FilterClinicLocationsErrorResponse(
  //         message: StringManger.noInternetConn.tr()));
  //   }
  // }
  //

  //
  // @override
  // Future<
  //     Either<FilterClinicLocationsErrorResponse,
  //         FilterHospitalsLocationsResponse>> filterHospitalsLocations(
  //     {required FilterLocationsRequest request}) async {
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final filterHospitalsLocations =
  //       await remoteDataSource.filterHospitalsLocations(request: request);
  //       return Right(filterHospitalsLocations);
  //     } on FilterClinicLocationsErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on filterHospitalsLocations: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '-------------- get filterHospitalsLocations: $error --------------');
  //       return Left(FilterClinicLocationsErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(FilterClinicLocationsErrorResponse(
  //         message: StringManger.noInternetConn.tr()));
  //   }
  // }



  // @override
  // Future<
  //     Either<GetPharmacyErrorResponse,
  //         GetPharmacyResponse>> filterPharmaciesLocations(
  //     {required FilterLocationsRequest request}) async {
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final filterPharmaciesLocations =
  //       await remoteDataSource.filterPharmaciesLocations(request: request);
  //       return Right(filterPharmaciesLocations);
  //     } on GetPharmacyErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on GetPharmacyErrorResponse: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '-------------- GetPharmacyErrorResponse: $error --------------');
  //       return Left(GetPharmacyErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(GetPharmacyErrorResponse(
  //         message: StringManger.noInternetConn.tr()));
  //   }
  // }


  @override
  Future<
      Either<ReserveLabServiceErrorResponse,
          ReserveLabServiceSuccessResponse>> cancelLabReservations(
      {required CancelReservationRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final cancelLabReservations =
            await remoteDataSource.cancelLabReservation(request: request);
        return Right(cancelLabReservations);
      } on ReserveLabServiceErrorResponse catch (error) {
        debugPrint(
            '-------------- on cancel Lab Reservations error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- cancel Lab Reservations Services: $error --------------');
        return Left(ReserveLabServiceErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(ReserveLabServiceErrorResponse(
          message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<
      Either<ReserveLabServiceErrorResponse,
          ReserveLabServiceSuccessResponse>> postConfirmLabReservation(
      {required ConfirmLabReservation request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final confirmLabReservation =
        await remoteDataSource.postConfirmLabReservation(request: request);
        return Right(confirmLabReservation);
      } on ReserveLabServiceErrorResponse catch (error) {
        debugPrint(
            '-------------- on ConfirmLabReservation error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- ConfirmLabReservation: $error --------------');
        return Left(ReserveLabServiceErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(ReserveLabServiceErrorResponse(
          message: StringManger.noInternetConn.tr()));
    }
  }



  @override
  Future<
      Either<GetDoctorReservationErrorResponse,
          DoctorReservationItem>> postConfirmDoctorReservation(
      {required ConfirmReservationRequest request}) async {
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final  postConfirmDoctorReservation =
        await remoteDataSource.postConfirmDoctorReservation(request: request);
        return Right( postConfirmDoctorReservation);
      } on GetDoctorReservationErrorResponse catch (error) {
        debugPrint(
            '-------------- on GetDoctorReservationErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- GetDoctorReservationErrorResponse: $error --------------');
        return Left(GetDoctorReservationErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(GetDoctorReservationErrorResponse(
          message: StringManger.noInternetConn.tr()));
    }
  }

  // @override
  // Future<Either<LabsReservationsErrorResponse, LabsReservationsSuccessResponse>>
  //     getLabReservations({required GetReservationsRequest request}) async {
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final getReservations =
  //           await remoteDataSource.getLabsReservations(request: request);
  //       return Right(getReservations);
  //     } on LabsReservationsErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on get Lab Reservations error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '--------------  get Lab Reservations Services: $error --------------');
  //       return Left(LabsReservationsErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(
  //         LabsReservationsErrorResponse(message: StringManger.noInternetConn.tr()));
  //   }
  // }



  // @override
  // Future<Either<GetDoctorReservationErrorResponse, GetDoctorReservationResponse>>
  // getDoctorReservation(
  //     {required GetDoctorReservationRequest requestModel}
  //     ) async {
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final getDoctorReservations =
  //       await remoteDataSource.getDoctorReservation(
  //           request: requestModel
  //       );
  //       return Right(getDoctorReservations);
  //     } on GetDoctorReservationErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on GetDoctorReservationErrorResponse error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '--------------  GetDoctorReservationErrorResponse: $error --------------');
  //       return Left(GetDoctorReservationErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(
  //         GetDoctorReservationErrorResponse(message: StringManger.noInternetConn.tr()));
  //   }
  // }

  // @override
  // Future<Either<MakeReservationErrorResponse, MakeReservationResponse>> postDoctorReservation({
  //   required PostDoctorReservation requestModel}) async{
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final postDoctorReservations =
  //       await remoteDataSource.postDoctorReservation(request: requestModel);
  //       return Right(postDoctorReservations);
  //     } on MakeReservationErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on PostDoctorReservationErrorResponse error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '-------------- PostDoctorReservationErrorResponse: $error --------------');
  //       return Left(MakeReservationErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(
  //         MakeReservationErrorResponse(message: StringManger.noInternetConn.tr()));
  //   }
  // }

  @override
  Future<Either<GetDoctorReservationErrorResponse, DoctorReservationItem>> cancelClinicReservation({required appointmentId}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final cancelClinicReservationError =
            await remoteDataSource.cancelClinicReservation( appointmentId: appointmentId);
        return Right(cancelClinicReservationError);
      } on GetDoctorReservationErrorResponse catch (error) {
        debugPrint(
            '-------------- on CancelClinicReservationErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- CancelClinicReservationErrorResponse: $error --------------');
        return Left(GetDoctorReservationErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetDoctorReservationErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<Either<GetHospitalsBranchesErrorResponse, GetHospitalsBranchesResponse>> getHospitalsBranches({
    required GetHospitalsBranchesRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getHospitalsBranches =
        await remoteDataSource.getHospitalsBranches(request: request);
        return Right(getHospitalsBranches);
      } on GetHospitalsBranchesErrorResponse catch (error) {
        debugPrint(
            '-------------- on getHospitalsBranchesErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- getHospitalsBranchesErrorResponse: $error --------------');
        return Left(GetHospitalsBranchesErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetHospitalsBranchesErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<Either<GetHospitalsServiceBranchesErrorResponse, GetHospitalsBranchesServiceResponse>> getHospitalsServiceBranches({
    required GetHospitalsServiceBranchesRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getHospitalsServiceBranches =
        await remoteDataSource.getHospitalsServiceBranches(request: request);
        return Right(getHospitalsServiceBranches);
      } on GetHospitalsServiceBranchesErrorResponse catch (error) {
        debugPrint(
            '-------------- on getHospitalsServiceBranches error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- getHospitalsServiceBranches: $error --------------');
        return Left(GetHospitalsServiceBranchesErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetHospitalsServiceBranchesErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }



  //
  // @override
  // Future<Either<GetHospitalsReservationErrorResponse, GetHospitalsReservationResponse>> getHospitalReservation({
  //   required GetHospitalReservationRequest request}) async{
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final getHospitalReservation =
  //       await remoteDataSource.getHospitalReservation(request: request);
  //       return Right(getHospitalReservation);
  //     } on GetHospitalsReservationErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on GetHospitalsReservationErrorResponse error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '-------------- GetHospitalsReservationErrorResponse: $error --------------');
  //       return Left(GetHospitalsReservationErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(
  //         GetHospitalsReservationErrorResponse(message: StringManger.noInternetConn.tr()));
  //   }
  // }

  // @override
  // Future<Either<MakeReservationErrorResponse, MakeReservationResponse>> postHospitalReservation({
  //   required PostHospitalReservationRequest request}) async{
  //   final bool isConnected = await networkInfo.isConnected;
  //   if (isConnected) {
  //     try {
  //       final postHospitalReservation =
  //       await remoteDataSource.postHospitalReservation(request: request);
  //       return Right(postHospitalReservation);
  //     } on MakeReservationErrorResponse catch (error) {
  //       debugPrint(
  //           '-------------- on postHospitalsReservationErrorResponse error: $error----------');
  //       return Left(error);
  //     } catch (error) {
  //       debugPrint(
  //           '-------------- postHospitalsReservationErrorResponse: $error --------------');
  //       return Left(MakeReservationErrorResponse(
  //           message: ErrorHandler.handle(error).failure));
  //     }
  //   } else {
  //     return Left(
  //         MakeReservationErrorResponse(message: StringManger.noInternetConn.tr()));
  //   }
  // }


  @override
  Future<Either<GetHospitalsReservationErrorResponse, HospitalReservationItem>> cancelHospitalReservation({
    required CancelHospitalReservationRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final cancelHospitalReservation =
        await remoteDataSource.cancelHospitalReservation(request: request);
        return Right(cancelHospitalReservation);
      } on GetHospitalsReservationErrorResponse catch (error) {
        debugPrint(
            '-------------- on cancelHospitalReservationErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- cancelHospitalReservationErrorResponse: $error --------------');
        return Left(GetHospitalsReservationErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetHospitalsReservationErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }




  @override
  Future<Either<GetHospitalsReservationErrorResponse, HospitalReservationItem>> postConfirmHospitalReservation({
    required ConfirmHospitalReservationRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final postConfirmHospitalReservation =
        await remoteDataSource.postConfirmHospitalReservation(request: request);
        return Right(postConfirmHospitalReservation);
      } on GetHospitalsReservationErrorResponse catch (error) {
        debugPrint(
            '-------------- on postConfirmHospitalReservationErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- postConfirmHospitalReservationErrorResponse: $error --------------');
        return Left(GetHospitalsReservationErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetHospitalsReservationErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


// more details
  @override
  Future<Either<GetContactUsErrorResponse, GetContactUsResponse>> getContactUs() async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getContactUs =
        await remoteDataSource.getContactUs();
        return Right(getContactUs);
      } on GetContactUsErrorResponse catch (error) {
        debugPrint(
            '-------------- on getContactUsErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- getContactUsErrorResponse: $error --------------');
        return Left(GetContactUsErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetContactUsErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }

  @override
  Future<Either<GetAboutUsErrorResponse, GetAboutUsResponse>> getAboutUs() async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getAboutUs =
        await remoteDataSource.getAboutUs();
        return Right(getAboutUs);
      } on GetAboutUsErrorResponse catch (error) {
        debugPrint(
            '-------------- on getAboutUsErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- getAboutUsErrorResponse: $error --------------');
        return Left(GetAboutUsErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetAboutUsErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }



  @override
  Future<Either<GetPackageErrorResponse, GetPackageResponse>> getPackage({
    required PackageRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getPackage =
        await remoteDataSource.getPackage(request: request);
        return Right(getPackage);
      } on GetPackageErrorResponse catch (error) {
        debugPrint(
            '-------------- on getPackageErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- getPackageResponse: $error --------------');
        return Left(GetPackageErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetPackageErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }



  //cart

  @override
  Future<Either<GetCartItemsErrorResponse, GetCartItemsResponse>> getCartItems() async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getCartItems =
        await remoteDataSource.getCartItems();
        return Right(getCartItems);
      } on GetCartItemsErrorResponse catch (error) {
        debugPrint(
            '-------------- on GetCartItemsErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- GetCartItemsErrorResponse: $error --------------');
        return Left(GetCartItemsErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetCartItemsErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }


  @override
  Future<Either<AddToCartErrorResponse, Items>> addToCart({required AddToCartRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final addToCart =
        await remoteDataSource.addToCart(request: request);
        return Right(addToCart);
      } on AddToCartErrorResponse catch (error) {
        debugPrint(
            '-------------- on AddToCartErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- AddToCartErrorResponse: $error --------------');
        return Left(AddToCartErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          AddToCartErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }



  @override
  Future<Either<PostCheckOutErrorResponse, PostCheckOutResponse>> postCheckOut({required PostCheckOutRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final postCheckOut =
        await remoteDataSource.postCheckOut(request: request);
        return Right(postCheckOut);
      } on PostCheckOutErrorResponse catch (error) {
        debugPrint(
            '-------------- on PostCheckOutErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- PostCheckOutErrorResponse: $error --------------');
        return Left(PostCheckOutErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          PostCheckOutErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }



  @override
  Future<Either<GetPharmacyErrorResponse, GetPharmacyResponse>> getPharmacy({required FilterLocationsRequest request}) async{
    final bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final getPharmacy =
        await remoteDataSource.getPharmacy(request: request);
        return Right(getPharmacy);
      } on GetPharmacyErrorResponse catch (error) {
        debugPrint(
            '-------------- on GetPharmacyErrorResponse error: $error----------');
        return Left(error);
      } catch (error) {
        debugPrint(
            '-------------- GetPharmacyErrorResponse: $error --------------');
        return Left(GetPharmacyErrorResponse(
            message: ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(
          GetPharmacyErrorResponse(message: StringManger.noInternetConn.tr()));
    }
  }
}
