import 'package:flutter/cupertino.dart';

import '../../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class AdultsOrNot extends StatelessWidget {
  const AdultsOrNot({super.key, required this.adultsModel});

  final TravelWithOtherModel adultsModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
      /*  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextGlobal(
              text: adultsModel.text!,
              fontSize: height(context) * .02,
              color: ColorManager.black,
            ),
          ],
        ),*/
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: adultsModel.childrenNumber,
                  widthForm: width(context) * .1,
                  onTap: () {  },
                  keyboardType: TextInputType.number,isNumber: true,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "الأطفال اقل من 18",
                  fontSize: height(context) * .015,
                  color: ColorManager.black,
                ),
              ],
            ),
            AppSize.spaceWidth3(context),
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: adultsModel.adultsNumber,
                  widthForm: width(context) * .1,
                  keyboardType: TextInputType.number,
                  onTap: () {  },
                  isNumber: true,
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "البالغين + 18 ",
                  fontSize: height(context) * .017,
                  color: ColorManager.grayColor,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
