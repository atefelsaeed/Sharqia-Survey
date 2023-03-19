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

class TripStartingAddress extends StatefulWidget {
  final int index;
  final String title;

  const TripStartingAddress({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  @override
  _TripStartingAddressState createState() => _TripStartingAddressState();
}

class _TripStartingAddressState extends State<TripStartingAddress> {
  void _onHomeCheckboxChanged(bool? value) {
    final surveyPt = Provider.of<SurveyPTProvider>(context, listen: false);
    final startBeginningModel =
        TripModeList.tripModeList[widget.index].startBeginningModel;
    setState(() {
      TripModeList.tripModeList[widget.index].isHome = value ?? false;
      if (TripModeList.tripModeList[widget.index].isHome) {
        startBeginningModel?.tripAddressLong = surveyPt.hhsAddressLong;
        startBeginningModel?.tripAddressLat = surveyPt.hhsAddressLat;
      } else {
        surveyPt.startingAddressLatLng = null;
        startBeginningModel?.tripAddressLong = null;
        startBeginningModel?.tripAddressLat = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final surveyPt = Provider.of<SurveyPTProvider>(context);
    final isHome = TripModeList.tripModeList[widget.index].isHome;
    final startBeginningModel =
        TripModeList.tripModeList[widget.index].startBeginningModel;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeadlineText(text: widget.title),
          Row(
            children: [
              TextGlobal(
                text: 'المنزل',
                fontSize: width(context) * 0.03,
                color: ColorManager.grayColor,
              ),
              Checkbox(
                side:
                    BorderSide(color: ColorManager.orangeTxtColor, width: 1.5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                checkColor: ColorManager.whiteColor,
                focusColor: ColorManager.orangeTxtColor,
                activeColor: ColorManager.orangeTxtColor,
                value: isHome,
                onChanged: _onHomeCheckboxChanged,
              ),
            ],
          ),
          isHome == false
              ? Row(
                  children: [
                    Image.asset(
                      ImageAssets.locationIcon,
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text('الإحداثيات'),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        final latLong = await Navigator.push<LatLng>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapSearchScreen(
                              callBack: (LatLng latLong) {
                                // Update the ending address coordinates on the survey provider object
                                surveyPt.endAddressLatLng = latLong;

                                // Update the ending address coordinates in the trip mode list
                                setState(() {
                                  startBeginningModel?.tripAddressLong =
                                      surveyPt.endingAddressLatLng?.longitude
                                              .toString() ??
                                          '0.0';
                                  startBeginningModel?.tripAddressLat = surveyPt
                                          .endingAddressLatLng?.latitude
                                          .toString() ??
                                      '0.0';
                                });
                              },
                            ),
                          ),
                        );
                        if (latLong != null) {
                          surveyPt.startingAddressLatLng = latLong;
                          setState(() {
                            startBeginningModel?.tripAddressLong =
                                latLong.longitude.toString();
                            startBeginningModel?.tripAddressLat =
                                latLong.latitude.toString();
                          });
                        }
                      },
                      icon: Icon(
                        Icons.pin_drop,
                        color: ColorManager.primaryColor,
                        size: width(context) * 0.1,
                      ),
                    ),
                  ],
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemTextSpan(
                title: 'Lat',
                subTitle: startBeginningModel?.tripAddressLat ?? '',
              ),
              ItemTextSpan(
                title: 'Long',
                subTitle: startBeginningModel?.tripAddressLong ?? '',
              ),
            ],
          )
        ],
      ),
    );
  }
}
