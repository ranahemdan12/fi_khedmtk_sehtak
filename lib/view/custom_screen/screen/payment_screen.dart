import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/request/cart/post_checkout.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/add_card_webview.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../home_screen/cubit/cart_cubit/post_checkout/post_checkout_cubit.dart';
import '../payment_cubit/payment_filter_cubit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? lang;

  @override
  Widget build(BuildContext context) {
    lang = PaymentFilterCubit.get(context).payment;
    return CustomScreen(
      text: StringManger.payment.tr(),
        body:Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 26),
          child: Column(children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManger.whiteColor,
                  border: Border.all(
                    color: ColorManger.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: ColorManger.shadowColor,
                      blurRadius: 8,
                      // offset: Offset(1, 1), // Shadow position
                    ),
                  ],
                ),
                child: RadioListTile(
                  selectedTileColor: ColorManger.blueColor ,
                  activeColor: ColorManger.blueColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringManger.cash.tr(),
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.blackColor)
                      ),
                      SvgPicture.asset(AssetManger.cashIcon,fit: BoxFit.scaleDown,),
                    ],
                  ),
                  value: StringManger.cash,
                  groupValue: lang,
                  onChanged: (value) {
                    setState(() {
                      lang = value.toString();
                    });
                    PaymentFilterCubit.get(context).setPayment(lang ?? '');
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(5),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorManger.whiteColor,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorManger.shadowColor,
                        blurRadius: 8,
                        // offset: Offset(1, 1), // Shadow position
                      ),
                    ],
                    border: Border.all(
                      color: ColorManger.dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    RadioListTile(
                      selectedTileColor: ColorManger.blueColor ,
                      activeColor: ColorManger.blueColor,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringManger.creditCard.tr(),
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.blackColor),
                          ),
                          Row(
                            children: [
                              Image.asset(AssetManger.masterIcon,fit: BoxFit.scaleDown,),
                              SvgPicture.asset(AssetManger.visaIcon,fit: BoxFit.scaleDown,),
                            ],
                          ),
                        ],
                      ),
                      value: StringManger.creditCard.tr(),
                      groupValue: lang,
                      onChanged: (value) {
                        setState(() {
                          lang = value.toString();
                        });
                        PaymentFilterCubit.get(context).setPayment(lang ?? '');
                      },
                    ),
                    SizedBox(height: 18.h,),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 474.h,
            ),
            BlocConsumer<PostCheckoutCubit,PostCheckoutState>(
                listener: (BuildContext context, PostCheckoutState state) {
                  if (state is PostCheckoutSuccess){
                    if (state.model.isCash == true) {
                      sl<NavigationService>().navigateReplacementTo(Routes.cashScreen);
                    } else {
                      sl<NavigationService>().navigateReplacementTo(
                          Routes.paymentWebView,
                          arguments: PaymentArgument(
                            paymentUrl: state.model.url?? '', type: ReserveOrderTypeEnum.webView,)

                      );
                    }}},
                builder: (BuildContext context, PostCheckoutState state) {

                  return  CustomButton(text: StringManger.pay.tr(),
                      onPressed: (){
                      if(PaymentFilterCubit.get(context).validate()){
                        PostCheckoutCubit.get(context).postCheckOut(
                            request: PostCheckOutRequest(
                            payment: PaymentFilterCubit.get(context).payment,
                        ));

                      }else{
                        showToast(StringManger.noValueSelected.tr());
                      }
                  });
                },



            )  ]),
        ),
    );
  }
}