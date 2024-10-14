import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../data/local/local_data_source.dart';
import '../../../../models/request/hospitals/get_hospital_branches_service.dart';
import '../../../../models/response/hospitals/get_hospitals_branches.dart';
import '../../../../models/response/hospitals/get_hospitals_branches_service.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/enum.dart';
import '../../../../shared/statics/service_locator.dart';
part 'hospital_service_details_state.dart';





class HospitalServiceDetailsCubit extends Cubit<HospitalServiceDetailsState> {
  HospitalServiceDetailsCubit({required this.repository}) : super(HospitalServiceDetailsInitial());

  Repository repository;
  HospitalResultItem? hospitalResultItem;
  HospitalServiceEnum? hospitalServiceEnum ;
  AppointmentEnum? appointmentEnum;
  GetHospitalsBranchesServiceResponse? getHospitalsBranchesServiceResponse;


  static HospitalServiceDetailsCubit get(context) => BlocProvider.of(context);

  late BehaviorSubject<Map<String, dynamic>> searchControllerChannel;

  void initializeSearch() {
    debugPrint('------------------- initializeSearch ------------------');
    searchControllerChannel = BehaviorSubject<Map<String, dynamic>>();
    searchControllerChannel
        .debounce((_) => TimerStream(true, const Duration(seconds: 1)))
        .listen((searchData) {
      debugPrint(
          "------------------------ searchData: $searchData ------------------------");

      getHospitalsServiceBranches(searchKey: searchData['searchValue'],page:searchData['searchPage']??1);
    });

  }

  List<BranchServiceResultItem> branchesServiceList = [];
  int next = 1;
  bool reachedMax = false;
  int? clinicServiceId;


  resetHospitalsServiceBranches() {
    next = 1;
    branchesServiceList = [];
    reachedMax = false;
  }

  getHospitalsServiceBranches({bool? reset, int? page,String? searchKey,String?title,
    HospitalServiceEnum? type,int? clinicServiceSpecialization,

  })async{

    (reset == true || searchKey!=null && page==1) ? {resetHospitalsServiceBranches()} : {};

    if (!reachedMax || branchesServiceList.isEmpty) {
      branchesServiceList.isEmpty
          ? {
        emit(HospitalServiceDetailsLoading()),
      }
          : {};

      String token = sl<LocalDataSource>().getToken();
      if (token.isEmpty) {
        emit(HospitalServiceDetailsEmptyState());
        return;
      }
      final stopwatch = Stopwatch()..start();
      final stopwatchRequest = Stopwatch()..start();


      final hospitalsServiceBranchesFailure = await repository.getHospitalsServiceBranches(
          request: GetHospitalsServiceBranchesRequest(

            page:page??next,
            search: searchKey,
            title: title,
            branchesId:hospitalResultItem?.id,
            serviceType:  hospitalServiceEnum,
            clinicServiceSpecialization: clinicServiceId,

          ));
      stopwatch.stop();
      print('Function Execution Time : ${stopwatch.elapsed}');
      hospitalsServiceBranchesFailure.fold(
              (failure) =>
              emit(HospitalServiceDetailsError(message: failure.message)),
              (success) {
                getHospitalsBranchesServiceResponse =success;
            // reachedMax = success.next == null;
                reachedMax = success.next != null ? false : true;

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

            branchesServiceList.addAll(success.result?.branchService?? []);
            emit(branchesServiceList.isEmpty
                ? HospitalServiceDetailsEmptyState()
                : HospitalServiceDetailsSuccess(
              branchesServiceList: branchesServiceList, reachedMax: reachedMax, nextPage: next,


            ));
          }
      );

      stopwatchRequest.stop();
      print('Function Execution Time : ${stopwatchRequest.elapsed}');

    } else {
      emit(state);
    }



  }


}
