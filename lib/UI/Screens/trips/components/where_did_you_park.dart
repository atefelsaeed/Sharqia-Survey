import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Resources/colors.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';
import '../../Survey/widgets/text_form_row.dart';
import 'headline_trip.dart';

class WhereDidYouPark extends StatefulWidget {
  final TextEditingController costTaxi;
  final int index;

  const WhereDidYouPark({
    super.key,
    required this.costTaxi,
    required this.index,
  });

  @override
  State<WhereDidYouPark> createState() => _WhereDidYouParkState();
}

class _WhereDidYouParkState extends State<WhereDidYouPark> {
  @override
  Widget build(BuildContext context) {
    var bas = TripModeList.tripModeList[widget.index].travelTypeModel;
    // TODO: implement build
    return Column(
      children: [
        const HeadlineText(text: "8. سؤال متعلق بنوع المركبة"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: bas.travelType != ''
                  ? Text(bas.travelType ?? '')
                  : const Text('إختار'),
              hint: "بماذا ذهبت ؟",
              options: TripData
                  .whatTypeOfTravel[TripData.whatTypeOfTravel.keys.first]!
                  .toList(),
              onChange: (String? p) {
                setState(() {
                  bas.travelType = p.toString();
                });
              },
            ),
            (bas.travelType == "سيارة") || (bas.travelType == "دراجة نارية")
                ? DropDownFormInput(
                    label: bas.carParkingPlace != ''
                        ? Text(bas.carParkingPlace ?? '')
                        : const Text('إختار'),
                    hint: "أین أوقفت ${bas.travelType}؟",
                    options: TripData
                        .whereDidYouPark[TripData.whereDidYouPark.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      bas.carParkingPlace = p.toString();

                      setState(() {
                        bas.carParkingPlace = p.toString();
                      });
                    })
                : Container(),
            bas.travelType == "تاكسي"
                ? DropDownFormInput(
                    label: bas.taxiTravelType != ''
                        ? Text(bas.taxiTravelType ?? '')
                        : const Text('إختار'),
                    hint: "نوع التاكسي الذي استخدمتھ وكم الأجرة التي دفعتھا؟",
                    options: TripData
                        .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      setState(() {
                        bas.taxiTravelType = p.toString();
                      });
                    })
                : Container(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ((bas.carParkingPlace == "أخر" && bas.travelType == "سيارة") ||
                    (bas.carParkingPlace == "أخر" &&
                        bas.travelType == "دراجة نارية"))
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextForm(
                        controller: bas.otherWhereDidYouParking!,
                        text: "أین أوقفت ${bas.travelType}؟",
                        label: "أین أوقفت ${bas.travelType}؟",
                      )
                    ],
                  )
                : Container(),
          ],
        ),
        AppSize.spaceHeight2(context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              bas.travelType == "تاكسي"
                  ? TextForm(
                      controller: widget.costTaxi,
                      text: "كم أجرة التاكسي دفعتھ؟",
                      label: "كم أجرة التاكسي دفعتھ؟",
                      keyboardType: TextInputType.number,
                      isNumber: true,
                    )
                  : Container(),
            ],
          ),
        ),
        AppSize.spaceHeight2(context),
        bas.travelType == "وسائل النقل العام"
            ? Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextForm(
                      controller: bas.taxiFare,
                      text: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
                      label: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
                      keyboardType: TextInputType.number,
                      isNumber: true,
                    ),
                    Column(
                      children: [
                        AppSize.spaceHeight3(context),
                        SizedBox(
                            width: width(context) * .45,
                            child: TextGlobal(
                              text:
                                  " في حالة استخدام تذكرة دائمة، ما نوعھا . فى حالة عدم وجود تذكرة يكتب (لا)",
                              fontSize: height(context) * .02,
                              color: ColorManager.black,
                            )),
                        AppSize.spaceHeight1(context),
                        MyTextForm(
                          label: "نوع التذكرة",
                          controller: bas.ticketSub,
                          onChanged: (val) {
                            bas.taxiTravelType = val;
                          },
                          keyboardType: TextInputType.text,
                          // isNumber: true,
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
