part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationEmpty extends NotificationState {}

final class NotificationSuccess extends NotificationState {
  final List<NotificationResultItem> notification;
  final bool reachedMax;
  final int nextPage;
  NotificationSuccess({required this.notification,required this.reachedMax,required this.nextPage});
  NotificationSuccess copyWith({List<NotificationResultItem>? notification,bool? reachedMax}){
    return NotificationSuccess(nextPage: nextPage,notification:notification??this.notification ,reachedMax: reachedMax??this.reachedMax,);
  }
}

final class NotificationError extends NotificationState {
  final String message;
  NotificationError({required this.message});

}
