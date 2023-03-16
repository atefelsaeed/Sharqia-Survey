import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../provider/trip_provider.dart';
import 'headline_trip.dart';

class HowDidYouTravel extends StatelessWidget {
  const HowDidYouTravel({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripProvider>(context, listen: false);
    // TODO: implement build
    return Column(
      children: [
        const HeadlineText(text: "6. كیف ذهبت ؟"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DropDownFormInput(
                  label: TripModeList.tripModeList[i].travelWay!.mainMode != ''
                      ? Text(TripModeList.tripModeList[i].travelWay!.mainMode ??
                          '')
                      : const Text('إختار'),
                  hint: "وضع الوصول",
                  options:
                      TripData.mainMade[TripData.mainMade.keys.first]!.toList(),
                  onChange: (String? p) {
                    provider.setMainMode(p, i);
                  },
                ),
                AppSize.spaceHeight2(context),
                ((TripModeList.tripModeList[i].travelWay!.mainMode == "أخر") ||
                        (TripModeList.tripModeList[i].travelWay!.mainMode!
                                .isNotEmpty &&
                            !(TripData.mainMade[TripData.mainMade.keys.first]!
                                .any((element) =>
                                    element ==
                                    TripModeList
                                        .tripModeList[i].travelWay!.mainMode))))
                    ? MyTextForm(
                        controller: provider.mainModeController,
                        isNumber: false,
                        onTap: () {},
                        onChanged: (value) {
                          TripModeList.tripModeList[i].travelWay!.mainMode =
                              value;
                        },
                        label: 'وضع الوصول',
                      )
                    : Container(),
              ],
            ),
            Column(
              children: [
                DropDownFormInput(
                  label: TripModeList.tripModeList[i].travelWay!.accessMode !=
                          ''
                      ? Text(
                          TripModeList.tripModeList[i].travelWay!.accessMode ??
                              '')
                      : const Text('إختار'),
                  hint: "الوضع الرئیسي",
                  options:
                      TripData.AcMode[TripData.AcMode.keys.first]!.toList(),
                  onChange: (String? p) {
                    provider.setAccessMode(p, i);
                  },
                ),
                AppSize.spaceHeight2(context),
                ((TripModeList.tripModeList[i].travelWay!.accessMode ==
                            "أخر") ||
                        (TripModeList.tripModeList[i].travelWay!.accessMode!
                                .isNotEmpty &&
                            !(TripData.AcMode[TripData.AcMode.keys.first]!.any(
                                (element) =>
                                    element ==
                                    TripModeList.tripModeList[i].travelWay!
                                        .accessMode))))
                    ? MyTextForm(
                        controller: provider.acModeController,
                        isNumber: false,
                        onChanged: (value) {
                          TripModeList.tripModeList[i].travelWay!.accessMode =
                              value;
                        },
                        onTap: () {},
                        label: 'الوضع الرئیسي',
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
