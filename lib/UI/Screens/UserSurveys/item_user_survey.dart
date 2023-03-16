import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/assets_manager.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/UserSurveys/components/editd_button.dart';
import 'package:sharqia_household_survey/UI/Widgets/item_text_span.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Models/user_serveys_model.dart';
import '../../../Providers/user_surveys.dart';

class ItemUserSurvey extends StatelessWidget {
  const ItemUserSurvey(
      {Key? key, required this.itemSurveyModel, required this.index})
      : super(key: key);
  final UserSurveysModelData itemSurveyModel;
  final int index;

  launchURL(String lat, long) async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$long,$lat";

    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      debugPrint('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final userSurveysProvider = Provider.of<UserSurveysProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Image(image: AssetImage(ImageAssets.lampIcon)),
            AppSize.spaceWidth1(context),
            Text(
              "رقم الاسرة : ",
              style: TextStyle(
                color: ColorManager.grayColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "${itemSurveyModel.id}",
              style: TextStyle(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            if (itemSurveyModel.status == "not filled")
              NotFilledButton(
                  function: () {
                    userSurveysProvider.userSurveyStatus =
                        itemSurveyModel.status;
                    userSurveysProvider.saveUpdateUser(itemSurveyModel);
                    debugPrint(userSurveysProvider.userSurveyStatus.toString());
                    userSurveysProvider.index = index;
                  },
                  itemSurveyModel: itemSurveyModel),
            if (itemSurveyModel.status == "edit")
              EditButton(
                  function: () {
                    userSurveysProvider.userSurveyStatus =
                        itemSurveyModel.status;
                    debugPrint(userSurveysProvider.userSurveyStatus.toString());
                    userSurveysProvider.index = index;
                  },
                  itemSurveyModel: itemSurveyModel),
            if (itemSurveyModel.status == "edited")
              EditedButton(function: () {
                userSurveysProvider.userSurveyStatus = itemSurveyModel.status;
                debugPrint(userSurveysProvider.userSurveyStatus.toString());
              }),
            if (itemSurveyModel.status == "filled")
              FilledButton(function: () {
                userSurveysProvider.userSurveyStatus = itemSurveyModel.status;
                debugPrint(userSurveysProvider.userSurveyStatus.toString());
              }),
          ],
        ),
        AppSize.spaceHeight2(context),
        Row(
          children: [
            const Image(image: AssetImage(ImageAssets.lampIcon)),
            AppSize.spaceWidth1(context),
            Text(
              'الحالة',
              style: TextStyle(
                color: ColorManager.grayColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            if (itemSurveyModel.status == 'filled') const Text('معبئة'),
            if (itemSurveyModel.status == 'not filled') const Text('غير معبئة'),
            if (itemSurveyModel.status == 'edit') const Text('تعديل'),
            if (itemSurveyModel.status == 'edited') const Text('اتعدلت'),
            AppSize.spaceWidth15(context),
          ],
        ),
        Divider(color: ColorManager.primaryColor),
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
            const Spacer(),
            TextButton(
              onPressed: () async {
                await launchURL(
                    itemSurveyModel.x.toString(), itemSurveyModel.y.toString());
              },
              child: Text(
                'افتح خرائط جوجل',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width(context) * .6,
              child: ItemTextSpan(
                  title: "إسم الحى",
                  subTitle: itemSurveyModel.hAEName.toString()),
            ),
            SizedBox(
              width: width(context) * .3,
              child: ItemTextSpan(
                  title: "رقم الحى",
                  subTitle: itemSurveyModel.haeno.toString()),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width(context) * .6,
              child: ItemTextSpan(
                  title: "إسم البلوك",
                  subTitle: itemSurveyModel.blokname.toString()),
            ),
            SizedBox(
              width: width(context) * .3,
              child: ItemTextSpan(
                  title: "رقم البلوك",
                  subTitle: itemSurveyModel.blok.toString()),
            ),
          ],
        ),
        ItemTextSpan(
            title: "رقم القطاع", subTitle: itemSurveyModel.qta.toString()),
      ],
    );
  }
}
