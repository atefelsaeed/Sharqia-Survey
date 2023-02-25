import 'package:sharqia_household_survey/Data/HouseholdPart1/PersonData/person_model_list.dart';
import 'package:sharqia_household_survey/Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import 'package:sharqia_household_survey/Providers/survey.dart';
import 'package:sharqia_household_survey/Providers/survey_hhs.dart';
import 'package:provider/provider.dart';

import 'TripsData/trip_mode_list.dart';
import 'VechelisData/veh_model.dart';

class SaveVehiclesData {
  static saveData(context) {
    SurveyPTProvider survey =
        Provider.of<SurveyPTProvider>(context, listen: false);
    survey.vehiclesData.nearestBusStop = VehModel.nearestPublicTransporter;

    List<VehiclesBodyType> vehicles = [
      VehiclesBodyType(
        vehicleTypeName: 'سيارة صغيرة',
        vehicleTypeQuantity: VehModel.vecCar.length,
        vehicleTypeDetails: VehModel.vecCar,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'شاحنة',
        vehicleTypeQuantity: VehModel.vecVan.length,
        vehicleTypeDetails: VehModel.vecVan,
      ),
      VehiclesBodyType(
        vehicleTypeName: "سيارة كبيرة",
        vehicleTypeQuantity: VehModel.largeCar.length,
        vehicleTypeDetails: VehModel.largeCar,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'اسكوتر',
        vehicleTypeQuantity: VehModel.eScooter.length,
        vehicleTypeDetails: VehModel.eScooter,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'دراجة نارية',
        vehicleTypeQuantity: VehModel.pickUp.length,
        vehicleTypeDetails: VehModel.pickUp,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'دراجة هوائية',
        vehicleTypeQuantity: VehModel.bicycle.length,
        vehicleTypeDetails: VehModel.bicycle,
      ),
      VehiclesBodyType(
        vehicleTypeName: 'ونيت',
        vehicleTypeQuantity: VehModel.vecWanet.length,
        vehicleTypeDetails: VehModel.vecWanet,
      )
    ];
    survey.vehiclesBodyType = vehicles;
  }
}

class SavePersonData {
  static saveData(context) {
    SurveyPTProvider survey =
        Provider.of<SurveyPTProvider>(context, listen: false);
    survey.personData = PersonModelList.personModelList;
  }
}

class SaveTripsData {
  static saveData(context) {
    SurveyProvider survey =
        Provider.of<SurveyPTProvider>(context, listen: false);
    survey.tripsList = TripModeList.tripModeList;
  }
}
