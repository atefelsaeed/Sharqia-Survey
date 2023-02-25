import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/assets_manager.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/alert_map.dart';
import '../../../Widgets/item_text_span.dart';
import '../../../Widgets/text.dart';

class TripEndingAddress extends StatefulWidget {
  final int index;
  final String title;

  const TripEndingAddress({
    super.key,
    required this.index,
    required this.title,
  });

  @override
  State<TripEndingAddress> createState() => _TripEndingAddressState();
}

class _TripEndingAddressState extends State<TripEndingAddress> {
  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    var endingAddress = TripModeList.tripModeList[widget.index].endingAddress;

    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        HeadlineText(text: widget.title),
        Row(children: [
          TextGlobal(
            text: "المنزل",
            fontSize: height(context) * .02,
            color: ColorManager.grayColor,
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
              value: TripModeList.tripModeList[widget.index].isHomeEnding,
              onChanged: (bool? value) {
                setState(() {
                  TripModeList.tripModeList[widget.index].isHomeEnding = value!;
                  if (TripModeList.tripModeList[widget.index].isHomeEnding ==
                      true) {
                    endingAddress?.tripAddressLong = surveyPt.hhsAddressLong;
                    endingAddress?.tripAddressLat = surveyPt.hhsAddressLat;
                  } else {
                    endingAddress?.tripAddressLong =
                        surveyPt.endingAddressLatLng?.longitude.toString();
                    endingAddress?.tripAddressLat =
                        surveyPt.endingAddressLatLng?.latitude.toString();
                  }
                });
              })
        ]),
        Column(
          children: [
            TripModeList.tripModeList[widget.index].isHomeEnding == true
                ? Container()
                : Row(
                    children: [
                      const Image(image: AssetImage(ImageAssets.locationIcon)),
                      AppSize.spaceWidth2(context),
                      const Text('الإحداثيات'),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapSearchScreen(
                                  callBack: (LatLng latLong) {
                                    surveyPt.endAddressLatLng = latLong;
                                    setState(() {
                                      surveyPt.endingAddressLatLng?.latitude !=
                                          latLong.latitude;
                                      surveyPt.endingAddressLatLng?.longitude !=
                                          latLong.longitude;
                                    });
                                    setState(() {
                                      endingAddress?.tripAddressLong = surveyPt
                                          .endingAddressLatLng?.longitude
                                          .toString();
                                      endingAddress?.tripAddressLat = surveyPt
                                          .endingAddressLatLng?.latitude
                                          .toString();
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.pin_drop,
                            color: ColorManager.primaryColor,
                            size: width(context) * .1,
                          )),
                    ],
                  ),
            Row(
              children: [
                ItemTextSpan(
                    title: "Lat",
                    subTitle: endingAddress?.tripAddressLat ?? ""),
                AppSize.spaceWidth3(context),
                ItemTextSpan(
                    title: "Long",
                    subTitle: endingAddress?.tripAddressLong ?? ""),
              ],
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
