import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../../Survey/widgets/text_form_row.dart';

class FuelTypeCode extends StatefulWidget {
  const FuelTypeCode({super.key, required this.textEditingController});

  final TextEditingController textEditingController;

  @override
  State<FuelTypeCode> createState() => _FuelTypeCodeState();
}

class _FuelTypeCodeState extends State<FuelTypeCode> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        DropDownFormInput(
          label: widget.textEditingController.text == ""
              ? const Text('إختار')
              : Text(widget.textEditingController.text),
          hint: " نوع الوقود",
          options: VehiclesData
              .fuelTypeCodes[VehiclesData.fuelTypeCodes.keys.first]!
              .toList(),
          onChange: (String? p) {
            setState(() {
              VehModel.fuelTypeCode = p.toString();
              if (VehModel.fuelTypeCode != "أخر") {
                widget.textEditingController.text = VehModel.fuelTypeCode;
              } else {
                widget.textEditingController.text = "أخر";
              }
            });
          },
        ),
        widget.textEditingController.text == "أخر"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextForm(
                    controller: widget.textEditingController,
                    text: " نوع الوقود",
                    label: " نوع الوقود",
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
