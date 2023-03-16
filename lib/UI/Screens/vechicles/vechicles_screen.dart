import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/validate_data/vehicles_validation.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/vechicles/components/vechiels_header.dart';
import 'package:sharqia_household_survey/UI/Screens/vechicles/provider/vechiels_provider.dart';
import 'package:sharqia_household_survey/UI/Widgets/custom_buttton.dart';

import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Data/app_constants.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/user_surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/text.dart';
import 'components/controller_vechelies_body.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final validationService = Provider.of<VecProvider>(context, listen: false);
    //
    // validationService.resetVechValues(context);

    // if ((userSurveysProvider.userSurveyStatus == 'edit' &&
    //     AppConstants.isResetVec == true)) {
    // }
    final validationService = Provider.of<VecProvider>(context, listen: false);
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    if ((userSurveysProvider.userSurveyStatus == 'edit' &&
        AppConstants.isResetVec == true)) {
      validationService.resetVechValues(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: _key,
              child: Consumer<VecProvider>(builder: (context, provider, child) {
                return Column(
                  children: [
                    //============VehiclesHeader===============
                    const VehiclesHeader(),
                    AppSize.spaceHeight2(context),
                    //====Check if this family has not vehicles or not.=====
                    (HhsStatic.houseHold[0].totalNumberVehicles
                                .toString()
                                .isEmpty ||
                            HhsStatic.houseHold[0].totalNumberVehicles
                                    .toString()
                                    .trim() ==
                                '0')
                        ?
                        //================Has-Vehicles=================
                        Row(children: [
                            TextGlobal(
                              text: "لا يوجد سيارات",
                              fontSize: width(context) * .03,
                              color: ColorManager.grayColor,
                            ),
                            Checkbox(
                                side: BorderSide(
                                  color: ColorManager.orangeTxtColor,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                checkColor: ColorManager.whiteColor,
                                focusColor: ColorManager.orangeTxtColor,
                                activeColor: ColorManager.orangeTxtColor,
                                value: VehModel.hasVehicles,
                                onChanged: (bool? value) {
                                  setState(() {
                                    VehModel.hasVehicles = value!;
                                  });
                                })
                          ])
                        :
                        //================Vehicles-Body=================
                        const ControllerVehiclesBody(),
                    AppSize.spaceHeight5(context),
                    //======================Footer-Saving-Data======================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                          function: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              SaveVehiclesData.saveData(context);
                              debugPrint('Saving Data :: ');
                              CheckVehiclesValidation.validate(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("يوجد خطأ بالبيانات"),
                                  duration: Duration(seconds: 3),
                                  elevation: 1,
                                ),
                              );
                            }
                          },
                          isWidget: true,
                          text: "التالي",
                          widget: const Icon(Icons.arrow_forward),
                        ),
                        AppSize.spaceWidth3(context),
                        DefaultButton(
                          function: () {
                            _key.currentState!.save();
                            Navigator.pop(context);
                          },
                          isWidget: true,
                          background: ColorManager.grayColor,
                          text: "السابق",
                          widget: const Icon(Icons.arrow_back_rounded),
                        ),
                      ],
                    ),
                    AppSize.spaceHeight2(context),
                    // HouseholdAddressSection()
                  ],
                );
              })),
        )),
      ),
    );
  }
}
