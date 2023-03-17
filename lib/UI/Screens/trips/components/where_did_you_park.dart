import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/provider/trip_provider.dart';

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
    Key? key,
    required this.costTaxi,
    required this.index,
  }) : super(key: key);

  @override
  State<WhereDidYouPark> createState() => _WhereDidYouParkState();
}

class _WhereDidYouParkState extends State<WhereDidYouPark> {
  @override
  Widget build(BuildContext context) {
    final bas = TripModeList.tripModeList[widget.index].travelTypeModel;
    final provider = Provider.of<TripProvider>(context, listen: false);

    return Column(
      children: [
        const HeadlineText(text: "8. سؤال متعلق بنوع المركبة"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: bas.travelType!.isNotEmpty
                  ? Text(bas.travelType!)
                  : const Text('إختار'),
              hint: "بماذا ذهبت ؟",
              options: TripData
                  .whatTypeOfTravel[TripData.whatTypeOfTravel.keys.first]!
                  .toList(),
              onChange: (String? p) {
                setState(() {
                  bas.travelType = p ?? '';
                });
              },
            ),
            if (bas.travelType == "سيارة" || bas.travelType == "دراجة نارية")
              DropDownFormInput(
                label: bas.carParkingPlace!.isNotEmpty
                    ? Text(bas.carParkingPlace!)
                    : const Text('إختار'),
                hint: "أین أوقفت ${bas.travelType}؟",
                options: TripData
                    .whereDidYouPark[TripData.whereDidYouPark.keys.first]!
                    .toList(),
                onChange: (String? p) {
                  setState(() {
                    bas.carParkingPlace = p ?? '';
                    if (bas.carParkingPlace == "أخر") {
                      bas.otherWhereDidYouParking.text = ' "أخر"';
                      bas.carParkingPlace = bas.otherWhereDidYouParking.text;
                    } else {
                      bas.carParkingPlace = p!;
                      bas.otherWhereDidYouParking.text = bas.carParkingPlace!;
                    }
                  });
                },
              ),
            if (bas.travelType == "تاكسي")
              DropDownFormInput(
                label: bas.taxiTravelType!.isNotEmpty
                    ? Text(bas.taxiTravelType!)
                    : const Text('إختار'),
                hint: "نوع التاكسي الذي استخدمته.و كم الأجرة التي دفعتھا؟",
                options: TripData
                    .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                    .toList(),
                onChange: (String? p) {
                  provider.taxiTravelType(widget.index, p);
                },
              ),
          ],
        ),
        if ((bas.carParkingPlace == "أخر" &&
                (bas.travelType == "سيارة" ||
                    bas.travelType == "دراجة نارية")) ||
            (bas.carParkingPlace!.isNotEmpty &&
                !TripData.whereDidYouPark[TripData.whereDidYouPark.keys.first]!
                    .contains(bas.carParkingPlace)))
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextForm(
                controller: bas.otherWhereDidYouParking,
                text: "أین أوقفت ${bas.travelType}؟",
                onChanged: (val) {
                  setState(() {
                    bas.carParkingPlace = val;
                  });
                },
                label: "أین أوقفت ${bas.travelType}؟",
              ),
            ],
          ),
        const SizedBox(height: 16),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (bas.travelType == "تاكسي" ||
                  bas.carParkingPlace == 'موقف سيارات عام - مدفوع')
                TextForm(
                  controller: widget.costTaxi,
                  text: "ما مقدار الأجرة التي دفعتھا؟",
                  onChanged: (value) {},
                  label: "ما مقدار الأجرة التي دفعتھا؟",
                  keyboardType: TextInputType.number,
                  isNumber: true,
                ),
              if (bas.taxiTravelType == "تاكسي" &&
                  (bas.taxiTravelType == "أخر" ||
                      !TripData
                          .whatTypeOfTaxi[TripData.whatTypeOfTaxi.keys.first]!
                          .contains(bas.taxiTravelType)))
                Column(
                  children: [
                    const SizedBox(height: 16),
                    SizedBox(
                      width: width(context) * .45,
                      child: TextGlobal(
                        text: "نوع التاكسي الذي استخدمته",
                        fontSize: height(context) * .02,
                        color: ColorManager.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    MyTextForm(
                      controller: bas.taxiTravelTypeOther,
                      label: "نوع التاكسي الذي استخدمته",
                      onChanged: (val) {
                        setState(() {
                          bas.taxiTravelType = val;
                        });
                      },
                      onTap: () {},
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (bas.travelType == "وسائل النقل العام")
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextForm(
                  controller: bas.taxiFare,
                  text: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
                  onChanged: (value) {},
                  label: "وسائل النقل العام ، ما مقدار الأجرة التي دفعتھا؟",
                  keyboardType: TextInputType.number,
                  isNumber: true,
                ),
                Column(
                  children: [
                    const SizedBox(height: 16),
                    SizedBox(
                      width: width(context) * .45,
                      child: TextGlobal(
                        text:
                            " في حالة استخدام تذكرة دائمة، ما نوعھا . فى حالة عدم وجود تذكرة يكتب (لا)",
                        fontSize: height(context) * .02,
                        color: ColorManager.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    MyTextForm(
                      label: "نوع التذكرة",
                      controller: bas.ticketSub,
                      onChanged: (val) {
                        setState(() {
                          bas.taxiTravelType = val;
                        });
                      },
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          )
      ],
    );
  }
}
