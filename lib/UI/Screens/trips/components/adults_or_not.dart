import 'package:flutter/cupertino.dart';
import '../../../../Models/Trips_SurveyModel/travel_with_other_model.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';

class AdultsOrNot extends StatelessWidget {
  const AdultsOrNot({required this.adultsModel, Key? key}) : super(key: key);

  final TravelWithOtherModel adultsModel;

  @override
  Widget build(BuildContext context) {
    final childrenNumber = adultsModel.childrenNumber;
    final adultsNumber = adultsModel.adultsNumber;

    return Column(
      children: [
        AppSize.spaceHeight2(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                MyTextForm(
                  label: "",
                  widthForm: width(context) * .15,
                  keyboardType: TextInputType.number,
                  isNumber: true,
                  onTap: () {},
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "الأطفال اقل من 18",
                  fontSize: 14,
                  color: ColorManager.black,
                ),
              ],
            ),
            AppSize.spaceWidth3(context),
            Row(
              children: [
                MyTextForm(
                  label: "",
                  controller: adultsNumber,
                  widthForm: width(context) * .15,
                  keyboardType: TextInputType.number,
                  isNumber: true,
                  onChanged: (value) {
                    adultsModel.adultsNumber.text = value ?? '';
                  },
                  onTap: () {},
                ),
                AppSize.spaceWidth1(context),
                TextGlobal(
                  text: "البالغين + 18 ",
                  fontSize: 14,
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
