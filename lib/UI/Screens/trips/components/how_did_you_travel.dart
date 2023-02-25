import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import 'headline_trip.dart';

class HowDidYouTravel extends StatefulWidget {
  final int i;

  const HowDidYouTravel({super.key, required this.i});

  @override
  State<HowDidYouTravel> createState() => _HowDidYouTravelState();
}

class _HowDidYouTravelState extends State<HowDidYouTravel> {
  TextEditingController acModeController = TextEditingController();
  TextEditingController mainModeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeadlineText(text: "6. كیف ذهبت ؟"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: TripModeList.tripModeList[widget.i].travelWay!.mainMode !=
                      ''
                  ? Text(
                      TripModeList.tripModeList[widget.i].travelWay!.mainMode ??
                          '')
                  : const Text('إختار'),
              hint: "وضع الوصول",
              options:
                  TripData.mainMade[TripData.mainMade.keys.first]!.toList(),
              onChange: (String? p) {
                setState(() {
                  TripModeList.tripModeList[widget.i].travelWay!.mainMode =
                      p.toString();
                });
              },
            ),
            DropDownFormInput(
              label:
                  TripModeList.tripModeList[widget.i].travelWay!.accessMode !=
                          ''
                      ? Text(TripModeList
                              .tripModeList[widget.i].travelWay!.accessMode ??
                          '')
                      : const Text('إختار'),
              hint: "الوضع الرئیسي",
              options: TripData.AcMode[TripData.AcMode.keys.first]!.toList(),
              onChange: (String? p) {
                setState(() {
                  TripModeList.tripModeList[widget.i].travelWay!.accessMode =
                      p.toString();
                });
              },
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TripModeList.tripModeList[widget.i].travelWay!.mainMode == "أخر"
                ? MyTextForm(
                    controller: mainModeController,
                    isNumber: false,
                    onChanged: (value) {
                      TripModeList.tripModeList[widget.i].travelWay!.mainMode =
                          value;
                    },
                    label: 'وضع الوصول',
                  )
                : Container(),
            TripModeList.tripModeList[widget.i].travelWay!.accessMode == "أخر"
                ? MyTextForm(
                    controller: acModeController,
                    isNumber: false,
                    onChanged: (value) {
                      TripModeList
                          .tripModeList[widget.i].travelWay!.accessMode = value;
                    },
                    label: 'الوضع الرئیسي',
                  )
                : Container(),
          ],
        )
      ],
    );
  }
}
