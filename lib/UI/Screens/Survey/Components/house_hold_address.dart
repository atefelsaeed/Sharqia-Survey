import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Models/HHS_SurvyModels/hhs_models.dart';
import 'package:sharqia_household_survey/UI/Screens/notes_screen.dart';
import 'package:sharqia_household_survey/UI/Widgets/custom_buttton.dart';
import 'package:sharqia_household_survey/UI/Widgets/item_text_span.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Models/user_serveys_model.dart';
import '../../../../Resources/assets_manager.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/text.dart';

class HouseHoldAddress extends StatelessWidget {
  const HouseHoldAddress({
    super.key,
    required this.itemSurveyModel,
  });

  final UserSurveysModelData itemSurveyModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        itemSurveyModel.status == 'edit'
            ? Column(
                children: [
                  Row(

                    children: [
                      const Image(image: AssetImage(ImageAssets.lampIcon)),
                      AppSize.spaceWidth2(context),
                      Text(
                        "عرض ملاحظات التعديل ",
                        style: TextStyle(
                          color: ColorManager.grayColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      DefaultButton(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotesScreen(
                                  notes: itemSurveyModel.note ??
                                      'لا توجد ملاحظات'),
                            ),
                          );
                        },
                        isWidget: true,
                        btnWidth: width(context) * .4,
                        text: 'عرض الملاحظات',
                      ),
                    ],
                  ),
                  AppSize.spaceHeight1(context),
                  const Divider(thickness: 1),
                ],
              )
            : Container(),
        AppSize.spaceHeight1(context),
        Row(
          children: [
            const Image(image: AssetImage(ImageAssets.locationIcon)),
            AppSize.spaceWidth1(context),
            Text(
              "عنوان الاسرة: ",
              style: TextStyle(
                color: ColorManager.grayColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemTextSpan(
                title: 'رقم الاسرة', subTitle: itemSurveyModel.id.toString()),
            ItemTextSpan(
                title: 'رقم الحى', subTitle: itemSurveyModel.haeno.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemTextSpan(
                title: 'رقم القطاع', subTitle: itemSurveyModel.qta.toString()),
            ItemTextSpan(
                title: 'رقم البلوك', subTitle: itemSurveyModel.blok.toString()),
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        AppSize.spaceHeight1(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                    width: width(context) * .45,
                    child: TextGlobal(
                      text: "رقم الهاتف",
                      fontSize: height(context) * .02,
                      color: ColorManager.black,
                    )),
                AppSize.spaceHeight1(context),
                MyTextForm(
                  label: "رقم الهاتف",
                  controller: HhsStatic.householdAddress.hhsPhone,
                  isNumber: true,
                  onTap: () {  },
                  keyboardType: TextInputType.phone,
                ),
              ],
            )
          ],
        ),
        AppSize.spaceHeight2(context),
      ],
    );
  }
}
