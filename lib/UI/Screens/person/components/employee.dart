import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

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
                : DropDownFormInput(
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
                      PersonModelList.personModelList[widget.i].occupationModel!
                          .bestWorkspaceLocation = p.toString();
                    },
                  ),
            PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة ابتدائية" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة متوسطة" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        "طالب - مدرسة ثانوية" ||
                    PersonModelList.personModelList[widget.i].personalQuestion!
                            .mainOccupationType ==
                        " الطالب - الكلية: بدوام كامل - يعمل بدوام جزئي"
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
                          setState(() {
                            PersonModelList
                                .personModelList[widget.i]
                                .personalQuestion!
                                .drivingLicenceType = p.toString();
                          });
                        },
                      ),
                      PersonModelList.personModelList[widget.i]
                                  .personalQuestion!.drivingLicenceType ==
                              "آخر"
                          ? MyTextForm(
                              controller: drivingLicenceType,
                              label: " نوع الرخصة",
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
