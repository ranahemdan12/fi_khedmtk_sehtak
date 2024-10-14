part of 'payment_filter_cubit.dart';

@immutable
sealed class PaymentFilterState {}

final class PaymentFilterInitial extends PaymentFilterState {}

final class PaymentFilterResetState extends PaymentFilterState {}