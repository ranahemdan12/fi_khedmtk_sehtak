import 'package:fi_khedmtk_sehtak/models/request/labs/services_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../models/response/labs/services_response.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/enum.dart';
part 'labs_services_state.dart';




class LabsServicesCubit extends Cubit<LabsServicesState> {
  LabsServicesCubit({required this.repository}) : super(LabsServicesInitialState());

  ServiceType? serviceType;
  Repository repository;

  static LabsServicesCubit get(context) => BlocProvider.of(context);

  late BehaviorSubject<Map<String, dynamic>> searchControllerChannel;

  void initializeSearch() {
    debugPrint('------------------- initializeSearch ------------------');
    searchControllerChannel = BehaviorSubject<Map<String, dynamic>>();
    searchControllerChannel
        .debounce((_) => TimerStream(true, const Duration(seconds: 1)))
        .listen((searchData) {
      debugPrint(
          "------------------------ searchData: $searchData ------------------------");
      getLabsServices(page: searchData['searchPage']??1,searchKey: searchData['searchValue'],);
    });
  }

  List<LabServiceModel> services = [];
  int next = 1;
  bool reachedMax = false;

  resetLabsServices() {
    next = 1;
    services = [];
    reachedMax = false;
  }

  void getLabsServices({bool? reset, String? searchKey,int? page}) async {
    reset == true || (searchKey!=null && page==1) ? {resetLabsServices()} : {};

    if (!reachedMax || services.isEmpty) {
      services.isEmpty
          ? {
              emit(LabsServicesLoadingState()),
            }
          : {};

      final labsOrFailure = await repository.getLabsServices(
          request: LabsServicesRequest(page:page?? next, search: searchKey,
              serviceType: serviceType));

      labsOrFailure.fold(
        (failure) => emit(LabsServicesErrorState(error: failure.message ?? '')),
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
          }
          else {
            next = 1;
          }
          services.addAll(success.services );
          emit(services.isEmpty
              ? LabsServicesEmptyState()
              : LabsServicesLoadedState(
                  services: services, reachedMax: reachedMax, nextPage: next));
        },
      );
    } else {
      emit(state);
    }
  }
}
