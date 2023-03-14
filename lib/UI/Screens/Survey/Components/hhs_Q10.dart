import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';
import 'package:sharqia_household_survey/UI/Widgets/input_number_title.dart';

import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Resources/sizes.dart';

class HHSQ10 extends StatelessWidget {
  const HHSQ10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height(context) * .03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText(
            text:
                "10. خلال الأسبوع الماضي ، كم عدد الطلبات المنزلية والبقالة  والإمدادات الأخرى التي استلمتها أسرتك؟",
          ),
          Wrap(
            children: [
              InputNumberTitle(
                  controller: VehModel.vehiclesModel.numberParcelsDeliveries,
                  title: 'عدد الطلبات المنزلية'),
              AppSize.spaceWidth2(context),
              InputNumberTitle(
                  controller: VehModel.vehiclesModel.numberParcels,
                  title: 'عدد الطرود'),
              AppSize.spaceWidth2(context),
              InputNumberTitle(
                  controller: VehModel.vehiclesModel.numberFood,
                  title: 'عدد الطعام'),
              AppSize.spaceWidth2(context),
              InputNumberTitle(
                  controller: VehModel.vehiclesModel.numberGrocery,
                  title: 'عدد البقالة'),
              AppSize.spaceWidth2(context),
              InputNumberTitle(
                  controller: VehModel.vehiclesModel.numberOtherParcels,
                  title: 'اخرى'),
            ],
          ),
        ],
      ),
    );
  }
}
