import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/notification_cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/notification_list.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key,}
      );

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

 // late   NotificationCubit notificationCubit;

  @override
  void initState() {
    NotificationCubit.get(context).getNotification(reset: true);
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  late final ScrollController _scrollController;



  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      NotificationCubit.get(context).getNotification();
    }
  }

 @override
 void dispose() {
   _scrollController
     ..removeListener(_onScroll)
     ..dispose();
   super.dispose();
 }


  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      text: StringManger.notification.tr(),
        body: Column(
          children: [
         SizedBox(height: 20.w,),
            Expanded(
              child: CustomScrollView(
                physics: const PageScrollPhysics(),
                controller: _scrollController,
                slivers:  const [
                 NotificationList(),
                ],
              ),
            ),

          ],

        )


    );
  }
}
