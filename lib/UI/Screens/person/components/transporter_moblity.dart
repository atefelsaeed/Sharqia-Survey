import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';
import 'package:sharqia_household_survey/UI/Screens/person/person_conditions.dart';
import 'package:sharqia_household_survey/UI/Widgets/text_form_field.dart';

import '../../../../Data/HouseholdPart1/PersonData/person_data.dart';
import '../../../../Resources/sizes.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../reset_person.dart';

class TransporterMobilty extends StatelessWidget {
  final int index;

  const TransporterMobilty({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context, listen: false);
    // TODO: implement build
    return Column(
      children: [
        AppSize.spaceHeight3(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropDownFormInput(
              label: PersonModelList.personModelList[index].personalQuestion!
                          .haveDisabilityTransportMobility !=
                      ''
                  ? Text(PersonModelList.personModelList[index]
                          .personalQuestion!.haveDisabilityTransportMobility ??
                      '')
                  : const Text('إختار'),
              hint: "هل لديك أي إعاقة / احتياجات خاصة لحركة النقل؟",
              options: PersonData
                  .transporterMoblity[PersonData.transporterMoblity.keys.first]!
                  .toList(),
              onChange: (String? p) {
                provider.haveDisabilityTransportMobility(index, p);
              },
            ),
            PersonConditions()
                        .checkHaveDisabilityTransportMobilityOther(index) ==
                    true
                ? MyTextForm(
                    label: 'إذكر الإعاقة / احتياجات خاصة',
                    onTap: () {},
                    controller: PersonModelList
                        .personModelList[index]
                        .personalQuestion!
                        .haveDisabilityTransportMobilityController,
                    isNumber: false,
                    onChanged: (value) {
                      PersonModelList.personModelList[index].personalQuestion!
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
