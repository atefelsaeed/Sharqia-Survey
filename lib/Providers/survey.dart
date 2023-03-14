import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Data/Enums/hhs_enums.dart';
import 'package:sharqia_household_survey/Models/Vehicles_SurveyModel/vehicles_model.dart';

import '../Models/HHS_SurvyModels/hhs_models.dart';
import '../Models/HHS_SurvyModels/survey_hhs.dart';
import '../Models/Person_SurveyModel/person_model.dart';
import '../Models/Trips_SurveyModel/trips_model.dart';
import '../Models/Vehicles_SurveyModel/vehicles_body_type.dart';

abstract class SurveyProvider with ChangeNotifier {
  late Map _authHeader;
  final SurveyPT data;
  bool syncing = false;

  SurveyProvider(this.data);

  abstract String push_url;

  void auth(
    Map authHeader,
  ) {
    _authHeader = authHeader;
  }

  String get id;

  set id(String id);

  SurveyType get type;

  VehiclesModel get vehiclesData;

  set vehiclesData(VehiclesModel id);

  bool get synced;

  // set synced(bool s);

  double get headerLat;

  set headerLat(double l);

  double get headerLong;

  set headerLong(double l);

  DateTime get interViewDate;

  set interViewDate(DateTime date);

  int get headerEmpNumber;

  set headerEmpNumber(int l);

  int? get headerInterviewNumber;

  set headerInterviewNumber(int? l);

  String? get headerDistrictName;

  set headerDistrictName(String? l);

  String get headerZoneNumber;

  set headerZoneNumber(String l);

//==========HHS Address============

  String? get hhsAddressLat;

  set hhsAddressLat(String? l);

  String? get hhsAddressLong;

  set hhsAddressLong(String? l);

  TextEditingController get hhsPhone;

  ///=========HouseholdQuestions=================
  String? get hhsDwellingType;

  set hhsDwellingType(String? l);

  String? get hhsIsDwellingType;

  set hhsIsDwellingType(String? l);

  TextEditingController get hhsNumberBedRooms;

  set hhsNumberBedRooms(TextEditingController l);
/*
  TextEditingController get hhsNumberHealthTrip;

  set hhsNumberHealthTrip(TextEditingController l);

  TextEditingController get hhsNumberShoppingTrip;

  set hhsNumberShoppingTrip(TextEditingController l);
*/
  TextEditingController get hhsNumberApartments;

  set hhsNumberApartments(TextEditingController l);

  TextEditingController get hhsNumberFloors;

  set hhsNumberFloors(TextEditingController l);

  String? get hhsNumberSeparateFamilies;

  set hhsNumberSeparateFamilies(String? l);

  String? get hhsNumberAdults;

  set hhsNumberAdults(String? l);

  String? get hhsNumberChildren;

  set hhsNumberChildren(String? l);

  String? get hhsNumberYearsInAddress;

  set hhsNumberYearsInAddress(String? l);

  // bool? get hhsIsDemolishedAreas;
  //
  // set hhsIsDemolishedAreas(bool? l);
  //
  // String? get hhsDemolishedAreas;
  //
  // set hhsDemolishedAreas(String? l);

  ///==============hhsPedalCycles(PC)====================
  String get hhsPCTotalBikesNumber;

  set hhsPCTotalBikesNumber(String l);

  String get hhsPCAdultsBikesNumber;

  set hhsPCAdultsBikesNumber(String l);

  String get hhsPCChildrenBikesNumber;

  set hhsPCChildrenBikesNumber(String l);

  ///==============hhsElectricCycles(EC)====================
  String get hhsECTotalBikesNumber;

  set hhsECTotalBikesNumber(String l);

  String get hhsECAdultsBikesNumber;

  set hhsECAdultsBikesNumber(String l);

  String get hhsECChildrenBikesNumber;

  set hhsECChildrenBikesNumber(String l);

  ///==============hhsElectricScooter(ES)====================
  String get hhsESTotalBikesNumber;

  set hhsESTotalBikesNumber(String l);

  String get hhsESAdultsBikesNumber;

  set hhsESAdultsBikesNumber(String l);

  String get hhsESChildrenBikesNumber;

  set hhsESChildrenBikesNumber(String l);

  String? get hhsTotalIncome;

  set hhsTotalIncome(String? l);

  set hhsSeparateFamilies(List<SeparateFamilies> e);

  List<SeparateFamilies> get hhsSeparateFamilies;

  set vehiclesBodyType(List<VehiclesBodyType> e);

  List<VehiclesBodyType> get vehiclesBodyType;

  set personData(List<PersonModel> e);

  List<PersonModel> get personData;

  set tripsList(List<TripsModel> e);

  List<TripsModel> get tripsList;
}
