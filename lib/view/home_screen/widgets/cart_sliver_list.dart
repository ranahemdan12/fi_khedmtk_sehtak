import 'package:fi_khedmtk_sehtak/view/home_screen/widgets/cart_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/statics/reusable_component.dart';
import '../cubit/cart_cubit/get_cart_items/cart_items_cubit.dart';

class CartSliverList extends StatefulWidget {
  const CartSliverList({super.key});

  @override
  State<CartSliverList> createState() => _CartSliverListState();
}

class _CartSliverListState extends State<CartSliverList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemsCubit, CartItemsState>(
      builder:(context, state) {
        if (state is CartItemsSuccess) {
          return SliverList.builder(
              itemBuilder: (context, index) {
                return
                  CartContainer( cartItems: state.getCartItemsResponse.result!.resultItem[index],);
              },
              itemCount:state.getCartItemsResponse.result?.resultItem.length,
          );
        }
        else if (state is CartItemsLoading) {
          return const CustomSliverShimmer();
        } else if (state is CartItemsEmpty) {
          return SliverToBoxAdapter(child: Center(child: Image.asset("assets/images/noData.png")));
        } else if (state is CartItemsError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.error)));
        } else {
          return SliverToBoxAdapter(child: Center(child: Image.asset("assets/images/noData.png")));
        }
      } ,

    );
  }
}
