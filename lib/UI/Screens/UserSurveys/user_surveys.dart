import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Helper/validator.dart';
import 'package:sharqia_household_survey/Providers/user_surveys.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../Models/user_serveys_model.dart';
import 'item_user_survey.dart';

class UserSurveysScreen extends StatefulWidget {
  const UserSurveysScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<UserSurveysScreen> createState() => _UserSurveysScreenState();
}

class _UserSurveysScreenState extends State<UserSurveysScreen> {
  @override
  void initState() {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    userSurveysProvider.fetch(widget.id);

    userSurveysProvider.isSearching = false;
    super.initState();
  }

  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController hayController = TextEditingController();
  TextEditingController qtaController = TextEditingController();
  TextEditingController blocController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userSurveysProvider = Provider.of<UserSurveysProvider>(context);
    List<UserSurveysModelData> list;
    if (userSurveysProvider.isSearching) {
      debugPrint('searchList');
      if (hayController.text.isNotEmpty &&
          qtaController.text.isEmpty &&
          blocController.text.isEmpty) {
        list = userSurveysProvider.hayList;
      } else if (hayController.text.isNotEmpty &&
          qtaController.text.isNotEmpty &&
          blocController.text.isEmpty) {
        list = userSurveysProvider.qtaList;
      } else {
        list = userSurveysProvider.searchList;
      }
    } else {
      debugPrint('userSurveys');
      list = userSurveysProvider.userSurveys;
    }
    return Scaffold(
      body: userSurveysProvider.loading != true
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.subdirectory_arrow_left_rounded,
                          color: ColorManager.primaryColor,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'العودة للرئيسية',
                            style: TextStyle(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: width(context) * .045),
                          ),
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    Form(
                      key: _key,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'رقم الحى',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              MyTextForm(
                                controller: hayController,
                                onTap: () {},
                                onChanged: (value) {
                                  userSurveysProvider.searchHAY(value!);
                                },
                                label: "بحث",
                                widthForm: width(context) * .2,
                                keyboardType: TextInputType.number,
                                isNumber: true,
                                isPassword: false,
                              ),
                            ],
                          ),
                          AppSize.spaceWidth3(context),
                          Column(
                            children: [
                              const Text(
                                'رقم القطاع',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              MyTextForm(
                                controller: qtaController,
                                onChanged: (value) {
                                  userSurveysProvider.searchQTA(value!);
                                },
                                label: "بحث",
                                onTap: () {},
                                widthForm: width(context) * .2,
                                keyboardType: TextInputType.number,
                                isNumber: true,
                                isPassword: false,
                                readOnly:
                                    hayController.text.isEmpty ? true : false,
                              ),
                            ],
                          ),
                          AppSize.spaceWidth3(context),
                          Column(
                            children: [
                              const Text(
                                'رقم البلوك',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              MyTextForm(
                                controller: blocController,
                                onTap: () {},
                                onChanged: (value) {
                                  userSurveysProvider.searchBLOK(value!);
                                },
                                label: "بحث",
                                widthForm: width(context) * .2,
                                keyboardType: TextInputType.number,
                                isNumber: true,
                                isPassword: false,
                                readOnly:
                                    qtaController.text.isEmpty ? true : false,
                              ),
                            ],
                          ),
                          AppSize.spaceWidth3(context),
                          Column(
                            children: [
                              const Text(
                                'بحث',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              AppSize.spaceHeight1(context),
                              Container(
                                width: width(context) * .15,
                                padding:
                                    EdgeInsets.all(AppSize.padding1(context)),
                                decoration: BoxDecoration(
                                    color: userSurveysProvider.isSearching
                                        ? ColorManager.grayColor
                                        : ColorManager.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {
                                      if (hayController.text.isNotEmpty &&
                                          qtaController.text.isEmpty &&
                                          blocController.text.isEmpty) {
                                        userSurveysProvider.changeIcon();
                                      } else if (hayController
                                              .text.isNotEmpty &&
                                          qtaController.text.isNotEmpty &&
                                          blocController.text.isEmpty) {
                                        userSurveysProvider.changeIcon();
                                      } else if (hayController
                                              .text.isNotEmpty &&
                                          qtaController.text.isNotEmpty &&
                                          blocController.text.isNotEmpty) {
                                        userSurveysProvider.changeIcon();
                                      } else {
                                        if (hayController.text.isEmpty) {
                                          Validator.showSnack(context,
                                              'يجب إدخال رقم الحى أولاً!');
                                        }
                                        if (qtaController.text.isEmpty) {
                                          Validator.showSnack(context,
                                              'يجب إدخال رقم الحى أولاً!');
                                        }
                                        if (blocController.text.isEmpty) {
                                          Validator.showSnack(context,
                                              'يجب إدخال رقم الحى أولاً!');
                                        }
                                      }
                                    },
                                    icon: Icon(
                                      Icons.filter_alt_outlined,
                                      color: ColorManager.wight,
                                      size: width(context) * .05,
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    AppSize.spaceHeight2(context),
                    Text(
                      'هام: فى حالة البحث يجب إختيار رقم الحى ثم رقم القطاع ثم رقم البلوك.',
                      style: TextStyle(
                          color: ColorManager.grayColor,
                          fontSize: width(context) * .035),
                    ),
                    AppSize.spaceHeight2(context),
                    list.isNotEmpty
                        ? Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return ItemUserSurvey(
                                  itemSurveyModel: list[index],
                                  index: index,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: ColorManager.grayColor,
                                  height: height(context) * .05,
                                );
                              },
                              itemCount: list.length,
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Center(
                              child: Text(
                                'لا يوجد استبيانات',
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            ),
    );
  }
}
