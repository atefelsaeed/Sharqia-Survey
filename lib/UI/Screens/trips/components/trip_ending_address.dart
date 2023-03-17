import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/assets_manager.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Providers/survey_hhs.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/item_text_span.dart';
import '../../../Widgets/text.dart';
import '../../GoogleMaps/auto_search_map.dart';

class TripEndingAddress extends StatefulWidget {
  final int index;
  final String title;

  const TripEndingAddress({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  State<TripEndingAddress> createState() => _TripEndingAddressState();
}

class _TripEndingAddressState extends State<TripEndingAddress> {
  @override
  Widget build(BuildContext context) {
    // Access the SurveyPTProvider object using Provider.of method
    SurveyPTProvider surveyPt =
        Provider.of<SurveyPTProvider>(context, listen: false);

    // Get the ending address object from the trip mode list
    var endingAddressObj =
        TripModeList.tripModeList[widget.index].endingAddress;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Add some vertical spacing
          AppSize.spaceHeight2(context),

          // Show the trip title
          HeadlineText(text: widget.title),

          // Display the checkbox for Home ending
          Row(
            children: [
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
                    TripModeList.tripModeList[widget.index].isHomeEnding =
                        value!;
                    if (TripModeList.tripModeList[widget.index].isHomeEnding ==
                        true) {
                      endingAddressObj?.tripAddressLong =
                          surveyPt.hhsAddressLong;
                      endingAddressObj?.tripAddressLat = surveyPt.hhsAddressLat;
                    } else {
                      endingAddressObj?.tripAddressLong =
                          surveyPt.endingAddressLatLng?.longitude.toString();
                      endingAddressObj?.tripAddressLat =
                          surveyPt.endingAddressLatLng?.latitude.toString();
                    }
                  });
                },
              ),
            ],
          ),

          // Show the details of the ending address
          Column(
            children: [
              TripModeList.tripModeList[widget.index].isHomeEnding == true
                  ? Container()
                  : Row(
                      children: [
                        const Image(
                            image: AssetImage(ImageAssets.locationIcon)),
                        AppSize.spaceWidth2(context),
                        const Text('الإحداثيات'),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // Navigate to the MapSearchScreen to search for the address
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapSearchScreen(
                                  callBack: (LatLng latLong) {
                                    // Update the ending address coordinates on the survey provider object
                                    surveyPt.endAddressLatLng = latLong;

                                    // Update the ending address coordinates in the trip mode list
                                    setState(() {
                                      endingAddressObj?.tripAddressLong =
                                          surveyPt
                                              .endingAddressLatLng?.longitude
                                              .toString();
                                      endingAddressObj?.tripAddressLat =
                                          surveyPt.endingAddressLatLng?.latitude
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
                          ),
                        ),
                      ],
                    ),
              Row(
                children: [
                  ItemTextSpan(
                      title: "Lat",
                      subTitle: endingAddressObj?.tripAddressLat ?? ""),
                  AppSize.spaceWidth3(context),
                  ItemTextSpan(
                      title: "Long",
                      subTitle: endingAddressObj?.tripAddressLong ?? ""),
                ],
              ),

              // Add some vertical spacing
              AppSize.spaceHeight2(context),
            ],
          ),
        ],
      ),
    );
  }
}
