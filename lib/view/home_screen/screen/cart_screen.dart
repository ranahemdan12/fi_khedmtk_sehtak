import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/models/request/cart/post_checkout.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/enum.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/add_card_webview.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../cubit/cart_cubit/get_cart_items/cart_items_cubit.dart';
import '../cubit/cart_cubit/post_checkout/post_checkout_cubit.dart';
import '../widgets/cart_sliver_list.dart';





class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}
 final ScrollController _scrollController= ScrollController();



class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    CartItemsCubit.get(context).getCartItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.cart.tr(),
        body: Column(children: [
          Expanded(
            child: CustomScrollView(
              physics: const PageScrollPhysics(),
              controller: _scrollController,
              slivers:  const [
                CartSliverList(),
              ],
            ),
          ),
          SizedBox(height: 32.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringManger.totalAmount.tr(),

                style:Theme.of(context).textTheme.displayLarge?.copyWith( color: ColorManger.blueColor,
                ),),
              BlocBuilder<CartItemsCubit,CartItemsState>(
                builder: (context, state){
                  return state is CartItemsSuccess ?
                  Text('${state.getCartItemsResponse.total}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:Theme.of(context).textTheme.displayLarge?.copyWith( color: ColorManger.blueColor,
                    ),)
                      : const Text(" 0");




                },
              ),
            ],
          ),
          BlocConsumer<PostCheckoutCubit,PostCheckoutState>(
            listener: (BuildContext context, PostCheckoutState state) {
              if (state is PostCheckoutSuccess){
               if (state.model.isCash == true) {
                   sl<NavigationService>().navigateTo(Routes.cashScreen);
               } else {
                 sl<NavigationService>().navigateReplacementTo(
                     Routes.paymentWebView,
                     arguments: PaymentArgument(
              paymentUrl: state.model.url?? '', type: ReserveOrderTypeEnum.webView,)
    
                 );
              }}},

            builder: (BuildContext context, PostCheckoutState state) {
              return  Padding(
                padding: const EdgeInsetsDirectional.only(start: 16,end: 16,bottom: 30, top: 16),
                child: CustomButton(
                  text:StringManger.checkOut.tr(),
                  onPressed: (){
                    sl<NavigationService>().navigateReplacementTo(
                        Routes.paymentScreen,);

                  },

                ));



     },),






        ],));
  }
}
