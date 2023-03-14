import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';
import '../provider/vechiels_provider.dart';

class ParkThisCar extends StatelessWidget {
  const ParkThisCar({super.key, required this.textEditingController});

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
          hint: "أين تركن هذه السيارة عادة؟ رموز نوع وقوف السيارات",
          options: VehiclesData
              .parkThisCar[VehiclesData.parkThisCar.keys.first]!
              .toList(),
          onChange: (String? p) {
            validationService.parkThisCar(
              p.toString(),
              textEditingController,
            );
          },
        ),
        ((textEditingController.text == "أخرى") ||
                (textEditingController.text.isNotEmpty &&
                    !(VehiclesData
                        .parkThisCar[VehiclesData.parkThisCar.keys.first]!
                        .any((element) =>
                            element == textEditingController.text))))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextForm(
                    controller: textEditingController,
                    onChanged: (value) {},
                    text: "رموز نوع وقوف السيارات",
                    label: "رموز نوع وقوف السيارات",
                  )

                ],
              )
            : Container(),
      ],
    );
  }
}
