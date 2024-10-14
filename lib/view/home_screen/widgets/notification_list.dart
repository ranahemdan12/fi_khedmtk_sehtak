import 'package:fi_khedmtk_sehtak/view/home_screen/cubit/notification_cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/reusable_component.dart';
import 'notification_container.dart';



class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationSuccess) {
          return SliverList.builder(
            itemBuilder: (context, index) {
              return index >= state.notification.length &&
                      state.notification.isNotEmpty
                  ? const Center(child: CustomLoadingIndicator())
                  : NotificationContainer(
                      notificationResultItem: state.notification[index],
                    );
            },
            itemCount: state.reachedMax
                ? state.notification.length
                : state.notification.length + 1,
          );
        } else if (state is NotificationLoading) {
          return const CustomSliverShimmer();
        } else if (state is NotificationEmpty) {
          return SliverToBoxAdapter(
              child: Image.asset("assets/images/noData.png"));
        } else if (state is NotificationError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return SliverToBoxAdapter(
              child: Center(child: Image.asset("assets/images/noData.png")));
        }
      },
    );
  }
}
