import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../data/local/local_data_source.dart';
import '../../../../models/request/clinic/get_clinics_by_speciality/get_clinics_by_speciality.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../models/response/clinic/get_specialization/get_specialization.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/service_locator.dart';
part 'doctors_in_speciality_state.dart';

class DoctorsInSpecialityCubit extends Cubit<DoctorsInSpecialityState> {
  DoctorsInSpecialityCubit({required this.repository}) : super(DoctorsInSpecialityInitial());

  Repository repository;
  static DoctorsInSpecialityCubit get(context) => BlocProvider.of(context);


  SpecializationResponseModel selectedSpeciality = SpecializationResponseModel();
  GetClinicsBySpecialityResponse getClinicsBySpecialityResponse = GetClinicsBySpecialityResponse();

  late BehaviorSubject<Map<String, dynamic>> searchControllerChannel;

  void initializeSearch() {
    debugPrint('------------------- initializeSearch ------------------');
    searchControllerChannel = BehaviorSubject<Map<String, dynamic>>();
    searchControllerChannel
        .debounce((_) => TimerStream(true, const Duration(seconds: 1)))
        .listen((searchData) {
      debugPrint(
          "------------------------ searchData: $searchData ------------------------");
      getClinicsInSpeciality(searchKey: searchData['searchValue'],page:searchData['searchPage']??1);
    });
  }

  List<ClinicsResultItem> clinicsList = [];
  int next = 1;
  bool reachedMax = false;

  resetClinicsSpeciality() {
    next = 1;
    clinicsList = [];
    reachedMax = false;
  }


  getClinicsInSpeciality(
      { bool? reset,
        String? gender, String? title, double? maxFees,
        double? minFees, String? orderBy,
        List<int>? subSpecialization,
        int? id,
        String? searchKey,
        int? page

      }) async {
    (reset == true || searchKey!=null && page==1) ? {resetClinicsSpeciality()} : {};

    if (!reachedMax || clinicsList.isEmpty) {
      clinicsList.isEmpty
          ? {
        emit(DoctorsInSpecialityLoading()),
      }
          : {};

      String token = sl<LocalDataSource>().getToken();
      if (token.isEmpty) {
        emit(DoctorsInSpecialityEmptyState());
        return;
      }
      final doctorBySpecialityFailure = await repository.
      getClinicsBySpeciality(
          requestModel: GetClinicsBySpecialityRequest(
              id: selectedSpeciality.id,
              gender: gender,
              title: title,
              minFees: minFees,
              maxFees: maxFees,
              subSpecialization: subSpecialization ?? [],
              orderBy: orderBy,
              page:page??next,
              search: searchKey,
          ));
      doctorBySpecialityFailure.fold(
              (failure) =>
              emit(DoctorsInSpecialityErrorState(message: failure.message)),
              (success) {
            reachedMax = success.next == null;
            getClinicsBySpecialityResponse = success;
            if (success.next != null) {
              RegExp regEx = RegExp(r'page=(\d+)');
              Match? match = regEx.firstMatch(success.next ?? "");
              if (match != null) {
                String? pageNumber = match.group(1);
                int? parsedNumber = int.tryParse(pageNumber.toString());
                next = parsedNumber ?? 0;
              }
            } else {
              next = 1;
            }

            clinicsList.addAll(success.result?.resultItem ?? []);
            emit(clinicsList.isEmpty
                ? DoctorsInSpecialityEmptyState()
                : DoctorsInSpecialitySuccessState(
              clinicsList: clinicsList, reachedMax: reachedMax, nextPage: next,


            ));
          }
      );
    } else {
      emit(state);
    }

  }


  setSelected({required SpecializationResponseModel speciality}) {
    selectedSpeciality = speciality;
  }



}




