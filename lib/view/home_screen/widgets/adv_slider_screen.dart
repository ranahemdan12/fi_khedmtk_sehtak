import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../cubit/ads_cubit/ads_cubit.dart';


class AdvSliderScreen extends StatefulWidget {
  const AdvSliderScreen({Key? key}) : super(key: key);

  @override
  State<AdvSliderScreen> createState() => _AdvSliderScreenState();
}

class _AdvSliderScreenState extends State<AdvSliderScreen> {
  int current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    super.initState();
      AdsCubit.get(context).getAds();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsCubit, AdsState>(
      builder: (context, state) {
        if (state is AdsLoadingState) {
          return const CustomLoadingIndicator();
        } else if (state is AdsSuccessState) {
          return Column(
            children: [
              CarouselSlider(
                  items:List.generate(state.adsList!.length, (index){
                return Padding(
                    padding: const EdgeInsetsDirectional.only(start: 26,end: 26,bottom: 10),
                       child:
                       ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                         child: Image.network(
                           state.adsList?[index].image ?? '',
                             width: 338.w,
                           height: 200.h,
                          fit: BoxFit.fill,
                        ),));}),
                  options: CarouselOptions(
                    height: 198.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  viewportFraction: 1,
                aspectRatio: 2.0,
                      onPageChanged: (index,reason){
                      setState(() {
                        current=index;
                      });
                  }
                  )),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.adsList!.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 16.w,
                      height: 3.h,
                      margin:const EdgeInsetsDirectional.symmetric(vertical: 16.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color:current== entry.key?ColorManger.blueColor:ColorManger.greyAdsColor,
                    ),
                  ));
                }).toList(),
              ),
            ]
          );
        }
        return Image.asset("assets/images/noData.png");
      },
    );

  }
}
