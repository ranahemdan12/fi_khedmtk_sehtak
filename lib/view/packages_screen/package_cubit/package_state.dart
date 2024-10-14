part of 'package_cubit.dart';

@immutable
sealed class PackageState {}

final class PackageInitial extends PackageState {}

final class PackageLoading extends PackageState {}

final class PackageEmpty extends PackageState {}

final class PackageSuccess extends PackageState {

  final List<PackageItem> packageItem;
  final bool reachMax;
  final int? nextPage;

  PackageSuccess({required this.nextPage,required this.packageItem,required this.reachMax});
  PackageSuccess copyWith({List<PackageItem>? packageItem, bool? reachMax}){

    return PackageSuccess(nextPage: nextPage, packageItem: packageItem?? this.packageItem, reachMax: reachMax??this.reachMax);
  }
}

final class PackageError extends PackageState {
 final String? message;

 PackageError({this.message});

}
