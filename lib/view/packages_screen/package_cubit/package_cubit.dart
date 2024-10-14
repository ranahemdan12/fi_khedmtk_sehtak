import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/local/local_data_source.dart';
import '../../../models/request/package/package_request.dart';

import '../../../models/response/package/get_package.dart';
import '../../../repository/repository.dart';
import '../../../shared/statics/service_locator.dart';

part 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit({required this.repository}) : super(PackageInitial());

  Repository repository;
  static PackageCubit get(context) => BlocProvider.of(context);


  List<PackageItem> packageItem = [];
  int next = 1;
  bool reachedMax = false;

  resetPackage() {
    next = 1;
    packageItem = [];
    reachedMax = false;
  }

  getPackage({bool? reset, int? id, int? page}) async {
    (reset == true) ? {resetPackage()} : {};

    if (!reachedMax || packageItem.isEmpty) {
      packageItem.isEmpty
          ? {
              emit(PackageLoading()),
            }
          : {};

      String token = sl<LocalDataSource>().getToken();
      if (token.isEmpty) {
        emit(PackageEmpty());
        return;
      }
      final packageOrFailure = await repository.getPackage(
          request: PackageRequest(
        page: page ?? next,
      ));
      packageOrFailure.fold(
          (failure) => emit(PackageError(message: failure.message)), (success) {
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

        packageItem.addAll(success.result?.resultItem ?? []);
        emit(packageItem.isEmpty
            ? PackageEmpty()
            : PackageSuccess(
                packageItem: packageItem,
                nextPage: next,
                reachMax: reachedMax,
              ));
      });
    } else {
      emit(state);
    }
  }
}
