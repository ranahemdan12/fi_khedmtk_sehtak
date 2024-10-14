import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../doctors_in_speciality_screen/cubit/doctors_in_speciality_cubit.dart';
import '../cubit/doctor_filter_cubit/doctor_filter_cubit.dart';
import '../cubit/supspecialization_cubit/subspecialize_cubit.dart';


class SubSpecialityListView extends StatefulWidget {
   const SubSpecialityListView({super.key,});

  @override
  State<SubSpecialityListView> createState() => _SubSpecialityListViewState();
}


class _SubSpecialityListViewState extends State<SubSpecialityListView> {
 bool isChecked = false;


  @override
  void initState() {
    super.initState();
    SubSpecializeCubit.get(context).getSubSpecialization(DoctorsInSpecialityCubit.get(context).selectedSpeciality.id ?? 0);
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SubSpecializeCubit, SubSpecializeState>(
      builder: ( context,  state) {
        if (state is SubSpecializeLoadingState) {
          return const CustomShimmer();
        }
        else if(state is SubSpecializeSuccessState) {
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Column(
              children: [
                CheckboxListTile(
                    title: Text( "${state.model.subCategories[index].name} ",),
                    value: DoctorFilterCubit.get(context).selectedSubSpecializations.contains(state.model.subCategories[index].id),
                    activeColor: ColorManger.blueColor,
                    onChanged: (value) {

                       DoctorFilterCubit.get(context).toggleSelected(state.model.subCategories[index].id??0);

                      setState(() {
                        isChecked = value!;
                      });
                    }),
                // SizedBox(height: 8.h,),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 21, end: 30),
                  child: Divider(
                    color: ColorManger.dividerColor,
                  ),
                ),
              ],
            ),
            itemCount: state.model.subCategories.length,
          );
        }
        else if (state is SubSpecializeErrorState) {
          return Center(child: Text('${state.message}'));
        } else {
          return Center(child: Image.asset("assets/images/noData.png"));
        }
      },

    );
  }
}
