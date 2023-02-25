import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/widgets/editing_controler3.dart';

import '../../../Models/Vehicles_SurveyModel/vehicles_model.dart';
import '../VechelisData/vechelis_data.dart';
import '../VechelisData/veh_model.dart';

class EmptyVehicles {
  static emptyVehicles() {
    VehModel.vecVan = [];
    VehModel.hasVehicles = false;
    VehModel.vecWanet = [];
    VehModel.vecCar = [];
    VehModel.pickUp = [];
    VehModel.bicycle = [];
    VehModel.eScooter = [];
    VehModel.largeCar = [];
    for (var element in VehiclesData.vecModel) {
      element.textEditingController.text = '';
      element.isChosen = false;
      element.number = 0;
    }
    VehModel.vehiclesModel = VehiclesModel(
      nearestBusStop: '',
      numberParcels: TextEditingController(),
      numberFood: TextEditingController(),
      numberGrocery: TextEditingController(),
      numberOtherParcels: TextEditingController(),
      numberParcelsDeliveries: TextEditingController(),
    );
    VehModel.fuelTypeCode = "";
    VehModel.ownerShipCode = "";
    VehModel.parkThisCar = "";
    VehModel.editingController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      totalNumber: TextEditingController(),
      peopleAdults18: TextEditingController(),
    );
  }
}
