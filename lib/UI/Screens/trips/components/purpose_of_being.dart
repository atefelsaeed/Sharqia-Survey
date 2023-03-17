import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

class PurposeOfBeing extends StatefulWidget {
  final int indexTripModel;

  const PurposeOfBeing({
    Key? key,
    required this.indexTripModel,
  }) : super(key: key);

  @override
  _PurposeOfBeingState createState() => _PurposeOfBeingState();
}

class _PurposeOfBeingState extends State<PurposeOfBeing> {
  int chosenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final purposeOfBeingThere = TripModeList.tripModeList[widget.indexTripModel]
        .purposeOfBeingThere["QPurposeOfBeingThere"];
    return Column(
      children: [
        GridView.builder(
          primary: true,
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: purposeOfBeingThere.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4,
          ),
          itemBuilder: (context, index) => SizedBox(
            width: width(context) / 2,
            child: Row(
              children: [
                SizedBox(
                  width: width(context) * .2,
                  child: TextGlobal(
                    text: purposeOfBeingThere[index]["value"],
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
                  value: purposeOfBeingThere[index]["isChick"],
                  onChanged: (bool? value) {
                    debugPrint(value.toString());
                    setState(() {
                      purposeOfBeingThere[chosenIndex]["isChick"] = false;
                      chosenIndex = index;
                      purposeOfBeingThere[chosenIndex]["isChick"] = value;
                      TripModeList.tripModeList[widget.indexTripModel].purposeTravel =
                      purposeOfBeingThere[chosenIndex]["value"];
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        AppSize.spaceHeight1(context),
        if (TripModeList.tripModeList[widget.indexTripModel].purposeTravel == "آخرى" &&
            purposeOfBeingThere[chosenIndex]["isChick"])
          MyTextForm(
            onChanged: (val) {
              TripModeList.tripModeList[widget.indexTripModel].purposeTravel = val;
            },
            label: "أدخل الغرض",
            isNumber: false,
            onTap: () {},
          ),
      ],
    );
  }
}
