import 'package:flutter/material.dart';

import '../../Resources/colors.dart';
import '../../Resources/sizes.dart';

class ItemPoint extends StatelessWidget {
  const ItemPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal:  width(context) * .02),
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: ColorManager.orangeTxtColor,
              radius: height(context) * .013),
          AppSize.spaceHeight05(context),
          Container(
            color: ColorManager.orangeTxtColor,
            width: width(context) * .03,
            height: height(context) * .003,
          )
        ],
      ),
    );
  }
}
