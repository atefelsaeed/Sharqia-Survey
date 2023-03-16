import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../provider/trip_provider.dart';

class OwnerTrip extends StatelessWidget {
  final int index;

  const OwnerTrip({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    final validationService = Provider.of<TripProvider>(context, listen: false);
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropDownFormInput(
          hint: "صاحب الرحلة",
          label: TripModeList.tripModeList[index].chosenPerson != ''
              ? Text(TripModeList.tripModeList[index].chosenPerson)
              : const Text('إختار'),
          options: TripModeList.tripModeList[index].person,
          onChange: (String? p) {
            debugPrint("p");
            validationService.addOwnerTrip(index, p.toString());
          },
        )
      ],
    );
  }
}
