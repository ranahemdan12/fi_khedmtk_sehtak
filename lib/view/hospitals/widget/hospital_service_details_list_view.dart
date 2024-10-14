import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../custom_screen/widget/appointment_grid_view.dart';
import '../cubit/hospital_service_details/hospital_service_details_cubit.dart';
import 'hospital_service_card.dart';

class HospitalServiceDetailsListView extends StatefulWidget {
  const HospitalServiceDetailsListView({super.key});

  @override
  State<HospitalServiceDetailsListView> createState() =>
      _HospitalServiceDetailsListViewState();
}

class _HospitalServiceDetailsListViewState
    extends State<HospitalServiceDetailsListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          BlocBuilder<HospitalServiceDetailsCubit, HospitalServiceDetailsState>(
              builder: (context, state) {
        if (state is HospitalServiceDetailsLoading) {
          return const CustomShimmer();
        } else if (state is HospitalServiceDetailsSuccess) {
          return ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              return index >= state.branchesServiceList.length &&
                      state.branchesServiceList.isNotEmpty
                  ? const CustomLoadingIndicator()
                  : Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () {
                          sl<NavigationService>().navigateTo(
                            Routes.appointmentScreen,
                            arguments: AppointmentArguments(
                              hospitalServiceId: HospitalServiceDetailsCubit.get(context)
                                      .getHospitalsBranchesServiceResponse?.result
                                      ?.branchService[index].id,
                              // AppointmentEnum.hospitals,
                              appointments: HospitalServiceDetailsCubit.get(context)
                                          .getHospitalsBranchesServiceResponse?.appointmentModel
                                          ?.appointment ?? [],
                            ),
                          );
                        },
                        child: HospitalServiceCard(
                          branchServiceResultItem:
                              state.branchesServiceList[index],
                        ),
                      ),
                    );
            },
            itemCount: state.reachedMax
                ? state.branchesServiceList.length
                : state.branchesServiceList.length + 1,
          );
        } else if (state is HospitalServiceDetailsError) {
          return Center(child: Text('${state.message}'));
        } else {
          return Center(child: Image.asset("assets/images/noData.png"));
        }
      }),
    );
  }
}
