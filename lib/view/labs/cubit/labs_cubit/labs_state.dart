part of 'labs_cubit.dart';


abstract class LabsState {}


class LabsInitialState extends LabsState {}

class LabsLoadingState extends LabsState {}

class LabsLoadedState extends LabsState {
  final List<LabsResultsItem> labs;
  final bool reachedMax;
  final int nextPage;
  LabsLoadedState({required this.labs,required this.reachedMax,required this.nextPage});
  LabsLoadedState copyWith({List<LabsResultsItem>? labs,bool? reachedMax}){
    return LabsLoadedState(nextPage: nextPage,labs:labs??this.labs ,reachedMax: reachedMax??this.reachedMax,);
  }
}

class LabsEmptyState extends LabsState {}

class LabsErrorState extends LabsState {
  final String error;
  LabsErrorState({required this.error});
}


