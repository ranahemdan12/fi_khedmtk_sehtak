import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'area_list_item.dart';

class AreaListView extends StatefulWidget {
  const AreaListView({Key? key}) : super(key: key);

  @override
  State<AreaListView> createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView> {
  final ScrollController _controller = ScrollController();
  // void jumpToItem(){
  //   final width = _controller.position.maxScrollExtent + context.size!.width;
  //   final value = width;
  //   _controller.jumpTo(value);
  // }
  void _scrollRight() {

    _controller.animateTo(
      _controller.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    // _controller.jumpTo(_controller.position.maxScrollExtent);
  }
  void _scrollLeft() {
    _controller.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    // _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Row(
        children: [

          GestureDetector(
            onTap: _scrollLeft,




              child: Image.asset(AssetManger.arrowLeftIcon)),
          SizedBox(width: 5.w,),
          Container(
            height:132.h,
            width: 300.w,
            child: ListView.builder( scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              controller: _controller ,
              itemBuilder: (context,index)=>AreaListItem(),
              itemCount:8,),
          ),
          SizedBox(width: 5.w,),
          GestureDetector(
            onTap:  _scrollRight,
              child: Image.asset(AssetManger.arrowRightIcon)),

        ],
      ),
    );
  }
}
