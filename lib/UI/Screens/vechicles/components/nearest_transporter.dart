import 'package:flutter/cupertino.dart';

import '../../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../Survey/widgets/list_view_check_box_orange.dart';

class NearestTransporter extends StatelessWidget {
  const NearestTransporter({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListViewCheckBoxOrange(
      map: VehiclesData.q3VecData,
      onChange: (ChangeBoxResponse r) {
        VehModel.nearestPublicTransporter = r.val.toString();
      },
      title: "9.كم تبعد اقرب محطة حافلات نقل عام عن منزلك سيرا على الاقدام ؟",
      question:
          VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first]!.toList(),
      subTitle: "",
    );
  }
}
