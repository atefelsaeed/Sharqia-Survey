import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sharqia_household_survey/Models/Vehicles_SurveyModel/vehicles_body_type.dart';
import 'package:sharqia_household_survey/Models/Vehicles_SurveyModel/vehicles_model.dart';

import '../Data/Enums/hhs_enums.dart';
import '../Helper/locale_database/operations/survey_pt_operations.dart';
import '../Models/HHS_SurvyModels/hhs_models.dart';
import '../Models/HHS_SurvyModels/survey_hhs.dart';
import '../Models/Person_SurveyModel/person_model.dart';
import '../Models/Trips_SurveyModel/trips_model.dart';
import 'survey.dart';

class SurveyPTProvider extends SurveyProvider {
  @override
  String push_url = "savePtData";
  late final SurveyPT _data;

  SurveyPTProvider(data) : super(data) {
    _data = super.data;
  }

  @override
  String get id => _data.id;

  @override
  set id(String id) {
    _data.id = id;
    // notifyListeners();
  }

  @override
  VehiclesModel get vehiclesData => _data.vehiclesData;

  @override
  set vehiclesData(VehiclesModel vehiclesData) {
    _data.vehiclesData = vehiclesData;
    // notifyListeners();
  }
  List<SurveyPT>? surveyAllData = [];

  Future getAllLocalData() async {
    try {
      surveyAllData = await SurveyPtOperations().getSurveyPtAllItems();
      print(surveyAllData!.length);
      notifyListeners();
    } catch (ex) {
      rethrow;
    }
  }
  LatLng? startingAddressLatLng;
  LatLng? endingAddressLatLng;

  set startAddressLatLng(LatLng l) {
    startingAddressLatLng = l;
    notifyListeners();
  }

  set endAddressLatLng(LatLng l) {
    endingAddressLatLng = l;
    notifyListeners();
  }

  @override
  SurveyType get type => _data.type;

  @override
  bool get synced => _data.synced;

  @override
  double get headerLat => _data.header.locationLat;

  @override
  set headerLat(double l) {
    _data.header.locationLat = l;
    // notifyListeners();
  }

  @override
  double get headerLong => _data.header.locationLong;

  @override
  set headerLong(double l) {
    _data.header.locationLong = l;
    // notifyListeners();
  }

  @override
  DateTime get interViewDate => _data.header.interviewDate;

  @override
  set interViewDate(DateTime date) {
    _data.header.interviewDate = date;
    // notifyListeners();
  }

  @override
  int get headerEmpNumber => _data.header.empNumber;

  @override
  set headerEmpNumber(int i) {
    _data.header.empNumber = i;
    // notifyListeners();
  }

  @override
  String get headerZoneNumber => _data.header.zoneNumber;

  @override
  set headerZoneNumber(String i) {
    _data.header.zoneNumber = i;
    // notifyListeners();
  }

  @override
  int? get headerInterviewNumber => _data.header.interviewNumber;

  @override
  set headerInterviewNumber(int? i) {
    _data.header.interviewNumber = i;
    // notifyListeners();
  }

  @override
  String? get headerDistrictName => _data.header.districtName;

  @override
  set headerDistrictName(String? i) {
    _data.header.districtName = i;
    // notifyListeners();
  }

  @override
  String? get hhsAddressLong => _data.header.householdAddress.hhsAddressLong;

  @override
  set hhsAddressLong(String? i) {
    _data.header.householdAddress.hhsAddressLong = i;
    // notifyListeners();
  }

  @override
  String? get hhsAddressLat => _data.header.householdAddress.hhsAddressLat;

  @override
  set hhsAddressLat(String? i) {
    _data.header.householdAddress.hhsAddressLat = i;
    // notifyListeners();
  }

  @override
  TextEditingController get hhsPhone => _data.header.householdAddress.hhsPhone;

  @override
  set hhsPhone(TextEditingController i) {
    _data.header.householdAddress.hhsPhone = i;
    // notifyListeners();
  }

  ///==========householdQuestions====================
  @override
  String? get hhsDwellingType => _data.householdQuestions.hhsDwellingType;

  @override
  set hhsDwellingType(String? i) {
    _data.householdQuestions.hhsDwellingType = i;
    // notifyListeners();
  }

  @override
  String? get hhsIsDwellingType => _data.householdQuestions.hhsIsDwelling;

  @override
  set hhsIsDwellingType(String? i) {
    _data.householdQuestions.hhsIsDwelling = i;
    // notifyListeners();
  }

  @override
  TextEditingController get hhsNumberBedRooms =>
      _data.householdQuestions.hhsNumberBedRooms;

  @override
  set hhsNumberBedRooms(TextEditingController i) {
    _data.householdQuestions.hhsNumberBedRooms = i;
    // notifyListeners();
  }

  @override
  TextEditingController get hhsNumberApartments =>
      _data.householdQuestions.hhsNumberApartments;

  @override
  set hhsNumberApartments(TextEditingController i) {
    _data.householdQuestions.hhsNumberApartments = i;
    // notifyListeners();
  }

  @override
  TextEditingController get hhsNumberFloors =>
      _data.householdQuestions.hhsNumberFloors;

  @override
  set hhsNumberFloors(TextEditingController i) {
    _data.householdQuestions.hhsNumberFloors = i;
    // notifyListeners();
  }

  @override
  String? get hhsNumberSeparateFamilies =>
      _data.householdQuestions.hhsNumberSeparateFamilies;

  @override
  set hhsNumberSeparateFamilies(String? i) {
    _data.householdQuestions.hhsNumberSeparateFamilies = i;
    // notifyListeners();
  }

  @override
  String? get hhsNumberAdults => _data.householdQuestions.hhsNumberAdults;

  @override
  set hhsNumberAdults(String? i) {
    _data.householdQuestions.hhsNumberAdults = i;
    // notifyListeners();
  }

  @override
  String? get hhsNumberYearsInAddress =>
      _data.householdQuestions.hhsNumberYearsInAddress;

  @override
  set hhsNumberYearsInAddress(String? i) {
    _data.householdQuestions.hhsNumberYearsInAddress = i;
    // notifyListeners();
  }

/*  @override
  bool? get hhsIsDemolishedAreas =>
      _data.householdQuestions.hhsIsDemolishedAreas;

  @override
  set hhsIsDemolishedAreas(bool? i) {
    _data.householdQuestions.hhsIsDemolishedAreas = i;
    // notifyListeners();
  }

  @override
  String? get hhsDemolishedAreas => _data.householdQuestions.hhsDemolishedAreas;

  @override
  set hhsDemolishedAreas(String? i) {
    _data.householdQuestions.hhsDemolishedAreas = i;
    // notifyListeners();
  }*/

  ///==============hhsPedalCycles(PC)====================
  @override
  String get hhsPCTotalBikesNumber =>
      _data.householdQuestions.hhsPedalCycles.totalBikesNumber;

  @override
  set hhsPCTotalBikesNumber(String i) {
    _data.householdQuestions.hhsPedalCycles.totalBikesNumber = i;
    // notifyListeners();
  }

  @override
  String get hhsPCAdultsBikesNumber =>
      _data.householdQuestions.hhsPedalCycles.adultsBikesNumber;

  @override
  set hhsPCAdultsBikesNumber(String i) {
    _data.householdQuestions.hhsPedalCycles.adultsBikesNumber = i;
    // notifyListeners();
  }

  @override
  String get hhsPCChildrenBikesNumber =>
      _data.householdQuestions.hhsPedalCycles.childrenBikesNumber;

  @override
  set hhsPCChildrenBikesNumber(String i) {
    _data.householdQuestions.hhsPedalCycles.childrenBikesNumber = i;
    // notifyListeners();
  }

  ///==============hhsElectricCycles(EC)====================
  @override
  String get hhsECTotalBikesNumber =>
      _data.householdQuestions.hhsElectricCycles.totalBikesNumber;

  @override
  set hhsECTotalBikesNumber(String i) {
    _data.householdQuestions.hhsElectricCycles.totalBikesNumber = i;
    // notifyListeners();
  }

  @override
  String get hhsECAdultsBikesNumber =>
      _data.householdQuestions.hhsElectricCycles.adultsBikesNumber;

  @override
  set hhsECAdultsBikesNumber(String i) {
    _data.householdQuestions.hhsElectricCycles.adultsBikesNumber = i;
    // notifyListeners();
  }

  @override
  String get hhsECChildrenBikesNumber =>
      _data.householdQuestions.hhsElectricCycles.childrenBikesNumber;

  @override
  set hhsECChildrenBikesNumber(String i) {
    _data.householdQuestions.hhsElectricCycles.childrenBikesNumber = i;
    // notifyListeners();
  }

  ///==============hhsElectricScooter(ES)====================
  @override
  String get hhsESTotalBikesNumber =>
      _data.householdQuestions.hhsElectricScooter.totalBikesNumber;

  @override
  set hhsESTotalBikesNumber(String i) {
    _data.householdQuestions.hhsElectricScooter.totalBikesNumber = i;
    // notifyListeners();
  }

  @override
  String get hhsESAdultsBikesNumber =>
      _data.householdQuestions.hhsElectricScooter.adultsBikesNumber;

  @override
  set hhsESAdultsBikesNumber(String i) {
    _data.householdQuestions.hhsElectricScooter.adultsBikesNumber = i;
    // notifyListeners();
  }

  @override
  String get hhsESChildrenBikesNumber =>
      _data.householdQuestions.hhsElectricScooter.childrenBikesNumber;

  @override
  set hhsESChildrenBikesNumber(String i) {
    _data.householdQuestions.hhsElectricScooter.childrenBikesNumber = i;
    // notifyListeners();
  }

  @override
  String? get hhsTotalIncome => _data.householdQuestions.hhsTotalIncome;

  @override
  set hhsTotalIncome(String? i) {
    _data.householdQuestions.hhsTotalIncome = i;
    // notifyListeners();
  }

  @override
  set hhsSeparateFamilies(List<SeparateFamilies> e) =>
      _data.hhsSeparateFamilies = e;

  @override
  List<SeparateFamilies> get hhsSeparateFamilies =>
      [...?_data.hhsSeparateFamilies];

  @override
  set vehiclesBodyType(List<VehiclesBodyType> e) => _data.vehiclesBodyType = e;

  @override
  List<VehiclesBodyType> get vehiclesBodyType => [...?_data.vehiclesBodyType];

  @override
  set personData(List<PersonModel> e) => _data.personData = e;

  @override
  List<PersonModel> get personData => [...?_data.personData];

  @override
  set tripsList(List<TripsModel> e) => _data.tripsList = e;

  @override
  List<TripsModel> get tripsList => [...?_data.tripsList];

  @override
  String? get hhsNumberChildren => _data.householdQuestions.hhsNumberChildren;

  @override
  set hhsNumberChildren(String? l) {
    _data.householdQuestions.hhsNumberChildren = l;
  }
}
