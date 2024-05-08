import 'package:fi_khedmtk_sehtak/shared/statics/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';

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
      title: StringManger.healthCareTitle,
      subTitle: StringManger.healthCareSubTitle,
      desc: StringManger.healthCareDesc,
      skip: true
    ),
    OnBoardingViewModel(
      image: AssetManger.medicalFileIcon,
      title: StringManger.medicalFileTitle,
      subTitle: StringManger.medicalFileSubTitle,
      desc: StringManger.medicalFileDesc,
      skip: true
    ),
    OnBoardingViewModel(
      image: AssetManger.onlineBookingIcon,
      title: StringManger.onlineBookingTitle,
      subTitle: StringManger.onlineBookingSubTitle,
      desc: StringManger.onlineBookingDesc,
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
          padding:  EdgeInsetsDirectional.all(26),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
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

  Widget buildItem(OnBoardingViewModel pag) => Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AssetManger.backgroundIcon),
              fit: BoxFit.cover,)
            ),


            width: 390.w,
            child: Column(children: [
              SizedBox(
                height: 215.h,
              ),
              SvgPicture.asset(pag.image, ),
              SizedBox(
                height: 77.h,
              ),

            ],),

          ),

          Text(
            pag.title,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.blackColor,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            pag.subTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.blueColor,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            pag.desc,
            textAlign: TextAlign.center,
            maxLines: 5,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.greyBordColor,
            ),
          ),
          SizedBox(
            height: 99.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             pag.skip ?
             TextButton(
                  onPressed: () async {
                    // PrefsHelper.saveData(key: 'onBoarding', value: true).then((value) => {
                    //   if(value!){
                    //
                    Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
                    //   }
                    // });

                  },
                  child: Text(
                    StringManger.skip,
                    style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorManger.labelGrayColor,
                    ),
                  )):SizedBox(),
              TextButton(
                  onPressed: () {
                    if(isLast){
                      Navigator.pushNamed(context,Routes.loginScreen);
                    }else{_controller.nextPage(duration:Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);}

                  },
                  child: Text(
                    StringManger.next,
                    style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorManger.blueColor,
                    ),
                  )),
            ],
          ),
        ],
      );
}
