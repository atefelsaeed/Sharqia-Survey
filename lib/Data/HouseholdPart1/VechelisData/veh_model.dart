import 'package:flutter/cupertino.dart';

import '../../../Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import '../../../Models/Vehicles_SurveyModel/vehicles_model.dart';
import '../../../UI/Screens/Survey/widgets/editing_controler3.dart';

class VehModel {
  static bool hasVehicles = false;
  static VehiclesModel vehiclesModel = VehiclesModel(
    nearestBusStop: '',
    numberParcels: TextEditingController(),
    numberFood: TextEditingController(),
    numberGrocery: TextEditingController(),
    numberOtherParcels: TextEditingController(),
    numberParcelsDeliveries: TextEditingController(),
  );

  static EditingController3 editingController3 = EditingController3(
    peopleUnder18: TextEditingController(),
    totalNumber: TextEditingController(),
    peopleAdults18: TextEditingController(),
  );

  ///
  static List<VehicleBodyDetails> vecCar = [];
  static List<VehicleBodyDetails> vecVan = [];
  static List<VehicleBodyDetails> largeCar = [];
  static List<VehicleBodyDetails> eScooter = [];
  static List<VehicleBodyDetails> pickUp = [];
  static List<VehicleBodyDetails> bicycle = [];
  static List<VehicleBodyDetails> vecWanet = [];

  // static List<VehicleBodyDetails> vecLightCargo = [];
  // static List<VehicleBodyDetails> vecHeavyCargo = [];
  // static List<VehicleBodyDetails> vecMinibus = [];
  // static List<VehicleBodyDetails> vecBus = [];
  // static List<VehicleBodyDetails> vecCoaster = [];

  ///
  static String fuelTypeCode = "";
  static String ownerShipCode = "";
  static String parkThisCar = "";
  static bool parkThisCarFlag = false;
  static String largeItemCar = "";

  static String nearestPublicTransporter = "";
}

class VehicleBodyDetailsData {
  TextEditingController vehicleFuel;
  TextEditingController vehicleModel;
  TextEditingController vehicleAnnualMileage;
  TextEditingController vehicleAge;
  bool? vehicleIsHousehold;
  TextEditingController vehicleOwner;

  VehicleBodyDetailsData({
    required this.vehicleFuel,
    required this.vehicleAge,
    required this.vehicleAnnualMileage,
    this.vehicleIsHousehold,
    required this.vehicleModel,
    required this.vehicleOwner,
  });
}
