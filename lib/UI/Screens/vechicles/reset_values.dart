import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Providers/user_surveys.dart';

class ResetVechilesValues {
  static resetVechValues(context) async {
    UserSurveysProvider surveyPt =
        Provider.of<UserSurveysProvider>(context, listen: false);

    ///vecCar
    VehModel.vecCar = surveyPt.surveyPT.vehiclesBodyType![0]
        .vehicleTypeDetails!; //vehiclesData.    vehiclesBodyType![0].vehicleTypeDetails!;
    if (VehModel.vecCar.isNotEmpty) {
      VehiclesData.vecModel[0].number = VehModel.vecCar.length;
      VehiclesData.vecModel[0].textEditingController.text =
          VehModel.vecCar.length.toString();
      VehiclesData.vecModel[0].isChosen = true;
    }
    var vecCarLength = VehModel.vecCar.length;

    for (int i = 0; i < vecCarLength; i++) {
      if (i < vecCarLength) {
        VehModel.vecCar[i].vehicleFuelType.text = surveyPt.surveyPT
            .vehiclesBodyType![0].vehicleTypeDetails![i].vehicleFuelType.text;

        VehModel.vecCar[i].vehicleOwnership.text = surveyPt.surveyPT
            .vehiclesBodyType![0].vehicleTypeDetails![i].vehicleOwnership.text;
        VehModel.vecCar[i].vehicleParking.text = surveyPt.surveyPT
            .vehiclesBodyType![0].vehicleTypeDetails![i].vehicleParking.text;
      }
    }

    ///vecVan
    VehModel.vecVan =
        surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails!;
    if (VehModel.vecVan.isNotEmpty) {
      VehiclesData.vecModel[3].number = VehModel.vecVan.length;
      VehiclesData.vecModel[3].textEditingController.text =
          VehModel.vecVan.length.toString();
      VehiclesData.vecModel[3].isChosen = true;
    }
    for (int i = 0; i < VehModel.vecVan.length; i++) {
      VehModel.vecVan[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![1].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecVan[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![1].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecVan[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![1].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///largeCar
    VehModel.largeCar =
        surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails!;
    if (VehModel.largeCar.isNotEmpty) {
      VehiclesData.vecModel[1].number = VehModel.largeCar.length;
      VehiclesData.vecModel[1].textEditingController.text =
          VehModel.largeCar.length.toString();
      VehiclesData.vecModel[1].isChosen = true;
    }
    for (int i = 0; i < VehModel.largeCar.length; i++) {
      VehModel.largeCar[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![2].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.largeCar[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![2].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.largeCar[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![2].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///eScooter
    VehModel.eScooter =
        surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails!;
    if (VehModel.eScooter.isNotEmpty) {
      VehiclesData.vecModel[6].number = VehModel.eScooter.length;
      VehiclesData.vecModel[6].textEditingController.text =
          VehModel.eScooter.length.toString();
      VehiclesData.vecModel[6].isChosen = true;
    }
    for (int i = 0; i < VehModel.eScooter.length; i++) {
      VehModel.eScooter[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![3].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.eScooter[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![3].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.eScooter[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![3].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///pickUp
    VehModel.pickUp =
        surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails!;
    if (VehModel.pickUp.isNotEmpty) {
      VehiclesData.vecModel[4].number = VehModel.pickUp.length;
      VehiclesData.vecModel[4].textEditingController.text =
          VehModel.pickUp.length.toString();
      VehiclesData.vecModel[4].isChosen = true;
    }
    for (int i = 0; i < VehModel.pickUp.length; i++) {
      VehModel.pickUp[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![4].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.pickUp[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![4].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.pickUp[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![4].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///bicycle
    VehModel.bicycle =
        surveyPt.surveyPT.vehiclesBodyType![5].vehicleTypeDetails!;
    if (VehModel.bicycle.isNotEmpty) {
      VehiclesData.vecModel[5].number = VehModel.bicycle.length;
      VehiclesData.vecModel[5].textEditingController.text =
          VehModel.bicycle.length.toString();
      VehiclesData.vecModel[5].isChosen = true;
    }
    for (int i = 0; i < VehModel.bicycle.length; i++) {
      VehModel.bicycle[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![5].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.bicycle[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![5].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecWanet
    VehModel.vecWanet =
        surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails!;
    if (VehModel.vecWanet.isNotEmpty) {
      VehiclesData.vecModel[2].number = VehModel.vecWanet.length;
      VehiclesData.vecModel[2].textEditingController.text =
          VehModel.vecWanet.length.toString();
      VehiclesData.vecModel[2].isChosen = true;
    }
    for (int i = 0; i < VehModel.vecWanet.length; i++) {
      VehModel.vecWanet[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![6].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecWanet[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![6].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecWanet[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![6].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecLightCargo
    VehModel.vecLightCargo =
        surveyPt.surveyPT.vehiclesBodyType![7].vehicleTypeDetails!;
    if (VehModel.vecLightCargo.isNotEmpty) {
      VehiclesData.vecModel[7].number = VehModel.vecLightCargo.length;
      VehiclesData.vecModel[7].textEditingController.text =
          VehModel.vecLightCargo.length.toString();
      VehiclesData.vecModel[7].isChosen = true;
    }
    for (int i = 0; i < VehModel.vecLightCargo.length; i++) {
      VehModel.vecLightCargo[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![7].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecLightCargo[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![7].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecLightCargo[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![7].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecWanet
    VehModel.vecHeavyCargo =
        surveyPt.surveyPT.vehiclesBodyType![8].vehicleTypeDetails!;
    if (VehModel.vecHeavyCargo.isNotEmpty) {
      VehiclesData.vecModel[8].number = VehModel.vecHeavyCargo.length;
      VehiclesData.vecModel[8].textEditingController.text =
          VehModel.vecHeavyCargo.length.toString();
      VehiclesData.vecModel[8].isChosen = true;
    }
    for (int i = 0; i < VehModel.vecHeavyCargo.length; i++) {
      VehModel.vecHeavyCargo[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![8].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecHeavyCargo[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![8].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecHeavyCargo[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![8].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecMinibus
    VehModel.vecMinibus =
        surveyPt.surveyPT.vehiclesBodyType![9].vehicleTypeDetails!;
    if (VehModel.vecMinibus.isNotEmpty) {
      VehiclesData.vecModel[9].number = VehModel.vecMinibus.length;
      VehiclesData.vecModel[9].textEditingController.text =
          VehModel.vecMinibus.length.toString();
      VehiclesData.vecModel[9].isChosen = true;
    }
    for (int i = 0; i < VehModel.vecMinibus.length; i++) {
      VehModel.vecMinibus[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![9].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecMinibus[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![9].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecMinibus[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![9].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecCoaster
    VehModel.vecCoaster =
        surveyPt.surveyPT.vehiclesBodyType![10].vehicleTypeDetails!;
    if (VehModel.vecCoaster.isNotEmpty) {
      VehiclesData.vecModel[10].number = VehModel.vecCoaster.length;
      VehiclesData.vecModel[10].textEditingController.text =
          VehModel.vecCoaster.length.toString();
      VehiclesData.vecModel[10].isChosen = true;
    }
    for (int i = 0; i < VehModel.vecCoaster.length; i++) {
      VehModel.vecCoaster[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![10].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecCoaster[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![10].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecCoaster[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![10].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecBus
    VehModel.vecBus =
        surveyPt.surveyPT.vehiclesBodyType![11].vehicleTypeDetails!;
    if (VehModel.vecBus.isNotEmpty) {
      VehiclesData.vecModel[11].number = VehModel.vecBus.length;
      VehiclesData.vecModel[11].textEditingController.text =
          VehModel.vecBus.length.toString();
      VehiclesData.vecModel[11].isChosen = true;
    }
    for (int i = 0; i < VehModel.vecBus.length; i++) {
      VehModel.vecBus[i].vehicleFuelType.text = surveyPt.surveyPT
          .vehiclesBodyType![11].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecBus[i].vehicleOwnership.text = surveyPt.surveyPT
          .vehiclesBodyType![11].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecBus[i].vehicleParking.text = surveyPt.surveyPT
          .vehiclesBodyType![11].vehicleTypeDetails![i].vehicleParking.text;
    }
  }
}
