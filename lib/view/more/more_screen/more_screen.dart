import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/view/auth/login_screen/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../widget/more_list_tile.dart';



class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: context.locale,
      child: CustomScreen(
          text: StringManger.more.tr(),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 26, end: 26, top: 19),
              child: Column(
                children: [
                  MoreListTile(
                    svgImage: AssetManger.profileTileIcon,
                    text: StringManger.profile.tr(),
                    onTap: () {
                      sl<NavigationService>().navigateTo(Routes.profileScreen);
                    },
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  MoreListTile(
                    svgImage: AssetManger.aboutIcon,
                    text: StringManger.about.tr(),
                    onTap: () {
                      sl<NavigationService>().navigateTo(Routes.aboutScreen);
                    },
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  MoreListTile(
                    svgImage: AssetManger.contactIcon,
                    text: StringManger.contactUs.tr(),
                    onTap: () {
                      sl<NavigationService>().navigateTo(Routes.contactScreen);
                    },
                  ),
                  // SizedBox(
                  //   height: 19.h,
                  // ),
                  // MoreListTile(
                  //   svgImage: AssetManger.pointsIcon,
                  //   text: StringManger.points.tr(),
                  //   onTap: () {
                  //     sl<NavigationService>().navigateTo(Routes.pointsScreen);
                  //   },
                  // ),
                  SizedBox(
                    height: 19.h,
                  ),
                  MoreListTile(
                    svgImage: AssetManger.privacyIcon,
                    text: StringManger.privacyPolicy.tr(),
                    onTap: () {
                      sl<NavigationService>().navigateTo(Routes.privacyScreen);
                    },
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  MoreListTile(
                    svgImage: AssetManger.langIcon,
                    text: StringManger.language.tr(),
                    onTap: () {
                      sl<NavigationService>().navigateTo(Routes.langScreen);
                    },
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  MoreListTile(
                    svgImage: AssetManger.logOutIcon,
                    text: StringManger.logout.tr(),
                    onTap: () {
                      _showDialog(context);
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }


  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              StringManger.logout.tr(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    await LoginCubit.get(context).signOut();
                    sl<NavigationService>()
                        .navigatePushNamedAndRemoveUntil(Routes.loginScreen);
                  },
                  child: Text(
                    StringManger.yes.tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              TextButton(
                  onPressed: () {
                    sl<NavigationService>().pop();
                  },
                  child: Text(
                    StringManger.no.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorManger.redColor),
                  )),
            ],
            content: Text(
              StringManger.areYou.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        });
  }
}
