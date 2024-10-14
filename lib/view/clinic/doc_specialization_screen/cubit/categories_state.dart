part of 'categories_cubit.dart';


abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesEmptyState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  List<SpecializationResponseModel> categories;
  CategoriesSuccessState({required this.categories});
}
class CategoriesErrorState extends CategoriesState {
  final String? message;
  CategoriesErrorState({this.message});
}
