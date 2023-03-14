import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/UI/Screens/person/person_conditions.dart';
import 'package:sharqia_household_survey/UI/Screens/person/reset_person.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';

// TODO: implement build
class Employee extends StatefulWidget {
  final int i;

  const Employee({super.key, required this.i});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController drivingLicenceType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context, listen: false);
    return Column(
      children: [
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "عاطلين عن العمل" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - جامعي: دوام كامل (لا يعمل) " ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "شخص البيت" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "معاق / مريض"
                ? Container()
                : Column(
                    children: [
                      DropDownFormInput(
                        label: PersonModelList.personModelList[widget.i]
                                    .occupationModel!.bestWorkspaceLocation !=
                                ''
                            ? Text(PersonModelList.personModelList[widget.i]
                                    .occupationModel!.bestWorkspaceLocation ??
                                '')
                            : const Text('إختار'),
                        hint:
                            "إذا كنت موظفًا أو طالبًا ، ما هو وضعك المعتاد للذهاب إلى العمل / المدرسة؟ سؤال موجه - قائمة منسدلة للأنماط",
                        options: PersonData
                            .workplace[PersonData.workplace.keys.first]!
                            .toList(),
                        onChange: (String? p) {
                          provider.bestWorkspaceLocation(widget.i, p);
                        },
                      ),
                      AppSize.spaceHeight1(context),
                      PersonConditions()
                                  .checkBestWorkspaceLocationOther(widget.i) ==
                              true
                          ? MyTextForm(
                        onTap: () {  },
                              controller: PersonModelList
                                  .personModelList[widget.i]
                                  .occupationModel!
                                  .bestWorkspaceLocationController,
                              label: 'وضعك المعتاد للذهاب إلى العمل / المدرسة',
                              onChanged: (val) {
                                PersonModelList
                                    .personModelList[widget.i]
                                    .occupationModel!
                                    .bestWorkspaceLocation = val!;
                              },
                            )
                          : Container(),
                    ],
                  ),
            ((PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة ابتدائية") ||
                    (PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة متوسطة") ||
                    (PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة ثانوية") ||
                    (PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        " الطالب - الكلية: بدوام كامل - يعمل بدوام جزئي"))
                ? Container()
                : Column(
                    children: [
                      DropDownFormInput(
                        label: PersonModelList.personModelList[widget.i]
                                    .personalQuestion!.drivingLicenceType !=
                                ''
                            ? Text(PersonModelList.personModelList[widget.i]
                                    .personalQuestion!.drivingLicenceType ??
                                '')
                            : const Text('إختار'),
                        hint:
                            "ما نوع رخصة القيادة التي لديك (ضع علامة على كل ما ينطبق)",
                        options: PersonData
                            .licence[PersonData.licence.keys.first]!
                            .toList(),
                        onChange: (String? p) {
                          provider.drivingLicenceType(widget.i, p);
                        },
                      ),
                      AppSize.spaceHeight1(context),
                      PersonConditions()
                                  .checkDrivingLicenceTypeOther(widget.i) ==
                              true
                          ? MyTextForm(
                              controller: PersonModelList
                                  .personModelList[widget.i]
                                  .personalQuestion!
                                  .drivingLicenceTypeController,
                              label: " نوع الرخصة",
                        onTap: () {  },
                              onChanged: (val) {
                                PersonModelList.personModelList[widget.i]
                                    .personalQuestion!.drivingLicenceType = val;
                              },
                            )
                          : Container(),
                    ],
                  ),
          ],
        ),
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersonModelList.personModelList[widget.i].personalQuestion!
                        .drivingLicenceType ==
                    "بدون ترخيص"
                ? Container()
                : DropDownFormInput(
                    label: PersonModelList.personModelList[widget.i]
                                .personalQuestion!.availablePersonalCar !=
                            ''
                        ? Text(PersonModelList.personModelList[widget.i]
                                .personalQuestion!.availablePersonalCar ??
                            '')
                        : const Text('إختار'),
                    hint:
                        " مدى توفر سيارة متاحة لك لاستخدامك الشخصي؟(سؤال موجه اسأل فقط إذا كان لديك رخصة قيادة)",
                    options: PersonData
                        .drivingLiences[PersonData.drivingLiences.keys.first]!
                        .toList(),
                    onChange: (String? p) {
                      PersonModelList
                          .personModelList[widget.i]
                          .personalQuestion!
                          .availablePersonalCar = p.toString();
                    },
                  ),
            DropDownFormInput(
              label: PersonModelList.personModelList[widget.i].personalQuestion!
                          .haveBusPass !=
                      ''
                  ? Text(PersonModelList.personModelList[widget.i]
                          .personalQuestion!.haveBusPass ??
                      '')
                  : const Text('إختار'),
              hint: "هل لديك تذكرة حافلة",
              options:
                  PersonData.busBuss[PersonData.busBuss.keys.first]!.toList(),
              onChange: (String? p) {
                PersonModelList.personModelList[widget.i].personalQuestion!
                    .haveBusPass = p.toString();
              },
            ),
          ],
        ),
      ],
    );
  }
}
