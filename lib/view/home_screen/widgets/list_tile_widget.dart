import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../more/profile_screen/cubit/profile_cubit/profile_cubit.dart';



class ListTileWidget extends StatefulWidget {
  const ListTileWidget({Key? key}) : super(key: key);

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            minVerticalPadding:0.0,
            contentPadding: const EdgeInsetsDirectional.only(top: 0,bottom: 0,start: 10),
            dense: true,
            leading: Text(
              StringManger.homeTitleTile1.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ColorManger.blackColor),
            ),
            // trailing:Badge.count(
            //   count: 4,
            //   backgroundColor: ColorManger.blueColor,
            //   child:GestureDetector(
            //     onTap: (){
            //       sl<NavigationService>().navigateTo(Routes.notificationScreen);
            //     },
            //     child: const Icon(
            //       Icons.notifications,
            //       color: ColorManger.blackColor,),
            //   ),
            //
            // )
            trailing:Wrap(
              children: [
                  IconButton(onPressed: (){sl<NavigationService>().navigateTo(Routes.notificationScreen);}, icon: SvgPicture.asset(AssetManger.notificationIcon)),
                  IconButton(onPressed: (){sl<NavigationService>().navigateTo(Routes.cartScreen);}, icon: SvgPicture.asset(AssetManger.cartIcon)),

              ],
            )
            // IconButton(
            //   onPressed: (){
            //
            //   },
            //   icon: const Icon(
            //     Icons.notifications,
            // color: ColorManger.blackColor,),),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  child: state is ProfileSuccessState
                      ? Text(
                          "${state.profile.info!.firstName} ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: ColorManger.blueColor),
                        )
                      : const Text("Guest"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
