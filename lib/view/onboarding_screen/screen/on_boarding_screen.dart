import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';


class OnBoardingViewModel {
  final String image;
  final String title;
  final String subTitle;
  final String desc;
  final bool skip;


  OnBoardingViewModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.desc,
    required this.skip
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingViewModel> pages = [
    OnBoardingViewModel(
      image: AssetManger.healthcareIcon,
      title: StringManger.healthCareTitle.tr(),
      subTitle: StringManger.healthCareSubTitle.tr(),
      desc: StringManger.healthCareDesc.tr(),
      skip: true
    ),
    OnBoardingViewModel(
      image: AssetManger.medicalFileIcon,
      title: StringManger.medicalFileTitle.tr(),
      subTitle: StringManger.medicalFileSubTitle.tr(),
      desc: StringManger.medicalFileDesc.tr(),
      skip: true
    ),
    OnBoardingViewModel(
      image: AssetManger.onlineBookingIcon,
      title: StringManger.onlineBookingTitle.tr(),
      subTitle: StringManger.onlineBookingSubTitle.tr(),
      desc: StringManger.onlineBookingDesc.tr(),
      skip: false
    ),
  ];

  final _controller = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:  const EdgeInsetsDirectional.all(26),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (int index){
                    if(index == pages.length - 1){
                      setState(() {
                        isLast = true;
                      });
                    }else
                      {
                        setState(() {
                          isLast = false;
                        });
                      }
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) => buildItem(pages[index]),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(OnBoardingViewModel pag) => SingleChildScrollView(
    child: Column(
          children: [
            Container(
              decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetManger.backgroundIcon),
                fit: BoxFit.cover,)
              ),
              width: 390.w,
              child: Column(children: [
                SizedBox(height: 215.h,),
                SvgPicture.asset(pag.image, ),
                SizedBox(height: 77.h,),
              ],),
            ),
    
            Text(
              pag.title,
              style:Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
            ),
            SizedBox(height: 18.h,),
            Text(
              pag.subTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18)
            ),
            SizedBox(height: 18.h,),
            Text(
              pag.desc,
              textAlign: TextAlign.center,
              maxLines: 5,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManger.greyBordColor)
            ),
            SizedBox(height: 99.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               pag.skip ?
               TextButton(
                    onPressed: () async {
                      sl<NavigationService>().navigatePushNamedAndRemoveUntil(Routes.loginScreen);
                    },
                    child: Text(
                      StringManger.skip.tr(),
                      style: Theme.of(context).textTheme.bodySmall
                    )):const SizedBox(),
                TextButton(
                    onPressed: () {
                      if(isLast){
                        sl<NavigationService>().navigateTo(Routes.loginScreen);

                      }else{_controller.nextPage(duration:const Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);}
    
                    },
                    child: Text(
                      StringManger.next.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18)
                    )),
              ],
            ),
          ],
        ),
  );
}
