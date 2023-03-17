import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class WhyDidYouGo extends StatefulWidget {
  final int indexTripModel;

  const WhyDidYouGo({
    Key? key,
    required this.indexTripModel,
  }) : super(key: key);

  @override
  State<WhyDidYouGo> createState() => _WhyDidYouGoState();
}

class _WhyDidYouGoState extends State<WhyDidYouGo> {
  int chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          primary: true,
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: TripModeList.tripModeList[widget.indexTripModel]
              .purposeOfBeingThere2["TripReason"].length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4,
          ),
          itemBuilder: (context, index) {
            final tripReason = TripModeList.tripModeList[widget.indexTripModel]
                .purposeOfBeingThere2["TripReason"][index]["value"];

            return SizedBox(
              width: width(context) / 2,
              child: Row(
                children: [
                  SizedBox(
                    width: width(context) * .2,
                    child: TextGlobal(
                      text: tripReason,
                      fontSize: width(context) * .02,
                      color: ColorManager.grayColor,
                    ),
                  ),
                  Checkbox(
                    side: BorderSide(
                      color: ColorManager.orangeTxtColor,
                      width: 1.5,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    checkColor: ColorManager.whiteColor,
                    focusColor: ColorManager.orangeTxtColor,
                    activeColor: ColorManager.orangeTxtColor,
                    value: TripModeList.tripModeList[widget.indexTripModel]
                        .purposeOfBeingThere2["TripReason"][index]["isChick"],
                    onChanged: (bool? value) {
                      setState(() {
                        TripModeList.tripModeList[widget.indexTripModel]
                                .purposeOfBeingThere2["TripReason"][chosenIndex]
                            ["isChick"] = false;

                        chosenIndex = index;

                        TripModeList.tripModeList[widget.indexTripModel]
                                .purposeOfBeingThere2["TripReason"][chosenIndex]
                            ["isChick"] = value;

                        TripModeList.tripModeList[widget.indexTripModel]
                            .tripReason = tripReason;
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        if (TripModeList.tripModeList[widget.indexTripModel].tripReason ==
                "آخرى" &&
            TripModeList.tripModeList[widget.indexTripModel]
                        .purposeOfBeingThere2["TripReason"][chosenIndex]
                    ["isChick"] ==
                true)
          MyTextForm(
            onChanged: (val) {
              TripModeList.tripModeList[widget.indexTripModel].tripReason = val;
            },
            onTap: () {},
            label: "أدخل الغرض",
            isNumber: false,
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
