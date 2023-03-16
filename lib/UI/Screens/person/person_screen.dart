import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/validate_data/person_validation.dart';
import 'package:sharqia_household_survey/Data/app_constants.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/occupation_model.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/person_model.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/personal_question.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/person/components/default_entry.dart';
import 'package:sharqia_household_survey/UI/Screens/person/reset_person.dart';
import 'package:sharqia_household_survey/UI/Widgets/headline.dart';

import '../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../Data/HouseholdPart1/save_data.dart';
import '../../../Models/HHS_SurvyModels/hhs_models.dart';
import '../../../Providers/user_surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/custom_buttton.dart';
import '../../Widgets/dropdown_form_input.dart';
import '../../Widgets/show_dialog_error.dart';
import '../../Widgets/text.dart';
import '../../Widgets/text_form_field.dart';
import '../Survey/widgets/editing_controler3.dart';
import '../Survey/widgets/list_view_check_box_orange.dart';
import '../Survey/widgets/text_form_row.dart';
import '../trips/trip_screen.dart';
import 'components/employee.dart';
import 'components/nationality.dart';
import 'components/transporter_moblity.dart';
import 'person_conditions.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  bool type = false;
  bool typeAlone = true;
  bool hasPasTrip = false;
  var mainOccupationKey = PersonData.mainOccupation.keys.first;

  var occupationSectorKey = PersonData.occupationSector.keys.first;
  final GlobalKey<FormState> _key = GlobalKey();
  late EditingController3 editingController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController());
  var base = PersonModelList.personModelList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final validationService =
        Provider.of<PersonProvider>(context, listen: false);
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    // validationService.getAllPeronUpdated(context);
    if ((userSurveysProvider.userSurveyStatus == 'edit' &&
        AppConstants.isResetPerson == true)) {
      validationService.getAllPeronUpdated(context);
      AppConstants.isResetPerson = false;
    }
  }

  void showError() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int x = int.parse(HhsStatic.peopleAdults18.toString()) +
            int.parse(HhsStatic.peopleUnder18.toString());
        return ShowErrorDialog(
          title: 'لا يمكنك إضافة المزيد',
          content: 'عدد أفراد عائلتك الذين يعيشون فى هذا المنزل هو ($x)'
              '',
        );
      });
  void showError1() => showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        int x = int.parse(HhsStatic.peopleAdults18.toString()) +
            int.parse(HhsStatic.peopleUnder18.toString());
        return ShowErrorDialog(
          title: 'يجب تعبئة جميع الافراد !!',
          content: 'عدد أفراد عائلتك الذين يعيشون فى هذا المنزل هو ( ,, يجب تعبئة جميع الافرادز$x)'
              '',
        );
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(child:
            Consumer<PersonProvider>(builder: (context, provider, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _key,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      const HeadlinePerson(
                        text: "المعلومات الاجتماعية والاقتصادية للأسر المعيشية",
                      ),
                      AppSize.spaceHeight2(context),
                      for (int i = 0;
                          i < PersonModelList.personModelList.length;
                          i++)
                        Padding(
                          padding: EdgeInsets.all(AppSize.padding1(context)),
                          child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorManager.gray2Color),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(AppSize.padding1(context)),
                              child: Column(
                                children: [
                                  DefaultEntry(
                                    i: i,
                                    function: () {
                                      setState(() {
                                        PersonModelList.personModelList
                                            .removeAt(i);
                                      });
                                    },
                                  ),
                                  AppSize.spaceHeight2(context),
                                  //=============Person-Age==================
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextGlobal(
                                        text: "العمر",
                                        fontSize: height(context) * .025,
                                        color: ColorManager.black,
                                      ),
                                    ],
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: [
                                        Row(children: [
                                          TextGlobal(
                                            text: "العمر",
                                            //[index].title,
                                            fontSize: height(context) * .02,
                                            color: ColorManager.grayColor,
                                          ),
                                          Checkbox(
                                              side: BorderSide(
                                                color:
                                                    ColorManager.orangeTxtColor,
                                                width: 1.5,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              checkColor:
                                                  ColorManager.whiteColor,
                                              focusColor:
                                                  ColorManager.orangeTxtColor,
                                              activeColor:
                                                  ColorManager.orangeTxtColor,
                                              value: PersonModelList
                                                  .personModelList[i]
                                                  .personalHeadData!
                                                  .checkAge,
                                              onChanged: (bool? value) {
                                                provider.checkAge(i, value);
                                              }),
                                          PersonModelList
                                                      .personModelList[i]
                                                      .personalHeadData!
                                                      .checkAge ==
                                                  true
                                              ? MyTextForm(
                                                  isNumber: true,
                                                  onTap: () {},
                                                  onChanged: (d) {
                                                    provider.isEmployee(
                                                        d.toString(), i);
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  widthForm:
                                                      width(context) * .15,
                                                  label: "age",
                                                  controller: PersonModelList
                                                      .personModelList[i]
                                                      .personalHeadData!
                                                      .age,
                                                )
                                              : Container(),
                                          AppSize.spaceWidth2(context),
                                          TextGlobal(
                                            text: "لا ",
                                            //[index].title,
                                            fontSize: height(context) * .02,
                                            color: ColorManager.grayColor,
                                          ),
                                          Checkbox(
                                              side: BorderSide(
                                                color:
                                                    ColorManager.orangeTxtColor,
                                                width: 1.5,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              checkColor:
                                                  ColorManager.whiteColor,
                                              focusColor:
                                                  ColorManager.orangeTxtColor,
                                              activeColor:
                                                  ColorManager.orangeTxtColor,
                                              value: PersonModelList
                                                  .personModelList[i]
                                                  .personalHeadData!
                                                  .refuseToTellAge,
                                              onChanged: (bool? value) {
                                                provider.checkNo(i, value);
                                              }),
                                          PersonModelList
                                                      .personModelList[i]
                                                      .personalHeadData!
                                                      .refuseToTellAge ==
                                                  true
                                              ? DropDownFormInput2(
                                                  label: PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .personalHeadData!
                                                              .age
                                                              .text !=
                                                          ''
                                                      ? Text(PersonModelList
                                                          .personModelList[i]
                                                          .personalHeadData!
                                                          .age
                                                          .text)
                                                      : const Text('إختار'),
                                                  hint: "الفئة العمرية",
                                                  options: PersonData.groupAge[
                                                          PersonData.groupAge
                                                              .keys.first]!
                                                      .toList(),
                                                  onChange: (String? p) {
                                                    provider.groupAgeKey(
                                                        i, p.toString());
                                                  },
                                                )
                                              : Container(),
                                        ]),
                                      ],
                                    ),
                                  ),

                                  AppSize.spaceHeight1(context),
                                  //=============HHS-HavePastTrip==================
                                  PersonModelList.personModelList[i]
                                              .occupationModel!.isEmployee !=
                                          "0"
                                      ? ListViewCheckBoxOrange(
                                          map: PersonModelList
                                              .personModelList[i]
                                              .travelWithOther,
                                          onChange: (ChangeBoxResponse r) {
                                            provider.travelWithOther(i, r);
                                            //provider.nationality(r, i);
                                          },
                                          isListView: true,
                                          title:
                                              "هل قمت برحلة فى الأيام السابقة",
                                          question: PersonModelList
                                              .personModelList[i]
                                              .travelWithOther[PersonModelList
                                                  .personModelList[i]
                                                  .travelWithOther
                                                  .keys
                                                  .first]!
                                              .toList(),
                                          subTitle: "",
                                        )
                                      : Container(),
                                  ((PersonModelList
                                                  .personModelList[i]
                                                  .personalHeadData!
                                                  .hasPasTrip ==
                                              true) &&
                                          (PersonModelList
                                                  .personModelList[i]
                                                  .occupationModel!
                                                  .isEmployee !=
                                              "0"))
                                      ? TextForm(
                                          label: 'إذكر السبب',
                                          text: 'إذكر السبب',
                                          onChanged: (value) {},
                                          controller: PersonModelList
                                              .personModelList[i]
                                              .personalHeadData!
                                              .hhsHavePastTrip,
                                        )
                                      : Container(),
                                  AppSize.spaceHeight1(context),
                                  //=========Nationality======================
                                  Nationality(i: i),
                                  AppSize.spaceHeight3(context),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      PersonModelList
                                                  .personModelList[i]
                                                  .occupationModel!
                                                  .isEmployee ==
                                              ""
                                          ? Container()
                                          : PersonModelList
                                                      .personModelList[i]
                                                      .occupationModel!
                                                      .isEmployee ==
                                                  "0"
                                              ? DropDownFormInput2(
                                                  label: PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .personalQuestion!
                                                              .mainOccupationType !=
                                                          ''
                                                      ? Text(PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .personalQuestion!
                                                              .mainOccupationType ??
                                                          '')
                                                      : const Text('إختار'),
                                                  hint: "الوظيفة الأساسية",
                                                  options: PersonData
                                                      .mainOccupationUnder5[
                                                          mainOccupationKey]!
                                                      .toList(),
                                                  onChange: (String? p) {
                                                    List value = PersonData
                                                        .mainOccupationUnder5[
                                                            mainOccupationKey]
                                                        .toList();

                                                    for (int inr = 0;
                                                        inr < value.length;
                                                        inr++) {
                                                      if (p ==
                                                          value[inr]["value"]) {
                                                        PersonModelList
                                                                .personModelList[i]
                                                                .personalQuestion!
                                                                .mainOccupationType =
                                                            value[inr]["value"];
                                                      }
                                                    }
                                                    setState(() {
                                                      PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .personalQuestion!
                                                              .mainOccupationType ==
                                                          p.toString();
                                                    });

                                                    debugPrint(p.toString());
                                                  },
                                                )
                                              : DropDownFormInput2(
                                                  label: PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .personalQuestion!
                                                              .mainOccupationType !=
                                                          ''
                                                      ? Text(PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .personalQuestion!
                                                              .mainOccupationType ??
                                                          '')
                                                      : const Text('إختار'),
                                                  hint: "الوظيفة الأساسية",
                                                  options: PersonData
                                                      .mainOccupation[
                                                          mainOccupationKey]!
                                                      .toList(),
                                                  onChange: (String? p) {
                                                    List value = PersonData
                                                        .mainOccupation[
                                                            mainOccupationKey]
                                                        .toList();

                                                    for (int inr = 0;
                                                        inr < value.length;
                                                        inr++) {
                                                      if (p ==
                                                          value[inr]["value"]) {
                                                        PersonModelList
                                                                .personModelList[i]
                                                                .personalQuestion!
                                                                .mainOccupationType =
                                                            value[inr]["value"];
                                                      }
                                                    }
                                                    setState(() {
                                                      PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .personalQuestion!
                                                              .mainOccupationType ==
                                                          p.toString();
                                                    });

                                                    debugPrint(p.toString());
                                                  },
                                                ),
                                      PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "عاطلين عن العمل" ||
                                              PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "شخص البيت" ||
                                              PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "طفل فى الحضانة" ||
                                              PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "طفل ليس فى الحضانة" ||
                                              PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "رفض" ||
                                              PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "معاق / مريض"
                                          ? Container()
                                          : Column(
                                              children: [
                                                PersonModelList
                                                                .personModelList[
                                                                    i]
                                                                .personalQuestion!
                                                                .mainOccupationType ==
                                                            "طالب - مدرسة ابتدائية" ||
                                                        PersonModelList
                                                                .personModelList[
                                                                    i]
                                                                .personalQuestion!
                                                                .mainOccupationType ==
                                                            "طالب - مدرسة متوسطة" ||
                                                        PersonModelList
                                                                .personModelList[
                                                                    i]
                                                                .personalQuestion!
                                                                .mainOccupationType ==
                                                            "طالب - مدرسة ثانوية"
                                                    ? DropDownFormInput(
                                                        label: PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .occupationModel!
                                                                    .occupationSector !=
                                                                ''
                                                            ? Text(PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .occupationModel!
                                                                    .occupationSector ??
                                                                '')
                                                            : const Text(
                                                                'إختار'),
                                                        hint:
                                                            "لو عمل ما هو قطا ع العمل",
                                                        options: PersonData
                                                            .occupationSectorSchool[
                                                                occupationSectorKey]!
                                                            .toList(),
                                                        onChange: (String? p) {
                                                          provider
                                                              .occupationSector(
                                                                  i, p);
                                                        },
                                                      )
                                                    : PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .personalQuestion!
                                                                    .mainOccupationType ==
                                                                " طالب - الكلية: بدوام كامل (لا يعمل)" ||
                                                            PersonModelList
                                                                    .personModelList[
                                                                        i]
                                                                    .personalQuestion!
                                                                    .mainOccupationType ==
                                                                "طالب - جامعي: دوام كامل (لا يعمل) "
                                                        ? DropDownFormInput(
                                                            label: PersonModelList
                                                                        .personModelList[
                                                                            i]
                                                                        .occupationModel!
                                                                        .occupationSector !=
                                                                    ''
                                                                ? Text(PersonModelList
                                                                        .personModelList[
                                                                            i]
                                                                        .occupationModel!
                                                                        .occupationSector ??
                                                                    '')
                                                                : const Text(
                                                                    'إختار'),
                                                            hint:
                                                                "لو عمل ما هو قطا ع العمل",
                                                            options: PersonData
                                                                .occupationSectorUnveristy[
                                                                    occupationSectorKey]!
                                                                .toList(),
                                                            onChange:
                                                                (String? p) {
                                                              provider
                                                                  .occupationSector(
                                                                      i, p);
                                                            },
                                                          )
                                                        : DropDownFormInput(
                                                            label: PersonModelList
                                                                        .personModelList[
                                                                            i]
                                                                        .occupationModel!
                                                                        .occupationSector !=
                                                                    ''
                                                                ? Text(PersonModelList
                                                                        .personModelList[
                                                                            i]
                                                                        .occupationModel!
                                                                        .occupationSector ??
                                                                    '')
                                                                : const Text(
                                                                    'إختار'),
                                                            hint:
                                                                "لو عمل ما هو قطا ع العمل",
                                                            options: PersonData
                                                                .occupationSector[
                                                                    occupationSectorKey]!
                                                                .toList(),
                                                            onChange:
                                                                (String? p) {
                                                              provider
                                                                  .occupationSector(
                                                                      i, p);
                                                            },
                                                          ),
                                                AppSize.spaceHeight2(context),
                                                PersonConditions()
                                                            .checkOccupationSectorOther(
                                                                i) ==
                                                        true
                                                    ? MyTextForm(
                                                        onTap: () {},
                                                        controller: PersonModelList
                                                            .personModelList[i]
                                                            .occupationModel!
                                                            .occupationSectorController,
                                                        label: " قطاع العمل",
                                                        onChanged: (val) {
                                                          PersonModelList
                                                              .personModelList[
                                                                  i]
                                                              .occupationModel!
                                                              .occupationSector = val;
                                                        },
                                                      )
                                                    : Container(),
                                              ],
                                            )
                                    ],
                                  ),

                                  PersonModelList.personModelList[i]
                                              .occupationModel!.isEmployee ==
                                          "1"
                                      ? PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "طفل ليس فى الحضانة" ||
                                              PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "طفل فى الحضانة" ||
                                              PersonModelList
                                                      .personModelList[i]
                                                      .personalQuestion!
                                                      .mainOccupationType ==
                                                  "رفض"
                                          ? Container()
                                          : Employee(i: i)
                                      : Container(),
                                  PersonModelList.personModelList[i]
                                              .occupationModel!.isEmployee ==
                                          ""
                                      ? Container()
                                      : TransporterMobilty(index: i)
                                ],
                              ),
                            ),
                          ),
                        ),
                      AppSize.spaceHeight2(context),
                      //============Add-New-Person-Button=============
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DefaultButton(
                            function: () async {
                              setState(() {
                                int x = int.parse(
                                        HhsStatic.peopleAdults18.toString()) +
                                    int.parse(
                                        HhsStatic.peopleUnder18.toString());

                                debugPrint(PersonModelList
                                    .personModelList.length
                                    .toString());

                                PersonModelList.personModelList.length;

                                if (x >
                                    PersonModelList.personModelList.length) {
                                  setState(() {
                                    PersonModelList.personModelList.add(
                                      PersonModel(
                                        //==personalHeadData==
                                        travelWithOther: {
                                          'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
                                              [
                                            {"value": 'نعم', "isChick": false},
                                            {"value": 'لا', "isChick": false},
                                          ],
                                          "index": 0
                                        },
                                        nationality: {
                                          "QPurposeOfBeingThere": [
                                            {
                                              "value": 'سعودي',
                                              "isChick": false
                                            },
                                            {
                                              "value": 'وافد عربي',
                                              "isChick": false
                                            },
                                            {
                                              "value": 'وافد اجنبي',
                                              "isChick": false
                                            },
                                          ],
                                          "title": "nationality",
                                          "subTitle":
                                              " A separate family is defined as who share the kitchen expenses and meals",
                                          "index": 0,
                                        },
                                        personName: TextEditingController(),
                                        personalHeadData: PersonalHeadData(
                                          age: TextEditingController(),
                                          relationshipHeadHHSController:
                                              TextEditingController(),
                                          nationality: TextEditingController(),
                                          hhsHavePastTrip:
                                              TextEditingController(),
                                          nationalityType: '',
                                          gender: '',
                                          checkAge: false,
                                          hasPasTrip: false,
                                          showText: false,
                                          refuseToTellAge: false,
                                          relationshipHeadHHS: '',
                                        ),
                                        //==personalQuestion==
                                        personalQuestion: PersonalQuestion(
                                          mainOccupationType: '',
                                          asPassenger: '',
                                          availablePersonalCar: '',
                                          drivingLicenceType: '',
                                          haveBusPass: '',
                                          haveDisabilityTransportMobility: '',
                                          haveCarSharing: false,
                                          educationAddress: EducationAddress(
                                            fullAddress:
                                                TextEditingController(),
                                            geocodes: TextEditingController(),
                                          ),
                                          drivingLicenceTypeController:
                                              TextEditingController(),
                                          haveDisabilityTransportMobilityController:
                                              TextEditingController(),
                                        ),
                                        //==occupationModel==
                                        occupationModel: OccupationModel(
                                          earliestTimeFinishingWork:
                                              TextEditingController(),
                                          occupationSectorController:
                                              TextEditingController(),
                                          earliestTimeStartingWork:
                                              TextEditingController(),
                                          endingWoke: TextEditingController(),
                                          startingWoke: TextEditingController(),
                                          address: TextEditingController(),
                                          geoCodes: TextEditingController(),
                                          mainOccupationAddress:
                                              TextEditingController(),
                                          bestWorkspaceLocation: '',
                                          bikeWorkDays: 0,
                                          commuteWorkDays: 0,
                                          flexibleWorkingHours: '',
                                          isEmployee: '',
                                          isWorkFromHome: false,
                                          numberWorkFromHome: 0,
                                          occupationLevelSector: '',
                                          occupationSector: '',
                                          bestWorkspaceLocationController:
                                              TextEditingController(),
                                        ),
                                      ),
                                    );
                                    hasPasTrip = false;
                                  });
                                } else {
                                  showError();
                                }
                              });
                              // UserSurveysProvider userSurveysProvider =
                              //     Provider.of<UserSurveysProvider>(context,
                              //         listen: false);
                              // SurveyPTProvider surveyPt =
                              //     Provider.of<SurveyPTProvider>(context,
                              //         listen: false);
                              // SurveysProvider surveys =
                              //     Provider.of<SurveysProvider>(context,
                              //         listen: false);
                              //
                              // final prefs =
                              //     await SharedPreferences.getInstance();
                              // bool? isFilled =
                              //     prefs.getBool(AppConstants.isFilled);
                              //
                              // if (isFilled != null && isFilled == true) {
                              //   surveys.addNotFilledSurvey(surveyPt.data);
                              //   debugPrint('addNotFilledSurvey Person');
                              // }
                            },
                            isWidget: true,
                            btnWidth: width(context) * .35,
                            text: "أضافة شخص جديد",
                            widget: const Icon(Icons.arrow_forward),
                          )
                        ],
                      ),
                      AppSize.spaceHeight6(context),
                      //======Navigation Buttons================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultButton(
                            function: () {
                              // UserSurveysProvider userSurveysProvider =
                              //     Provider.of<UserSurveysProvider>(context,
                              //         listen: false);
                              // SurveyPTProvider surveyPt =
                              //     Provider.of<SurveyPTProvider>(context,
                              //         listen: false);
                              // SurveysProvider surveys =
                              //     Provider.of<SurveysProvider>(context,
                              //         listen: false);
                              //
                              // if (userSurveysProvider.userSurveyStatus ==
                              //     'not filled') {
                              //   surveys.addNotFilledSurvey(surveyPt.data);
                              //   debugPrint('addNotFilledSurvey person');
                              // }
                              if (_key.currentState!.validate()) {
                                _key.currentState!.save();
                                SavePersonData.saveData(context);
                                CheckPersonValidation.validatePerson(context);
                                int x = int.parse(
                                        HhsStatic.peopleAdults18.toString()) +
                                    int.parse(
                                        HhsStatic.peopleUnder18.toString());
                                if (x ==
                                    PersonModelList.personModelList.length) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TripScreen(),
                                    ),
                                  );
                                }else{
                                   showError1();
                                }
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
                              Navigator.pop(context);
                            },
                            isWidget: true,
                            background: ColorManager.grayColor,
                            text: "السابق",
                            widget: const Icon(Icons.arrow_back_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        })),
      ),
    );
  }
}
