import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Models/Trips_SurveyModel/start_beginning_model.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';

class TripHoldAddress extends StatefulWidget {
  final StartBeginningModel tripModel;
  final String titel;

  const TripHoldAddress({
    super.key,
    required this.tripModel,
    required this.titel,
  });

  @override
  State<TripHoldAddress> createState() => _TripHoldAddressState();
}

class _TripHoldAddressState extends State<TripHoldAddress> {
  bool isHome = false;

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        HeadlineText(text: widget.titel),
        AppSize.spaceHeight1(context),
        const Divider(
          thickness: 1,
        ),
        Row(children: [
          TextGlobal(
            text: "المنزل",
            //[index].title,
            fontSize: height(context) * .02,
            color: ColorManager.grayColor,
          ),
          // Checkbox(
          //     side: BorderSide(
          //       color: ColorManager.orangeTxtColor,
          //       width: 1.5,
          //     ),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(5.0),
          //     ),
          //     checkColor: ColorManager.whiteColor,
          //     focusColor: ColorManager.orangeTxtColor,
          //     activeColor: ColorManager.orangeTxtColor,
          //     value: isHome,
          //     onChanged: (bool? value) {
          //       setState(() {
          //         isHome = value!;
          //         if (isHome == true) {
          //           widget.tripModel.area.text = surveyPt.hhsAreaSuburb!;
          //           widget.tripModel.streetNumber.text =
          //               surveyPt.hhsStreetNumber!;
          //           widget.tripModel.streetName.text = surveyPt.hhsStreetName!;
          //           widget.tripModel.nearestLandMark.text =
          //               surveyPt.hhsNearestLandMark!;
          //           widget.tripModel.block.text =
          //               surveyPt.hhsBlockNearestCrossStreets!;
          //         } else {
          //           widget.tripModel.area.text = "";
          //           widget.tripModel.streetNumber.text = "";
          //           widget.tripModel.streetName.text = "";
          //           widget.tripModel.nearestLandMark.text = "";
          //           widget.tripModel.block.text = "";
          //         }
          //       });
          //     })
        ]),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextForm(
              controller: widget.tripModel.area,
              text: "الحى",
              label: "الحى",
            ),
            TextForm(
              controller: widget.tripModel.streetNumber,
              text: "رقم الشارع",
              label: "رقم الشارع",
              keyboardType: TextInputType.number,
              isNumber: true,
            )
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextForm(
              controller: widget.tripModel.streetName,
              label: "إسم الشارع",
              text: "إسم الشارع",
            ),
            TextForm(
              controller: widget.tripModel.nearestLandMark,
              label: "اقرب معلم",
              text: "اقرب معلم",
            )
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextForm(
              controller: widget.tripModel.block,
              text: "أقرب تقاطع",
              label: "أقرب تقاطع",
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
