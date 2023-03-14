import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Data/HouseholdPart1/PersonData/person_model_list.dart';
import '../../../../Resources/colors.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../../Widgets/show_dialog_error.dart';
import '../../../Widgets/text.dart';
import '../../Survey/widgets/text_form_row.dart';
import '../reset_person.dart';

class DefaultEntry extends StatefulWidget {
  final int i;
  final Function function;

  const DefaultEntry({
    super.key,
    required this.i,
    required this.function,
  });

  @override
  State<DefaultEntry> createState() => _DefaultEntryState();
}

class _DefaultEntryState extends State<DefaultEntry> {
  bool x = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context, listen: false);
    int index = widget.i + 1;
    // TODO: implement build
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            TextGlobal(
              text: "الشخص  ${index.toString()}",
              fontSize: height(context) * .023,
              color: ColorManager.orangeTxtColor,
            ),
            const Spacer(),
            widget.i >= 1
                ? IconButton(
                    onPressed: () {
                      widget.function();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: ColorManager.primaryColor,
                    ))
                : Container()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextForm(
              controller: PersonModelList.personModelList[widget.i].personName,
              onChanged: (value) {
                for (int i = 0;
                    i < PersonModelList.personModelList.length;
                    i++) {
                  if (value ==
                          PersonModelList.personModelList[i].personName.text &&
                      i != widget.i) {
                    showError(
                      context,
                      ShowErrorDialog(
                        title: "يجب اختيار اسم اخر",
                        content: "يجب اختيار اسم اخر",
                      ),
                    );
                    PersonModelList.personModelList[widget.i].personName.text =
                        "";
                    return;
                  }
                }
              },
              text: "اسم الشخص",
              label: "اسم الشخص",
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownFormInput(
              label: PersonModelList
                          .personModelList[widget.i].personalHeadData!.gender !=
                      ''
                  ? Text(PersonModelList
                          .personModelList[widget.i].personalHeadData?.gender ??
                      '')
                  : const Text('إختار'),
              hint: " نوع الجنس",
              options:
                  PersonData.gender[PersonData.gender.keys.first]!.toList(),
              onChange: (String? p) {
                setState(() {
                  debugPrint(p);
                  PersonModelList.personModelList[widget.i].personalHeadData!
                      .gender = p.toString();
                  if (p == "ذكر") {
                    setState(() {
                      x = true;
                    });
                  } else {
                    setState(() {
                      x = false;
                    });
                  }
                });
              },
            ),
            x == true
                ? Column(
                    children: [
                      DropDownFormInput(
                        label: PersonModelList.personModelList[widget.i]
                                    .personalHeadData!.relationshipHeadHHS !=
                                ''
                            ? Text(PersonModelList.personModelList[widget.i]
                                    .personalHeadData!.relationshipHeadHHS ??
                                '')
                            : const Text('إختار'),
                        hint: "القرابة برب الأسرة ",
                        options: PersonData.relationshipToTheHeadOfHouseholdMan[
                                PersonData.relationshipToTheHeadOfHouseholdMan
                                    .keys.first]!
                            .toList(),
                        onChange: (var p) {
                          provider.relationshipHeadHHS(widget.i, p);
                        },
                      ),
                      AppSize.spaceHeight2(context),
                      Row(
                        children: [
                          (PersonModelList.personModelList[widget.i]
                                      .personalHeadData!.relationshipHeadHHS ==
                                  'أخرى')
                              ? MyTextForm(
                                  onTap: () {},
                                  controller: PersonModelList
                                      .personModelList[widget.i]
                                      .personalHeadData!
                                      .relationshipHeadHHSController,
                                  label: 'القرابة برب الأسرة ',
                                  onChanged: (val) {
                                    PersonModelList
                                        .personModelList[widget.i]
                                        .personalHeadData!
                                        .relationshipHeadHHS = val!;
                                  },
                                )
                              : Container()
                        ],
                      )
                    ],
                  )
                : Container(),
            x == false
                ? Column(
                    children: [
                      DropDownFormInput(
                        label: PersonModelList.personModelList[widget.i]
                                    .personalHeadData!.relationshipHeadHHS !=
                                ''
                            ? Text(PersonModelList.personModelList[widget.i]
                                    .personalHeadData!.relationshipHeadHHS ??
                                '')
                            : const Text('إختار'),
                        hint: "القرابة برب الأسرة ",
                        options: PersonData
                            .relationshipToTheHeadOfHouseholdWoman[PersonData
                                .relationshipToTheHeadOfHouseholdWoman
                                .keys
                                .first]!
                            .toList(),
                        onChange: (var p) {
                          setState(() {
                            PersonModelList
                                .personModelList[widget.i]
                                .personalHeadData!
                                .relationshipHeadHHS = p.toString();
                          });
                        },
                      ),
                      AppSize.spaceHeight2(context),
                      Row(
                        children: [
                          (PersonModelList.personModelList[widget.i]
                                      .personalHeadData!.relationshipHeadHHS ==
                                  'أخرى')
                              ? MyTextForm(
                                  label: 'القرابة برب الأسرة ',
                                  onTap: () {},
                                  onChanged: (val) {
                                    PersonModelList
                                        .personModelList[widget.i]
                                        .personalHeadData!
                                        .relationshipHeadHHS = val!;
                                  },
                                )
                              : Container()
                        ],
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}

void showError(context, Widget widget) => showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return widget;
    });
