import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';
import '../provider/vechiels_provider.dart';

class OwnerShipCode extends StatelessWidget {
  const OwnerShipCode({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<VecProvider>(context, listen: false);
    return Column(
      children: [
        DropDownFormInput(
          label: textEditingController.text == ''
              ? const Text('إختار')
              : Text(textEditingController.text),
          hint: "من يملك السيارة",
          options: VehiclesData.ownership[VehiclesData.ownership.keys.first]!
              .toList(),
          onChange: (String? p) {
            validationService.ownerChipCar(p.toString(), textEditingController);
          },
        ),
        ((textEditingController.text == "أخر") ||
                (textEditingController.text.isNotEmpty &&
                    !(VehiclesData.ownership[VehiclesData.ownership.keys.first]!
                        .any((element) =>
                            element == textEditingController.text))))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextForm(
                    controller: textEditingController,
                    onChanged: (value){},
                    text: "رموز الملكية",
                    label: "رموز الملكية",
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
