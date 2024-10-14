import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../custom_screen/widget/appointment_grid_view.dart';
import '../../orders_screen/cubit/labs_reservation/labs_reservation_cubit.dart';
import '../cubit/labs_cubit/labs_cubit.dart';
import 'lab_card.dart';




class LabBranchListView extends StatefulWidget {
  const LabBranchListView({super.key});

  @override
  State<LabBranchListView> createState() => _LabBranchListViewState();
}

class _LabBranchListViewState extends State<LabBranchListView> {

  final ScrollController _scrollController= ScrollController();

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: BlocBuilder<LabsCubit, LabsState>(
          builder: (context, state) {
            if (state is LabsLoadingState) {
              return const CustomShimmer();}

            else if (state is LabsLoadedState) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,

                itemBuilder: (context, index) => GestureDetector(
                  onTap: (){

                    sl<NavigationService>().navigateTo(Routes.appointmentScreen,

                        arguments: AppointmentArguments(
                          labServiceId: LabsCubit.get(context).labs[index].id,

                          appointments:LabsCubit.get(context).labs[index].appointmentModel?.appointment??[],
                        ));
                  },
                  child:LabCard(labsModel: state.labs[index],),),
                
                itemCount: state.labs.length,

              );
            }
            else if (state is LabsErrorState) {
              return Center(child: Text(state.error));
            }
            else {
              return Center(child: Image.asset("assets/images/noData.png"));
            }

          }),
    );
  }
}
