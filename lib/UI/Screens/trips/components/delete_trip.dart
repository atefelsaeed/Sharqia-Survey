import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/provider/trip_provider.dart';

import '../../../../Resources/colors.dart';
import 'text_trip.dart';

class DeleteTripComponent extends StatelessWidget {
  final int i;

  const DeleteTripComponent({required this.i, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<TripProvider>(context, listen: false);
    final canDelete = i >= 1;

    return Row(
      children: [
        const Spacer(),
        TextTrip(
          index: i,
        ),
        const Spacer(),
        if (canDelete)
          GestureDetector(
            onTap: () {
              validationService.removeTrip(i);
            },
            child: Icon(
              Icons.delete,
              color: ColorManager.primaryColor,
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
