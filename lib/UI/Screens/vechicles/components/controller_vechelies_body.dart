import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/vechicles/provider/vechiels_provider.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/show_dialog_error.dart';
import '../../../Widgets/text.dart';
import '../../../Widgets/text_form_field.dart';
import '../constants.dart';
import 'list_body_type_vec.dart';

class ControllerVehiclesBody extends StatefulWidget {
  const ControllerVehiclesBody({super.key});

  @override
  State<ControllerVehiclesBody> createState() => _ControllerVehiclesBodyState();
}

class _ControllerVehiclesBodyState extends State<ControllerVehiclesBody> {
  void showError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var total = HhsStatic.houseHold[0].totalNumberVehicles.toString();
        return ShowErrorDialog(
          title: 'يجب إدخال عدد صحيح',
          content:
              'عدد المركبات الذى أدخلته أكبر من عدد المركبات فى الأسرة ($total)!',
        );
      });

  void showVechError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const ShowErrorDialog(
            title: 'لا يوجد لديك مركبات',
            content: "لا يوجد مركبات لدى الاسرة.");
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<VecProvider>(context, listen: false);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Consumer<VecProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              AppSize.spaceHeight2(context),
              AppSize.spaceHeight1(context),
              GridView.builder(
                primary: true,
                shrinkWrap: true,
                addAutomaticKeepAlives: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: VehiclesData.vecModel.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 2),
                itemBuilder: (context, index) => SizedBox(
                  width: width(context) / 2,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: TextGlobal(
                        text: VehiclesData.vecModel[index].title,
                        fontSize: height(context) * .02,
                        color: ColorManager.grayColor,
                      ),
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
                        value: VehiclesData.vecModel[index].isChosen,
                        onChanged: (bool? value) {
                          validationService.changeVec(index, value!);
                        }),
                    VehiclesData.vecModel[index].isChosen == true
                        ? MyTextForm(
                            keyboardType: TextInputType.number,
                            isNumber: true,
                            widthForm: width(context) * .120,
                            controller: VehiclesData
                                .vecModel[index].textEditingController,
                            label: '',
                            onChanged: (d) {
                              debugPrint(d.toString());
                              if (d!.isNotEmpty) {
                                switch (VehiclesData.vecModel[index].title) {
                                  //================vecCar==========================

                                  case "سيارة صغيرة":
                                    provider.vecCar(
                                        showVechError, d, showError);
                                    break;

                                  case "سيارة كبيرة":
                                    provider.vecLargeCar(
                                        showVechError, d, showError);
                                    break;
                                  case "ونيت":
                                    provider.vecWent(
                                        showVechError, d, showError);
                                    break;
                                  case "شاحنة":
                                    validationService.vecVan(
                                        showVechError, d, showError);
                                    break;
                                  case "دراجة نارية":
                                    validationService.vecPickUp(
                                        showVechError, d, showError);
                                    break;
                                  case "دراجة هوائية":
                                    validationService.vecBicycle(
                                        showVechError, d, showError);
                                    break;
                                  case " اسكوتر":
                                    validationService.vecEScooter(
                                        showVechError, d, showError);
                                    break;
                                  // case "عربية بضائع خفيفة":
                                  //   validationService.vecLightCargo(
                                  //       showVechError, d, showError);
                                  //   break;
                                  // case "عربية بضائع ثقيلة":
                                  //   validationService.vecHeavyCargo(
                                  //       showVechError, d, showError);
                                  //   break;
                                  // case "مينى باص":
                                  //   validationService.vecMinibus(
                                  //       showVechError, d, showError);
                                  //   break;
                                  // case "كوستر":
                                  //   validationService.vecCoaster(
                                  //       showVechError, d, showError);
                                  //   break;
                                  // case "اوتوبيس":
                                  //   validationService.vecBus(
                                  //       showVechError, d, showError);
                                  //   break;
                                }
                              } else {
                                provider.vecClear(index);
                              }
                            },
                            onTap: () {},
                          )
                        : Container(),
                  ]),
                ),
              ),
              //===========vecCar=============================

              ListBodyTypeVec(
                  title: ConstantsVec.smallCarVec,
                  listVec: VehModel.vecCar,
                  x: 0),
              ListBodyTypeVec(
                  title: ConstantsVec.largeCarKey,
                  listVec: VehModel.largeCar,
                  x: 1),
              ListBodyTypeVec(
                  title: ConstantsVec.went, listVec: VehModel.vecWanet, x: 2),
              ListBodyTypeVec(
                  title: ConstantsVec.van, listVec: VehModel.vecVan, x: 3),
              ListBodyTypeVec(
                  title: ConstantsVec.pickUp, listVec: VehModel.pickUp, x: 4),
              ListBodyTypeVec(
                  title: ConstantsVec.bicyle, listVec: VehModel.bicycle, x: 5),
              ListBodyTypeVec(
                  title: ConstantsVec.escooter,
                  listVec: VehModel.eScooter,
                  x: 6),
              // ListBodyTypeVec(
              //     title: ConstantsVec.vecLightCargo,
              //     listVec: VehModel.vecLightCargo,
              //     x: 7),
              // ListBodyTypeVec(
              //     title: ConstantsVec.vecHeavyCargo,
              //     listVec: VehModel.vecHeavyCargo,
              //     x: 8),
              // ListBodyTypeVec(
              //     title: ConstantsVec.vecMinibus,
              //     listVec: VehModel.vecMinibus,
              //     x: 9),
              // ListBodyTypeVec(
              //     title: ConstantsVec.vecCoaster,
              //     listVec: VehModel.vecCoaster,
              //     x: 10),
              // ListBodyTypeVec(
              //     title: ConstantsVec.vecBus, listVec: VehModel.vecBus, x: 11),

              AppSize.spaceHeight3(context),
            ],
          );
        },
      ),
    );
  }
}
