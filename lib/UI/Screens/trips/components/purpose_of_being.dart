import 'package:flutter/material.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class PurposeOfTheBeing extends StatefulWidget {
  final int indexTripModel;

  const PurposeOfTheBeing({super.key, required this.indexTripModel});

  @override
  State<PurposeOfTheBeing> createState() => _PurposeOfTheBeing();
}

class _PurposeOfTheBeing extends State<PurposeOfTheBeing> {
  int chosenIndex = 0;

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
              .purposeOfBeingThere["QPurposeOfBeingThere"].length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 4),
          itemBuilder: (context, index) => SizedBox(
            width: width(context) / 2,
            child: Row(children: [
              SizedBox(
                width: width(context) * .2,
                child: TextGlobal(
                  text: TripModeList.tripModeList[widget.indexTripModel]
                          .purposeOfBeingThere["QPurposeOfBeingThere"][index]
                      ["value"],
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
                          .purposeOfBeingThere["QPurposeOfBeingThere"][index]
                      ["isChick"],
                  onChanged: (bool? value) {
                    debugPrint(value.toString());
                    setState(() {


                      TripModeList.tripModeList[widget.indexTripModel]
                              .purposeOfBeingThere["QPurposeOfBeingThere"]
                          [chosenIndex]["isChick"] = false;
                      chosenIndex = index;

                      TripModeList.tripModeList[widget.indexTripModel]
                              .purposeOfBeingThere["QPurposeOfBeingThere"]
                          [chosenIndex]["isChick"] = value;

                      TripModeList.tripModeList[widget.indexTripModel]
                          .purposeTravel = TripModeList
                              .tripModeList[widget.indexTripModel]
                              .purposeOfBeingThere["QPurposeOfBeingThere"]
                          [chosenIndex]["value"];
                    });
                  }),
            ]),
          ),
        ),
        AppSize.spaceHeight1(context),
        (TripModeList.tripModeList[widget.indexTripModel].purposeTravel ==
                    "آخرى" &&
                TripModeList.tripModeList[widget.indexTripModel]
                            .purposeOfBeingThere["QPurposeOfBeingThere"]
                        [chosenIndex]["isChick"] ==
                    true)
            ? MyTextForm(
                onChanged: (val) {
                  TripModeList
                      .tripModeList[widget.indexTripModel].purposeTravel = val;
                },
                label: "أدخل الغرض",
                isNumber: false,
                onTap: () {},
              )
            : Container(),
      ],
    );
  }
}
