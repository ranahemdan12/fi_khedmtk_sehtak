import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/resources/strings_manger.dart';
import '../../../../../shared/statics/reusable_component.dart';
import '../../about_screen/cubit/about_cubit.dart';


class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  void initState() {
    AboutCubit.get(context).getAbout();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.privacyPolicy.tr(),
      body:  BlocBuilder<AboutCubit,AboutState>(
        builder: (context,state){
          if(state is AboutLoading){
            return const Center(child: CustomLoadingIndicator());
          }
          else if(state is AboutSuccess
          ){
            return   Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 26,vertical: 20),
              child: Column(children: [
                Text(state.getAboutUsResponse.privacy??'',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w500),)
              ]),
            );
          }
          else if(state is AboutError){
            return  Center(child: Text(state.message));
          }
          else{
            return Center(child: Image.asset("assets/images/noData.png"));
          }
        },
      ),
        );
  }
}
