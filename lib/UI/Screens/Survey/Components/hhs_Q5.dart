import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';

import '../../../../Resources/colors.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';
import '../../trips/components/headline_trip.dart';

class HHSQ5 extends StatelessWidget {
  const HHSQ5({
    super.key,
    required this.peopleAdults18,
    required this.editingController,
    required this.peopleUnder18,
  });

  final TextEditingController peopleAdults18;
  final EditingController editingController;
  final TextEditingController peopleUnder18;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        const HeadlineText(
          text: "5.كم عدد أفراد عائلتك الذين يعيشون بشكل دائم في هذا المنزل؟",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                TextGlobal(
                  text: "الأطفال اقل من 18",
                  fontSize: height(context) * .015,
                  color: ColorManager.black,
                ),
                AppSize.spaceWidth1(context),
                MyTextForm(
                  label: "",
                  controller: peopleUnder18,
                  onTap: () {},
                  onChanged: (val) {
                    // SurveyCondition()
                    //     .conditionHHSQ5NumUnder18(editingController, context);
                    // int newVal=int.parse(val!);
                  },
                  widthForm: width(context) * .1,
                  keyboardType: TextInputType.number,
                  isNumber: true,
                ),
              ],
            ),
            AppSize.spaceWidth3(context),
            Row(
              children: [
                TextGlobal(
                  text: "البالغين + 18 ",
                  fontSize: height(context) * .017,
                  color: ColorManager.grayColor,
                ),
                AppSize.spaceWidth1(context),
                MyTextForm(
                  onChanged: (d) {
                    debugPrint(d);
                    // SurveyCondition()
                    //     .conditionHHSQ5NumAdults(editingController, context);
                  },
                  label: "",
                  controller: peopleAdults18,
                  widthForm: width(context) * .1,
                  onTap: () {},
                  keyboardType: TextInputType.number,
                  isNumber: true,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
