import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../models/request/notification/get_notification_request.dart';
import '../../../../models/response/notification/get_notification.dart';
import '../../../../repository/repository.dart';
part 'notification_state.dart';



class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({required this.repository}) : super(NotificationInitial());

   Repository? repository;
   static NotificationCubit get(context) => BlocProvider.of(context);


  List<NotificationResultItem> notification = [];
  int next = 1;
  bool reachedMax = false;

  resetNotification() {
    next = 1;
    notification = [];
    reachedMax = false;
  }



getNotification({bool? reset,int? page}) async{

  reset == true ? {resetNotification()} : {};

  if (!reachedMax || notification.isEmpty) {
    notification.isEmpty
        ? {
    emit(NotificationLoading()),
    } : {};

    final getNotification = await repository?.getNotification(request:
    GetNotificationRequest(
      page: page ?? next,));
    getNotification?.fold(
       (failure)=>emit(NotificationError(message: failure.message??"")),
      (success)
      {
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

      notification.addAll(success.result?.resultItem ?? []);
      emit(notification.isEmpty
          ? NotificationEmpty()
          : NotificationSuccess(nextPage:next ,notification:notification ,reachedMax:reachedMax ));

      }
      );
  }else {
    emit(state);

  }
}}
