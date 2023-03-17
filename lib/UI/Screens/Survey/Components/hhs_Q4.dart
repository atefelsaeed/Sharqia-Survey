import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/components/headline_trip.dart';

import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/custom_buttton.dart';
import '../../../Widgets/show_dialog_error.dart';
import '../widgets/field_widget.dart';

class HHSQ4 extends StatefulWidget {
  HHSQ4({
    super.key,
    required this.q6peopleAdults18,
    required this.q6peopleUnder18,
    required this.q6totalNumberOfVec,
  });

  List<TextEditingController> q6peopleAdults18 = <TextEditingController>[
    TextEditingController()
  ];
  List<TextEditingController> q6peopleUnder18 = <TextEditingController>[
    TextEditingController()
  ];
  List<TextEditingController> q6totalNumberOfVec = <TextEditingController>[
    TextEditingController()
  ];

  @override
  State<HHSQ4> createState() => _HHSQ4State();
}

class _HHSQ4State extends State<HHSQ4> {
  void showError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var total = HhsStatic.householdQuestions.hhsNumberSeparateFamilies;
        return ShowErrorDialog(
          title: 'لا يمكنك إضافة المزيد',
          content: 'عدد العائلات المنفصلة التي تعيش في هذا العنوان هو ($total)'
              '',
        );
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint('total');
    debugPrint(widget.q6peopleAdults18.length.toString());
    return Column(
      children: [
        const HeadlineText(
            text:
                "4.كم عدد الأشخاص في كل عائلة منفصلة تعيش في هذا العنوان؟ و كم عدد المركبات ؟"),
        for (int i = 0; i < widget.q6peopleAdults18.length; i++)
          Column(
            children: [
              Field(
                peopleAdults18: widget.q6peopleAdults18[i],
                function: () {
                  setState(() {
                    widget.q6peopleAdults18.removeAt(i);
                    widget.q6peopleUnder18.removeAt(i);
                    widget.q6totalNumberOfVec.removeAt(i);
                  });
                },
                showDeleteIcon: i >= 1 ? true : false,
                peopleUnder18Text: "الأطفال اقل من 18",
                peopleAdults18Text: "البالغين + 18 ",
                totalNumberOfVecText: "إجمالي عدد المركبات في كل عائلة",
                peopleUnder18: widget.q6peopleUnder18[i],
                totalNumberOfVec: widget.q6totalNumberOfVec[i],
                isHome: false,
              ),
              AppSize.spaceHeight2(context),
            ],
          ),
        AppSize.spaceHeight2(context),
        HhsStatic.householdQuestions.hhsNumberSeparateFamilies.toString() == "1"
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultButton(
                    function: () {
                      setState(() {

                        int x = 0;
                        if (HhsStatic.householdQuestions
                            .hhsNumberSeparateFamilies!.isNotEmpty) {
                          x = int.parse(HhsStatic.householdQuestions
                                  .hhsNumberSeparateFamilies ??
                              '0');
                        } else {
                          x = 0;
                        }

                        if (widget.q6peopleUnder18.length < x) {
                          widget.q6peopleAdults18.add(TextEditingController());
                          widget.q6peopleUnder18.add(TextEditingController());
                          widget.q6totalNumberOfVec
                              .add(TextEditingController());
                        } else {
                          showError();
                        }
                      });
                    },
                    isWidget: true,
                    text: "أضافة المزيد",
                  ),
                ],
              )
      ],
    );
  }
}
