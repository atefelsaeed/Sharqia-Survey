import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sharqia_household_survey/Resources/assets_manager.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/item_text_span.dart';
import '../../../Widgets/text.dart';
import '../../GoogleMaps/auto_search_map.dart';

class TripStartingAddress extends StatefulWidget {
  final int index;
  final String title;

  const TripStartingAddress({
    super.key,
    required this.index,
    required this.title,
  });

  @override
  State<TripStartingAddress> createState() => _TripStartingAddressState();
}

class _TripStartingAddressState extends State<TripStartingAddress> {
  // bool isHome = false;

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);
    var startBeginningModel =
        TripModeList.tripModeList[widget.index].startBeginningModel;

    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight2(context),
        HeadlineText(text: widget.title),
        Row(children: [
          TextGlobal(
            text: "المنزل",
            fontSize: width(context) * .03,
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
              value: TripModeList.tripModeList[widget.index].isHome,
              onChanged: (bool? value) {
                setState(() {
                  TripModeList.tripModeList[widget.index].isHome = value!;
                  if (TripModeList.tripModeList[widget.index].isHome == true) {
                    startBeginningModel?.tripAddressLong =
                        surveyPt.hhsAddressLong;

                    startBeginningModel?.tripAddressLat =
                        surveyPt.hhsAddressLat;
                  } else {
                    startBeginningModel?.tripAddressLong =
                        surveyPt.startingAddressLatLng?.longitude.toString();
                    startBeginningModel?.tripAddressLat =
                        surveyPt.startingAddressLatLng?.latitude.toString();
                  }
                });
              })
        ]),
        Column(
          children: [
            TripModeList.tripModeList[widget.index].isHome == true
                ? Container()
                : Row(
                    children: [
                      const Image(image: AssetImage(ImageAssets.locationIcon)),
                      AppSize.spaceWidth2(context),
                      const Text('الإحداثيات'),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            print('google maps navigation');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapSearchScreen(
                                  callBack: (LatLng latLong) {
                                    surveyPt.startingAddressLatLng = latLong;
                                    setState(() {
                                      surveyPt.startingAddressLatLng?.latitude !=
                                          latLong.latitude;
                                      surveyPt.startingAddressLatLng?.longitude !=
                                          latLong.longitude;
                                    });
                                    setState(() {
                                      startBeginningModel?.tripAddressLong =
                                          surveyPt
                                              .startingAddressLatLng?.longitude
                                              .toString();
                                      startBeginningModel?.tripAddressLat =
                                          surveyPt.startingAddressLatLng?.latitude
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
                    subTitle: startBeginningModel?.tripAddressLat ?? ""),
                AppSize.spaceWidth3(context),
                ItemTextSpan(
                    title: "Long",
                    subTitle: startBeginningModel?.tripAddressLong ?? ""),
              ],
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
