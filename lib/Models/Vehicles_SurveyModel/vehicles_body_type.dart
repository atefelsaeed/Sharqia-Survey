import 'package:flutter/material.dart';

import '../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';

class VehiclesBodyType {
  String? vehicleTypeName;
  int? vehicleTypeQuantity;
  List<VehicleBodyDetails>? vehicleTypeDetails;

  VehiclesBodyType({
    this.vehicleTypeName,
    this.vehicleTypeQuantity,
    this.vehicleTypeDetails,
  });

  VehiclesBodyType.fromJson(Map<String, dynamic> json) {
    vehicleTypeName = json['vehicleTypeName'] ?? '';
    if (json['vehicleTypeQuantity'].isNotEmpty &&
        json['vehicleTypeQuantity'] != null) {
      vehicleTypeQuantity = int.parse(json['vehicleTypeQuantity'].toString());
    } else {
      vehicleTypeQuantity = 0;
    }

    vehicleTypeDetails = List.from(json['vehicleTypeDetails'])
        .map((e) => VehicleBodyDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleTypeName'] = vehicleTypeName ?? '';
    data['vehicleTypeQuantity'] = vehicleTypeQuantity ?? '';
    data['vehicleTypeDetails'] =
        vehicleTypeDetails!.map((e) => e.toJson()).toList();
    return data;
  }
}

class VehicleBodyDetails {
  TextEditingController vehicleFuelType = TextEditingController();
  TextEditingController vehicleParking = TextEditingController();
  TextEditingController vehicleOwnership = TextEditingController();

  VehicleBodyDetails({
    required this.vehicleFuelType,
    required this.vehicleParking,
    required this.vehicleOwnership,
  });

  VehicleBodyDetails.fromJson(Map<String, dynamic> json) {
    vehicleFuelType.text = json['vehicleFuelType'] ??
        VehiclesData.fuelTypeCodes['Fuel type codes- V2-F']![0];
    vehicleParking.text = json['vehicleParking'] ??
        VehiclesData.parkThisCar['Ownership codes- V3-O']![0];
    vehicleOwnership.text = json['vehicleOwnership'] ??
        VehiclesData.ownership['Ownership codes- V3-O']![0];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['vehicleFuelType'] = vehicleFuelType.text;
    data['vehicleParking'] = vehicleParking.text;
    data['vehicleOwnership'] = vehicleOwnership.text;
    return data;
  }
}
