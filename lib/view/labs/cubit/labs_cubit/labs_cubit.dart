import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/request/labs/labs_request.dart';
import '../../../../models/response/labs/labs_response.dart';
import '../../../../models/response/labs/services_response.dart';
import '../../../../repository/repository.dart';
import '../../../../shared/statics/enum.dart';
part 'labs_state.dart';


class LabsCubit extends Cubit<LabsState> {
  LabsCubit({required this.repository}) : super(LabsInitialState());

  Repository repository;
  ServiceType serviceType=ServiceType.lab;
  LabServiceModel? labsServiceModel;
  LabsBranches labsBranches=LabsBranches();

  static LabsCubit get(context) => BlocProvider.of(context);

  List<LabsResultsItem> labs = [];
  int next = 1;
  bool reachedMax = false;

  resetLabs() {
    next = 1;
    labs = [];
    reachedMax = false;
  }

  getLabs({bool? reset, int? city, int? region, double? maxFees,
      double? minFees, String? orderBy, int? page}) async {

    reset == true ? {resetLabs()} : {};

    if (!reachedMax || labs.isEmpty) {
      labs.isEmpty
          ? {
              emit(LabsLoadingState()),
            }
          : {};

      final labsOrFailure = await repository.getLabs(
          request: LabsRequest(
        page: page ?? next,
        serviceId: labsServiceModel?.id ?? 0,
        ordering: orderBy,
        maxFees: maxFees,
        minFees: minFees,
        city: city,
        region: region,
        serviceType: serviceType
      ));

      labsOrFailure.fold(
        (failure) => emit(LabsErrorState(error: failure.message ?? '')),
        (success) {
          reachedMax = success.next != null ? false : true;
          labsBranches=success;

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

          labs.addAll(success.results ?? []);
          emit(labs.isEmpty
              ? LabsEmptyState()
              : LabsLoadedState(
                  labs: labs, reachedMax: reachedMax, nextPage: next));
        },
      );
    } else {
      emit(state);
    }
  }
}
