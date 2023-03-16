import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/vechicles/components/vec_body_type.dart';

import '../../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../provider/vechiels_provider.dart';

class ListBodyTypeVec extends StatelessWidget {
  final List<VehicleBodyDetails> listVec;

  final String title;
  final int x;

  const ListBodyTypeVec(
      {super.key, required this.listVec, required this.title, required this.x});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<VecProvider>(context, listen: false);

    return Column(
      children: [
        for (int i = 0; i < listVec.length; i++)
          BodyTypeVehicles(
            vecBodyType: listVec[i],
            index: i + 1,
            title: title,
            function: () {
              validationService.removeVec(listVec, i, x);
            },
          ),
      ],
    );
  }
}
