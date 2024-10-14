import 'package:easy_localization/easy_localization.dart'hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../shared/resources/asset_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/navigation_service.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../../../../shared/statics/routes.dart';
import '../../../../shared/statics/service_locator.dart';
import '../cubit/otp_cubit.dart';
import '../widget/enter_text.dart';
import '../widget/pin_put_widget.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key,});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  String? otp;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  const EdgeInsetsDirectional.symmetric(horizontal: 26),
            child: Center(
              child: Column(children: [
                SizedBox(height: 189.h,),
                SvgPicture.asset(AssetManger.secForget),
                const EnterOtpText(),
                SizedBox(height: 21.h,),
                Directionality(textDirection: TextDirection.ltr,
                  child: PinPutOtp(
                    onCompleted:(pin) {
                      setState(() {
                        otp = pin;
                      });
                    },
                    onChanged: (pin) {
                      setState(() {
                        otp = pin;
                      });
                    },

                  ),
                ),
                SizedBox(height: 200.h,),
                BlocConsumer< OtpCubit, OtpState>(
                  listener: ( context,  state) {
                    if(state is OtpSuccess){
                      sl<NavigationService>().navigateTo(Routes.loginScreen);
                    }
                  },
                  builder: ( context, state) {
                    if (state is OtpLoading) {
                      return const Center(child: CustomLoadingIndicator());
                    } else {
                      return CustomButton(text: StringManger.verify.tr(),
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                            OtpCubit.get(context).verifyOtp( request: otp??'' );
                          } );
                    }
                  }

                )

              ],),
            ),
          ),
        ),

      ),
    );
  }

}
