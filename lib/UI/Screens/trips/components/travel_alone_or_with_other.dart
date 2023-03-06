import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/list_view_check_box_orange.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/show_dialog_error.dart';
import '../provider/trip_provider.dart';
import 'adults_or_not.dart';

class TravelAlone extends StatefulWidget {
  final int index;

  const TravelAlone({super.key, required this.index});

  @override
  State<TravelAlone> createState() => _TravelAloneState();
}

class _TravelAloneState extends State<TravelAlone> {
  bool isTravel = false;

  void showError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const ShowErrorDialog(
          title: 'لا يمكنك الإختيار',
          content: 'يجب عليك إختيار إسم صاحب الرحلة أولا ثم المحاولة مرة أخرى!',
        );
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<TripProvider>(context, listen: false);
    return Column(
      children: [
        ListViewCheckBoxOrange(
          map: TripModeList.tripModeList[widget.index].travelWithOther,
          onChange: (ChangeBoxResponse r) {
            debugPrint('chosenPerson');

            validationService.isTravelAlone(widget.index, r, context);
            debugPrint(TripModeList.tripModeList[widget.index].chosenPerson);
           /* if (TripModeList
                .tripModeList[widget.index].chosenPerson.isNotEmpty) {
              setState(() {
                if (r.val == "بمفردك") {
                  TripModeList.tripModeList[widget.index].isTravelAlone = false;
                } else if (r.val == "مع الأخرين" && r.check == true) {
                  TripModeList.tripModeList[widget.index].isTravelAlone = true;
                } else {
                  TripModeList.tripModeList[widget.index].isTravelAlone = null;
                }
              });
            } else {
              showError();
              setState(() {
                TripModeList
                        .tripModeList[widget.index]
                        .travelWithOther[TripModeList.tripModeList[widget.index]
                            .travelWithOther.keys.first]!
                        .toList()[
                    TripModeList.tripModeList[widget.index]
                        .travelWithOther['index']]["isChick"] = false;
              });

              debugPrint('no user');
              return false;
            }*/
          },
          isListView: true,
          title: "7. هل ذهبت بمفردك أم مع آخرین؟",
          question: TripModeList.tripModeList[widget.index]
              .travelWithOther[TripData.travelWithOther.keys.first]!
              .toList(),
          subTitle: "",
        ),
        // const Divider(),
        AppSize.spaceHeight2(context),
        TripModeList.tripModeList[widget.index].isTravelAlone == true
            ? AdultsOrNot(
                adultsModel: TripModeList
                    .tripModeList[widget.index].travelWithOtherModel!)
            : Container(),
        AppSize.spaceHeight2(context),
        TripModeList.tripModeList[widget.index].isTravelAlone == true
            ? AdultsOrNot(
                adultsModel: TripModeList
                    .tripModeList[widget.index].travelAloneHouseHold!)
            : Container(),
        AppSize.spaceHeight2(context),
        TripModeList.tripModeList[widget.index].isTravelAlone == true
            ? ListViewCheckBoxOrange2(
                map: TripModeList.tripModeList[widget.index].friendPerson,
                onChange: (ChangeBoxResponse p) {
                  if (TripModeList.tripModeList[widget.index].chosenFriendPerson
                              .contains(p.val) ==
                          false &&
                      p.check == true) {
                    TripModeList.tripModeList[widget.index].chosenFriendPerson
                        .add(p.val);
                  }
                },
                title: "أى من أفراد الاسرة سافر معك؟",
                question: TripModeList
                    .tripModeList[widget.index].friendPerson["friendPerson"],
                subTitle: "أى من أفراد الاسرة سافر معك")
            : Container(),
      ],
    );
  }
}
