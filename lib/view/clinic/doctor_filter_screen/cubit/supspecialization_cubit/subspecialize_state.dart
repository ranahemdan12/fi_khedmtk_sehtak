part of 'subspecialize_cubit.dart';


sealed class SubSpecializeState {}

final class SubSpecializeInitial extends SubSpecializeState {}


class SubSpecializeLoadingState extends SubSpecializeState {}

class SubSpecializeEmptyState extends SubSpecializeState {
  SubSpecializeEmptyState();
}

class SubSpecializeSuccessState extends SubSpecializeState {
  GetSubSpecializationModel model;


  SubSpecializeSuccessState({required this.model});
}

class SubSpecializeErrorState extends SubSpecializeState {
  final String? message;

  SubSpecializeErrorState({this.message});
}

