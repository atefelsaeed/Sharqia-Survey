import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';

import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';
import '../../Survey/widgets/list_view_check_box_orange.dart';

class Nationality extends StatefulWidget {
  final int i;

  const Nationality({
    super.key,
    required this.i,
  });

  @override
  State<Nationality> createState() => _NationalityState();
}

class _NationalityState extends State<Nationality> {
  @override
  Widget build(BuildContext context) {
    var base = PersonModelList.personModelList[widget.i];
    return Column(
      children: [
        ListViewCheckBoxOrange(
          map: PersonModelList.personModelList[widget.i].nationality,
          onChange: (ChangeBoxResponse r) {
            PersonModelList.personModelList[widget.i].personalHeadData!
                .nationalityType = r.val;

            if (PersonModelList.personModelList[widget.i].personalHeadData!
                        .nationalityType !=
                    "سعودي" &&
                r.check == true) {
              setState(() {
                PersonModelList.personModelList[widget.i].personalHeadData!
                    .showText = true;
                PersonModelList
                    .personModelList[widget.i].nationality["isChick"] = true;
                PersonModelList.personModelList[widget.i].personalHeadData!
                    .nationality.text = "";
              });
            } else {
              setState(() {
                PersonModelList.personModelList[widget.i].personalHeadData!
                    .showText = false;
                PersonModelList.personModelList[widget.i].personalHeadData!
                    .nationality.text = "سعودي";
              });
            }
          },
          isListView: true,
          title: "الجنسية ",
          question: PersonModelList
              .personModelList[widget.i]
              .nationality[PersonModelList
                  .personModelList[widget.i].nationality.keys.first]!
              .toList(),
          subTitle:
              " في حالة ازدواج الجنسية ؛ يرجى تسجيل جواز السفر / الجنسية التي يحمل عليها الشخص تأشيرة الإقامة في المملكة العربية السعودية ",
        ),
        AppSize.spaceHeight2(context),
        (base.personalHeadData!.showText == true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyTextForm(
                    label: "أدخل جنسيتك",
                    isNumber: false,
                    controller: base.personalHeadData!.nationality,
                    onChanged: (String? val) {
                      // base.personalHeadData!.nationality.text = val!;
                    },
                  ),
                  AppSize.spaceWidth2(context),
                  TextGlobal(
                    text: "اكتب جنسيتك",
                    fontSize: height(context) * .023,
                    color: ColorManager.gray2Color,
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
