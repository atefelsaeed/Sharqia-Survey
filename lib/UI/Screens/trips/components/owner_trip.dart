import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Data/HouseholdPart1/TripsData/trip_mode_list.dart';
import '../../../Widgets/dropdown_form_input.dart';
import '../provider/trip_provider.dart';

class OwnerTrip extends StatelessWidget {
  final int index;

  const OwnerTrip({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripProvider>(context, listen: false);
    final chosenPerson = TripModeList.tripModeList[index].chosenPerson;

    return Row(
      children: [
        Expanded(
          child: DropDownFormInput(
            hint: 'صاحب الرحلة',
            label: chosenPerson.isNotEmpty
                ? Text(chosenPerson)
                : const Text('إختار'),
            options: TripModeList.tripModeList[index].person,
            onChange: (String? value) {
              provider.addOwnerTrip(index, value!);
            },
          ),
        ),
      ],
    );
  }
}
