import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/TripsData/trip_data.dart';

class TravelTypeModel {
  String? carParkingPlace;
  String? travelType;
  String? taxiTravelType;
  TextEditingController taxiTravelTypeOther = TextEditingController();
  TextEditingController otherWhereDidYouParking = TextEditingController();
  String? passTravelType;
  TextEditingController taxiFare = TextEditingController();
  TextEditingController ticketSub = TextEditingController();
  String? publicTransportFare;

  TravelTypeModel({
    this.carParkingPlace,
    this.passTravelType,
    this.travelType,
    required this.taxiTravelTypeOther,
    required this.otherWhereDidYouParking,
    this.publicTransportFare,
    required this.taxiFare,
    required this.ticketSub,
    this.taxiTravelType,
  });

  TravelTypeModel.fromJson(Map<String, dynamic> json) {
    carParkingPlace = json['carParkingPlace'] ?? '';
    taxiTravelType = json['taxiTravelType'] ??
        TripData.whatTypeOfTaxi[
            '?what type of taxi did you use and how much fare did you pay'][0];
    travelType = json['travelType '] ?? '';
    passTravelType = json['passTravelType'] ?? '';
    taxiFare.text = json['taxiFare'] ?? '';
    publicTransportFare = json['publicTransportFare'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['carParkingPlace'] = carParkingPlace == "Other"
        ? otherWhereDidYouParking.text
        : carParkingPlace;
    data['taxiTravelType'] = taxiTravelType;
    data['travelType '] = travelType;
    data['passTravelType'] = passTravelType;
    data['taxiFare'] = taxiFare.text;
    data['publicTransportFare'] = publicTransportFare;
    return data;
  }
}

class ArrivalDepartTime {
  TextEditingController departTime = TextEditingController();
  TextEditingController arriveDestinationTime = TextEditingController();
  String? numberRepeatTrip;

  ArrivalDepartTime({
    required this.departTime,
    this.numberRepeatTrip,
    required this.arriveDestinationTime,
  });

  ArrivalDepartTime.fromJson(Map<String, dynamic> json) {
    departTime.text = json['departTime'] ?? '';
    arriveDestinationTime.text = json['arriveDestinationTime'] ?? '';
    numberRepeatTrip = json['numberRepeatTrip'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['departTime'] = departTime.text;
    data['arriveDestinationTime'] = arriveDestinationTime.text;
    data['numberRepeatTrip'] = numberRepeatTrip;
    return data;
  }
}
