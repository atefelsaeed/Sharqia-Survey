import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Models/Trips_SurveyModel/trips_model.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/UI/Widgets/text.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../../Data/select_time.dart';
import '../../../../Resources/sizes.dart';
import '../../../../Resources/style_manager.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/show_dialog_error.dart';
import 'headline_trip.dart';

extension on DateTime {
  DateTime roundDown({Duration delta = const Duration(minutes: 5)}) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds);
  }
}

class DepartTime extends StatefulWidget {
  TripsModel tripModel;
  int i;

  DepartTime({
    super.key,
    required this.tripModel,
    required this.i,
  });

  @override
  State<DepartTime> createState() => _DepartTimeState();
}

class _DepartTimeState extends State<DepartTime> with SelectTimeData {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const HeadlineText(text: "9. في أي وقت وصلت؟"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: width(context) * .45,
                child: TextGlobal(
                  text: "وقت الوصول",
                  fontSize: height(context) * .02,
                  color: ColorManager.black,
                )),
            AppSize.spaceHeight1(context),
            MyTextForm(
              label: "وقت الوصول",
              controller: widget
                  .tripModel.arrivalDepartTime.arriveDestinationTime
                  .orDefault(TextEditingController()),

              readOnly: true,
              // set it true, so that user will not able to edit text
              onTap: () async {
                if (TripModeList
                    .tripModeList[widget.i].departureTime.text.isEmpty
                    .orDefault(false)) {
                  showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const ShowErrorDialog(
                          title: 'يجب إدخال وقت المغادرة ',
                          content: 'يجب إدخال وقت المغادرة أولاً!',
                        );
                      });
                } else {
                  TimeOfDay? pickedTime = await showTimePicker(
                    initialTime:
                        TimeOfDay.fromDateTime(DateTime.now().roundDown()),
                    builder: (context, child) {
                      return StyleManager.selectTime(
                          context, child ?? Container());
                    },
                    context: context,
                  );
                  if (pickedTime != null) {
                    String arrival = TripModeList
                        .tripModeList[widget.i].departureTime.text
                        .orDefault('');
                    int newFromTimeHour = int.parse(
                        time12to24Format(arrival.toString())
                            .split(":")
                            .first
                            .orDefault(''));
                    int newFromTimeM = int.parse(
                        time12to24Format(arrival.toString())
                            .split(":")
                            .last
                            .orDefault(''));
                    int pickedHour = int.parse(
                        time12to24Format(pickedTime.format(context).toString())
                            .split(":")
                            .first
                            .orDefault(''));
                    int pickedM = int.parse(
                        time12to24Format(pickedTime.format(context).toString())
                            .split(":")
                            .last
                            .orDefault(''));

                    if (pickedHour == newFromTimeHour &&
                        newFromTimeM < pickedM) {
                      setState(() {
                        widget.tripModel.arrivalDepartTime.arriveDestinationTime
                                .text =
                            pickedTime.format(context).orDefault(''); //s
                      });
                    } else if (pickedHour > newFromTimeHour) {
                      setState(() {
                        widget.tripModel.arrivalDepartTime.arriveDestinationTime
                                .text =
                            pickedTime.format(context).orDefault(''); //s
                      });
                    }
                  } else {
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return const ShowErrorDialog(
                            title: 'يجب إختيار وقت آخر',
                            content: 'وقت المغادرة يجب أن يكون قبل وقت الوصول!',
                          );
                        });
                    setState(() {
                      widget.tripModel.arrivalDepartTime.arriveDestinationTime
                          .text = '';
                    });
                    debugPrint("Time is not selected");
                  }
                }
                // FocusScope.of(context).requestFocus(FocusNode());
              },
            ),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              label: TripModeList.tripModeList[widget.i].arrivalDepartTime
                          .numberRepeatTrip!
                          .orDefault('') !=
                      ''
                  ? Text(TripModeList.tripModeList[widget.i].arrivalDepartTime
                      .numberRepeatTrip!
                      .orDefault(''))
                  : const Text('إختار'),
              hint: "كم مرة تقوم بهذە الرحلة؟",
              options: TripData.howOftenDoYouMakeThisTrip[
                      TripData.howOftenDoYouMakeThisTrip.keys.first]!
                  .toList(),
              onChange: (String? p) {
                setState(() {
                  TripModeList.tripModeList[widget.i].arrivalDepartTime
                      .numberRepeatTrip = p!.orDefault('');
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sharqia_household_survey/Models/Trips_SurveyModel/trips_model.dart';
// import 'package:sharqia_household_survey/Resources/colors.dart';
// import 'package:sharqia_household_survey/UI/Widgets/text.dart';
// import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';
//
// import '../../../../Data/HouseholdPart1/TripsData/trip_data.dart';
// import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
// import '../../../../Data/select_time.dart';
// import '../../../../Resources/sizes.dart';
// import '../../../../Resources/style_manager.dart';
// import '../../../Widgets/dropdown_form_input.dart';
// import '../../../Widgets/show_dialog_error.dart';
// import 'headline_trip.dart';
//
// // Adds a new method to round down a DateTime object to the nearest time interval
// extension on DateTime {
//   DateTime roundDown({Duration delta = const Duration(minutes: 5)}) {
//     final remainder = this.microsecondsSinceEpoch % delta.inMicroseconds;
//     return DateTime.fromMicrosecondsSinceEpoch(
//         this.microsecondsSinceEpoch - remainder);
//   }
// }
//
// // Renders a form field for selecting the departure time and number of repeat trips
// class DepartTime extends StatefulWidget {
//   final TripsModel tripModel;
//   final int index;
//
//   const DepartTime({
//     Key? key,
//     required this.tripModel,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   State<DepartTime> createState() => _DepartTimeState();
// }
//
// class _DepartTimeState extends State<DepartTime> with SelectTimeData {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const HeadlineText(text: "9. في أي وقت وصلت؟"),
//         SizedBox(
//           width: width(context) * 0.45,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextGlobal(
//                 text: "وقت الوصول",
//                 fontSize: height(context) * 0.02,
//                 color: ColorManager.black,
//               ),
//               AppSize.spaceHeight1(context),
//               MyTextForm(
//                 label: "وقت الوصول",
//                 controller: widget
//                     .tripModel.arrivalDepartTime.arriveDestinationTime
//                     .orDefault(TextEditingController()),
//                 readOnly: true,
//                 onTap: () async {
//                   final departureTimeText = TripModeList
//                       .tripModeList[widget.index].departureTime.text;
//                   if (departureTimeText.isEmpty.orDefault(false)) {
//                     showDialog<void>(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return const ShowErrorDialog(
//                           title: 'يجب إدخال وقت المغادرة ',
//                           content: 'يجب إدخال وقت المغادرة أولاً!',
//                         );
//                       },
//                     );
//                   } else {
//                     final pickedTime = await showTimePicker(
//                       initialTime:
//                           TimeOfDay.fromDateTime(DateTime.now().roundDown()),
//                       builder: (context, child) => StyleManager.selectTime(
//                           context, child ?? Container()),
//                       context: context,
//                     );
//                     if (pickedTime != null) {
//                       final arrivalTimeText = TripModeList
//                           .tripModeList[widget.index].departureTime.text
//                           .orDefault('');
//
//                       final arrivalTime = DateTime.parse(
//                           "1970-01-01 ${time12to24Format(arrivalTimeText)}:00");
//
//                       final pickedTimeHour = int.parse(
//                           time12to24Format(pickedTime.format(context))
//                               .split(":")
//                               .first
//                               .orDefault(''));
//
//                       final pickedTimeMinute = int.parse(
//                           time12to24Format(pickedTime.format(context))
//                               .split(":")
//                               .last
//                               .orDefault(''));
//
//                       final pickedTimeDateTime = DateTime.parse(
//                           "1970-01-01 $pickedTimeHour:$pickedTimeMinute:00");
//
//                       if (pickedTimeDateTime.isAfter(arrivalTime)) {
//                         setState(() {
//                           widget
//                               .tripModel
//                               .arrivalDepartTime
//                               .arriveDestinationTime
//                               .text = pickedTime.format(context).orDefault('');
//                           debugPrint('debnm,,');
//                           debugPrint(widget.tripModel.arrivalDepartTime
//                               .arriveDestinationTime.text);
//                         });
//                       } else {
//                         showDialog<void>(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return const ShowErrorDialog(
//                               title: 'يجب إختيار وقت آخر',
//                               content:
//                                   'وقت المغادرة يجب أن يكون قبل وقت الوصول!',
//                             );
//                           },
//                         );
//                         setState(() {
//                           widget.tripModel.arrivalDepartTime
//                               .arriveDestinationTime.text = '';
//                         });
//                         debugPrint("Error: Invalid time selected");
//                       }
//                     } else {
//                       debugPrint("Time is not selected");
//                     }
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//         AppSize.spaceHeight2(context),
//         DropDownFormInput(
//           label: TripModeList.tripModeList[widget.index].arrivalDepartTime
//                       .numberRepeatTrip
//                       ?.orDefault('') !=
//                   ''
//               ? Text(TripModeList.tripModeList[widget.index].arrivalDepartTime
//                   .numberRepeatTrip!
//                   .orDefault(''))
//               : const Text('إختار'),
//           hint: "كم مرة تقوم بهذە الرحلة؟",
//           options: TripData.howOftenDoYouMakeThisTrip[
//                   TripData.howOftenDoYouMakeThisTrip.keys.first]!
//               .toList(),
//           onChange: (String? value) {
//             setState(() {
//               TripModeList.tripModeList[widget.index].arrivalDepartTime
//                   .numberRepeatTrip = value?.orDefault('');
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
