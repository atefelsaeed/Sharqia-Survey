import 'package:flutter/cupertino.dart';

class VehiclesModel {
  TextEditingController numberParcels = TextEditingController();
  TextEditingController numberParcelsDeliveries = TextEditingController();
  TextEditingController numberFood = TextEditingController();
  TextEditingController numberGrocery = TextEditingController();
  TextEditingController numberOtherParcels = TextEditingController();
  String? nearestBusStop;

  VehiclesModel({
    this.nearestBusStop,
    required this.numberParcels,
    required this.numberFood,
    required this.numberGrocery,
    required this.numberOtherParcels,
    required this.numberParcelsDeliveries,
  });

  VehiclesModel.fromJson(Map<String, dynamic> json) {
    numberParcels.text = json['numberParcels'] ?? "";
    numberFood.text = json['numberFood'] ?? "";
    numberGrocery.text = json['numberGrocery'] ?? "";
    numberOtherParcels.text = json['numberOtherParcels'] ?? "";
    numberParcelsDeliveries.text = json['numberParcelsDeliveries'] ?? "";
    nearestBusStop = json['nearestBusStop'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['numberParcels'] = numberParcels.text;
    data['numberFood'] = numberFood.text;
    data['numberGrocery'] = numberGrocery.text;
    data['numberOtherParcels'] = numberOtherParcels.text;
    data['numberParcelsDeliveries'] = numberParcelsDeliveries.text;
    data['nearestBusStop'] = nearestBusStop ?? '';
    return data;
  }
}
