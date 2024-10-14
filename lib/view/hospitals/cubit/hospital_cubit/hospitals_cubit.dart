import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../data/local/local_data_source.dart';
import '../../../../models/request/hospitals/get_hospitals_request.dart';
import '../../../../models/response/hospitals/get_hospitals_branches.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/service_locator.dart';
part 'hospitals_state.dart';




class HospitalsCubit extends Cubit<HospitalsState> {
  HospitalsCubit({required this.repository}) : super(HospitalsInitial());
  Repository repository;

  static HospitalsCubit get(context) => BlocProvider.of(context);

  GetHospitalsBranchesResponse?  hospitalsBranchesModel;



  late BehaviorSubject<Map<String, dynamic>> searchControllerChannel;

  void initializeSearch() {
    debugPrint('------------------- initializeSearch ------------------');
    searchControllerChannel = BehaviorSubject<Map<String, dynamic>>();
    searchControllerChannel
        .debounce((_) => TimerStream(true, const Duration(seconds: 1)))
        .listen((searchData) {
      debugPrint(
          "------------------------ searchData: $searchData ------------------------");

    getHospitalsBranches(searchKey: searchData['searchValue'],page:searchData['searchPage']??1);
    });

  }

  List<HospitalResultItem> hospitalsList = [];
  int next = 1;
  bool reachedMax = false;

  resetHospitalsBranches() {
    next = 1;
    hospitalsList = [];
    reachedMax = false;
  }

  getHospitalsBranches({bool? reset, int? page,String? searchKey,
    int?city, int?region

  })async{
    (reset == true || searchKey!=null && page==1) ? {resetHospitalsBranches()} : {};

    if (!reachedMax || hospitalsList.isEmpty) {
      hospitalsList.isEmpty
          ? {
        emit(HospitalsLoading()),
      }
          : {};

      String token = sl<LocalDataSource>().getToken();
      if (token.isEmpty) {
        emit(HospitalsEmptyState());
        return;
      }
      final hospitalsBranchesOrFailure = await repository.getHospitalsBranches(
          request: GetHospitalsBranchesRequest(
        page:page??next,
        search: searchKey,
        city:city ,
        region: region,
      ));
      hospitalsBranchesOrFailure.fold(
              (failure) => emit(HospitalsError(message: failure.message)),
              (success) {
            reachedMax = success.next == null;

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

            hospitalsList.addAll(success.result?.hospitalResultItem ?? []);
            emit(hospitalsList.isEmpty
                ? HospitalsEmptyState()
                : HospitalsSuccess(
              hospitalsList: hospitalsList, reachedMax: reachedMax, nextPage: next,


            ));
          }
      );
    } else {
      emit(state);
    }



  }



}




