import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/provider/trip_provider.dart';
import 'package:provider/provider.dart';

import '../../../../Resources/colors.dart';
import 'text_trip.dart';

class DeleteTripComponent extends StatelessWidget {
  final int i;

  const DeleteTripComponent({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<TripProvider>(context, listen: false);
    return Row(
      children: [
        const Spacer(),
        TextTrip(index: i),
        const Spacer(),
        i >= 1
            ? IconButton(
                onPressed: () {
                  validationService.removeTrip(i);
                },
                icon: Icon(
                  Icons.delete,
                  color: ColorManager.primaryColor,
                ),
              )
            : Container()
      ],
    );
  }
}
