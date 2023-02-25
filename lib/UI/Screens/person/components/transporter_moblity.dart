import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';

class TransporterMobilty extends StatefulWidget {
  final int index;

  const TransporterMobilty({super.key, required this.index});

  @override
  State<TransporterMobilty> createState() => _TransporterMobiltyState();
}

class _TransporterMobiltyState extends State<TransporterMobilty> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              label: PersonModelList.personModelList[widget.index]
                          .personalQuestion!.haveDisabilityTransportMobility !=
                      ''
                  ? Text(PersonModelList.personModelList[widget.index]
                          .personalQuestion!.haveDisabilityTransportMobility ??
                      '')
                  : const Text('إختار'),
              hint: "هل لديك أي إعاقة / احتياجات خاصة لحركة النقل؟",
              options: PersonData
                  .transporterMoblity[PersonData.transporterMoblity.keys.first]!
                  .toList(),
              onChange: (String? p) {
                setState(() {
                  PersonModelList
                      .personModelList[widget.index]
                      .personalQuestion!
                      .haveDisabilityTransportMobility = p.toString();
                });
              },
            ),
            PersonModelList.personModelList[widget.index].personalQuestion!
                        .haveDisabilityTransportMobility ==
                    'أخرى .. حدد'
                ? MyTextForm(
                    label: 'إذكر الإعاقة / احتياجات خاصة',
                    controller: textEditingController,
                    isNumber: false,
                    onChanged: (value) {
                      PersonModelList
                          .personModelList[widget.index]
                          .personalQuestion!
                          .haveDisabilityTransportMobility = value;
                    },
                  )
                : Container()
          ],
        ),
      ],
    );
  }
}
