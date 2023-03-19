import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';

class TripHoldAddress extends StatefulWidget {
  final StartBeginningModel tripModel;
  final String title;

  const TripHoldAddress({
    Key? key,
    required this.tripModel,
    required this.title,
  }) : super(key: key);

  @override
  _TripHoldAddressState createState() => _TripHoldAddressState();
}

class _TripHoldAddressState extends State<TripHoldAddress> {
  bool isHome = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSize.spaceHeight2(context),
        HeadlineText(text: widget.title),
        const Divider(thickness: 1),
        AppSize.spaceHeight1(context),
        Row(
          children: [
            TextGlobal(
              text: 'المنزل',
              fontSize: height(context) * 0.02,
              color: ColorManager.grayColor,
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextForm(
                controller: widget.tripModel.area,
                label: 'الحى',
                text: 'ادخل اسم الحى',
                onChanged: (value) {},
              ),
            ),
            AppSize.spaceWidth2(context),
            Expanded(
              child: TextForm(
                controller: widget.tripModel.streetNumber,
                label: 'رقم الشارع',
                text: 'ادخل رقم الشارع',
                keyboardType: TextInputType.number,
                isNumber: true,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextForm(
                controller: widget.tripModel.streetName,
                label: 'اسم الشارع',
                text: 'ادخل اسم الشارع',
                onChanged: (value) {},
              ),
            ),
            AppSize.spaceWidth2(context),
            Expanded(
              child: TextForm(
                controller: widget.tripModel.nearestLandMark,
                label: 'اقرب معلم',
                text: 'ادخل اسم اقرب معلم',
                onChanged: (value) {},
              ),
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        TextForm(
          controller: widget.tripModel.block,
          label: 'أقرب تقاطع',
          text: 'ادخل اسم أقرب تقاطع',
          onChanged: (value) {},
        ),
         AppSize.spaceHeight2(context),
      ],
    );
  }
}
