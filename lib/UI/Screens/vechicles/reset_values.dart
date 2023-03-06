import 'package:provider/provider.dart';

import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/veh_model.dart';
import '../../../Providers/user_surveys.dart';

class ResetVechilesValues {
  static resetVechValues(context) async {
    UserSurveysProvider surveyPt =
        Provider.of<UserSurveysProvider>(context, listen: false);



    ///vecCar
    VehModel.vecCar =
        surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails!;//vehiclesData.    vehiclesBodyType![0].vehicleTypeDetails!;
   if(   VehModel.vecCar.isNotEmpty) {
     VehiclesData.vecModel[0].number = VehModel.vecCar.length;
     VehiclesData.vecModel[0].textEditingController.text = VehModel.vecCar.length.toString();
     VehiclesData.vecModel[0].isChosen=true;
   }
    var vecCarLength = VehModel.vecCar.length;

    for (int i = 0; i < vecCarLength; i++) {
      if (i < vecCarLength) {
        VehModel.vecCar[i].vehicleFuelType.text =    surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails![i].vehicleFuelType.text;

        VehModel.vecCar[i].vehicleOwnership.text =    surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails![i].vehicleOwnership.text;
        VehModel.vecCar[i].vehicleParking.text =   surveyPt.surveyPT.vehiclesBodyType![0].vehicleTypeDetails![i].vehicleParking.text;
      }
    }

    ///vecVan
    VehModel.vecVan =
    surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails!;
    if(   VehModel.vecVan.isNotEmpty) {
      VehiclesData.vecModel[3].number = VehModel.vecVan.length;
      VehiclesData.vecModel[3].textEditingController.text = VehModel.vecVan.length.toString();
      VehiclesData.vecModel[3].isChosen=true;
    }
    for (int i = 0; i < VehModel.vecVan.length; i++) {
      VehModel.vecVan[i].vehicleFuelType.text =     surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecVan[i].vehicleOwnership.text =  surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecVan[i].vehicleParking.text = surveyPt.surveyPT.vehiclesBodyType![1].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///largeCar
    VehModel.largeCar =
    surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails!;
    if(   VehModel.largeCar.isNotEmpty) {
      VehiclesData.vecModel[1].number = VehModel.largeCar.length;
      VehiclesData.vecModel[1].textEditingController.text = VehModel.largeCar.length.toString();
      VehiclesData.vecModel[1].isChosen=true;
    }
    for (int i = 0; i < VehModel.largeCar.length; i++) {
      VehModel.largeCar[i].vehicleFuelType.text = surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.largeCar[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.largeCar[i].vehicleParking.text =surveyPt.surveyPT.vehiclesBodyType![2].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///eScooter
    VehModel.eScooter =
    surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails!;
    if(   VehModel.eScooter.isNotEmpty) {
      VehiclesData.vecModel[6].number = VehModel.eScooter.length;
      VehiclesData.vecModel[6].textEditingController.text = VehModel.eScooter.length.toString();
      VehiclesData.vecModel[6].isChosen=true;
    }
    for (int i = 0; i < VehModel.eScooter.length; i++) {
      VehModel.eScooter[i].vehicleFuelType.text = surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.eScooter[i].vehicleOwnership.text =  surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.eScooter[i].vehicleParking.text = surveyPt.surveyPT.vehiclesBodyType![3].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///pickUp
    VehModel.pickUp =
    surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails!;
   if(   VehModel.pickUp.isNotEmpty) {
      VehiclesData.vecModel[4].number = VehModel.eScooter.length;
      VehiclesData.vecModel[4].textEditingController.text = VehModel.vecVan.length.toString();
      VehiclesData.vecModel[4].isChosen=true;
    }
    for (int i = 0; i < VehModel.pickUp.length; i++) {
      VehModel.pickUp[i].vehicleFuelType.text =  surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.pickUp[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.pickUp[i].vehicleParking.text =  surveyPt.surveyPT.vehiclesBodyType![4].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///bicycle
    VehModel.bicycle =
    surveyPt.surveyPT.vehiclesBodyType![5].vehicleTypeDetails!;
    if(   VehModel.bicycle.isNotEmpty) {
      VehiclesData.vecModel[5].number = VehModel.eScooter.length;
      VehiclesData.vecModel[5].textEditingController.text = VehModel.bicycle.length.toString();
      VehiclesData.vecModel[5].isChosen=true;
    }
    for (int i = 0; i < VehModel.bicycle.length; i++) {
      VehModel.bicycle[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![5].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.bicycle[i].vehicleParking.text = surveyPt.surveyPT.vehiclesBodyType![5].vehicleTypeDetails![i].vehicleParking.text;
    }

    ///vecWanet
    VehModel.vecWanet =
    surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails!;
    if(   VehModel.vecWanet.isNotEmpty) {
      VehiclesData.vecModel[2].number = VehModel.eScooter.length;
      VehiclesData.vecModel[2].textEditingController.text = VehModel.vecWanet.length.toString();
      VehiclesData.vecModel[2].isChosen=true;
    }
    for (int i = 0; i < VehModel.vecWanet.length; i++) {
      VehModel.vecWanet[i].vehicleFuelType.text = surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails![i].vehicleFuelType.text;
      VehModel.vecWanet[i].vehicleOwnership.text = surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails![i].vehicleOwnership.text;
      VehModel.vecWanet[i].vehicleParking.text =surveyPt.surveyPT.vehiclesBodyType![6].vehicleTypeDetails![i].vehicleParking.text;
    }
  }
}
