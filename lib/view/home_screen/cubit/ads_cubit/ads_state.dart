part of 'ads_cubit.dart';


abstract class AdsState {}

class AdsInitial extends AdsState {}

class AdsLoadingState extends AdsState {}

class AdsEmptyState extends AdsState {}

class AdsSuccessState extends AdsState {
  List<AdsModelItem>? adsList;
  bool? reachedMax;
  int? nextPage;
  String? error;
  AdsSuccessState({ this.adsList, this.reachedMax, this.nextPage,this.error});
  AdsSuccessState copyWith({List<AdsModelItem>? adsList,bool? reachedMax}){
    return AdsSuccessState(nextPage: nextPage,adsList:adsList??this.adsList ,reachedMax: reachedMax??this.reachedMax,
    );
  }
}
class AdsErrorState extends AdsState {
  final String? message;
  AdsErrorState({this.message});
}
