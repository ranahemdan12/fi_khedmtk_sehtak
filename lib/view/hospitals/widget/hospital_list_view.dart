import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../cubit/hospital_cubit/hospitals_cubit.dart';
import '../cubit/hospital_service_details/hospital_service_details_cubit.dart';
import 'hospital_card.dart';


class HospitalListView extends StatefulWidget {
  const HospitalListView({super.key});

  @override
  State<HospitalListView> createState() => _HospitalListViewState();
}

class _HospitalListViewState extends State<HospitalListView> {
   final ScrollController _scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HospitalsCubit, HospitalsState>(
          builder: (context, state) {
            if (state is HospitalsLoading) {
              return const CustomShimmer();
            }
            else if (state is HospitalsSuccess) {
              return ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return index >= state.hospitalsList.length &&
                      state.hospitalsList.isNotEmpty
                      ? const CustomLoadingIndicator()
                      : GestureDetector(
                    onTap: () {
                      HospitalServiceDetailsCubit.get(context)
                          .hospitalResultItem =
                      state.hospitalsList[index];
                      sl<NavigationService>().navigateTo(
                          Routes.hospitalServices,
                          arguments: state.hospitalsList[index].hospital);

                      },
                        child: HospitalCard(hospitalResultItem: state.hospitalsList[index],),
                  );
                },
                itemCount: state.reachedMax
                    ? state.hospitalsList.length
                    : state.hospitalsList.length + 1,
              );
            }
            else if (state is HospitalsError) {
              return Center(child: Text('${state.message}'));
            } else {
              return Center(child: Image.asset("assets/images/noData.png"));
            }
          }),
    );
  }
}
