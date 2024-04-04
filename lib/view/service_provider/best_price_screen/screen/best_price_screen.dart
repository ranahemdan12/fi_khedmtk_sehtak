import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../package_item_screen/widget/labes_grid_view.dart';

class BestPriceScreen extends StatelessWidget {
  const BestPriceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 18.h,),
          LabsGridView(),
        ],
      ),
    );
  }
}
