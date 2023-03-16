import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class WhyDidYouGo extends StatefulWidget {
  final int indexTripModel;

  const WhyDidYouGo({super.key, required this.indexTripModel});

  @override
  State<WhyDidYouGo> createState() => _WhyDidYouGoState();
}

class _WhyDidYouGoState extends State<WhyDidYouGo> {
  int chosenindex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          itemBuilder: (context, index) => SizedBox(
            width: width(context) / 2,
            child: Row(children: [
              SizedBox(
                width: width(context) * .2,
                child: TextGlobal(
                  text: TripModeList.tripModeList[widget.indexTripModel]
                      .purposeOfBeingThere2["TripReason"][index]["value"],
                  //[index].title,
                  fontSize: width(context) * .02,
                  color: ColorManager.grayColor,
                ),
              ),
              Checkbox(
                  side: BorderSide(
                    color: ColorManager.orangeTxtColor,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  checkColor: ColorManager.whiteColor,
                  focusColor: ColorManager.orangeTxtColor,
                  activeColor: ColorManager.orangeTxtColor,
                  value: TripModeList.tripModeList[widget.indexTripModel]
                      .purposeOfBeingThere2["TripReason"][index]["isChick"],
                  onChanged: (bool? value) {
                    setState(() {
                      TripModeList.tripModeList[widget.indexTripModel]
                              .purposeOfBeingThere2["TripReason"][chosenindex]
                          ["isChick"] = false;
                      chosenindex = index;
                      TripModeList.tripModeList[widget.indexTripModel]
                              .purposeOfBeingThere2["TripReason"][chosenindex]
                          ["isChick"] = value;
                      TripModeList.tripModeList[widget.indexTripModel]
                          .tripReason = TripModeList
                              .tripModeList[widget.indexTripModel]
                              .purposeOfBeingThere2["TripReason"][chosenindex]
                          ["value"];
                    });
                  }),
            ]),
          ),
        ),
        AppSize.spaceHeight1(context),
        (TripModeList.tripModeList[widget.indexTripModel].tripReason ==
                    "آخرى" &&
                TripModeList.tripModeList[widget.indexTripModel]
                            .purposeOfBeingThere2["TripReason"][chosenindex]
                        ["isChick"] ==
                    true)
            ? MyTextForm(
                onChanged: (val) {
                  TripModeList.tripModeList[widget.indexTripModel].tripReason =
                      val;
                },
                onTap: () {},

                label: "أدخل الغرض",
                isNumber: false,
              )
            : Container(),
      ],
    );
  }
}
