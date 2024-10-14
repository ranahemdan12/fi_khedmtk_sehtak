part of 'contact_cubit.dart';


sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class ContactLoading extends ContactState {}

final class ContactSuccess extends ContactState {
  final GetContactUsResponse getContactUsResponse;
  ContactSuccess({required this.getContactUsResponse});
}

final class ContactEmpty extends ContactState {}

final class ContactError extends ContactState {
  final String message;
  ContactError({required this.message});
}
