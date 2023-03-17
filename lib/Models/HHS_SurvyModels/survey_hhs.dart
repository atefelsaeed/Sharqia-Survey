import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Models/Person_SurveyModel/person_model.dart';

import '/providers/survey_hhs.dart';
import '../../Data/Enums/hhs_enums.dart';
import '../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../Trips_SurveyModel/trips_model.dart';
import '../Vehicles_SurveyModel/vehicles_body_type.dart';
import '../Vehicles_SurveyModel/vehicles_model.dart';
import '../survey.dart';
import 'hhs_models.dart';

class SurveyPT extends Survey {
  HouseholdQuestions householdQuestions = HouseholdQuestions(
    hhsPedalCycles: BikesType("", "", ""),
    hhsElectricCycles: BikesType("", "", ""),
    hhsElectricScooter: BikesType("", "", ""),
    hhsNumberBedRooms: TextEditingController(),
    hhsNumberHealthTrip: TextEditingController(),
    hhsNumberShoppingTrip: TextEditingController(),
    hhsNumberFloors: TextEditingController(),
    hhsNumberApartments: TextEditingController(),
  );
  VehiclesModel vehiclesData = VehiclesModel(
    numberParcels: TextEditingController(),
    numberFood: TextEditingController(),
    numberGrocery: TextEditingController(),
    numberOtherParcels: TextEditingController(),
    numberParcelsDeliveries: TextEditingController(),
  ); //
  List<PersonModel>? personData; //
  List<SeparateFamilies>? hhsSeparateFamilies;
  List<TripsModel>? tripsList; //
  List<VehiclesBodyType>? vehiclesBodyType;

  SurveyPT() : super(SurveyType.pt) {
    super.provider = SurveyPTProvider(this);
    super.header = HeaderBase();
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = EnumToString.convertToString(type, camelCase: true);
    data['synced'] = synced.toString();
    data['headerDate'] = header.interviewDate.toString();
    data['vehiclesData'] = jsonEncode(vehiclesData.toJson());
    data['headerEmpNumber'] = header.empNumber;
    data['headerInterviewNumber'] = header.interviewNumber;
    data['headerDistrictName'] = header.districtName;
    data['headerZoneNumber'] = header.zoneNumber;
    data['hhsAddressLong'] = header.householdAddress.hhsAddressLong;
    data['hhsAddressLat'] = header.householdAddress.hhsAddressLat;
    data['hhsPhone'] = header.householdAddress.hhsPhone.text;
    //========householdQuestions===============================
    data['hhsDwellingType'] = householdQuestions.hhsDwellingType;
    data['hhsIsDwelling'] = householdQuestions.hhsIsDwelling;
    data['hhsNumberBedRooms'] = householdQuestions.hhsNumberBedRooms.text;
    data['hhsNumberHealthTrip'] = householdQuestions.hhsNumberHealthTrip.text;
    data['hhsNumberShoppingTrip'] = householdQuestions.hhsNumberShoppingTrip.text;
    data['hhsNumberApartments'] = householdQuestions.hhsNumberApartments.text;
    data['hhsNumberFloors'] = householdQuestions.hhsNumberFloors.text;
    data['hhsNumberSeparateFamilies'] =
        householdQuestions.hhsNumberSeparateFamilies;
    data['hhsNumberAdults'] = householdQuestions.hhsNumberAdults;
    data['hhsNumberChildren'] = householdQuestions.hhsNumberChildren;
    data['hhsNumberYearsInAddress'] =
        householdQuestions.hhsNumberYearsInAddress;
    // data['hhsIsDemolishedAreas'] = householdQuestions.hhsIsDemolishedAreas;
    // data['hhsDemolishedAreas'] = householdQuestions.hhsDemolishedAreas;
    //==========hhsPedalCycles(PC)============
    data['hhsPCTotalBikesNumber'] =
        householdQuestions.hhsPedalCycles.totalBikesNumber;
    data['hhsPCAdultsBikesNumber'] =
        householdQuestions.hhsPedalCycles.adultsBikesNumber;
    data['hhsPCChildrenBikesNumber'] =
        householdQuestions.hhsPedalCycles.childrenBikesNumber;
    //======hhsElectricCycles(EC)============
    data['hhsECTotalBikesNumber'] =
        householdQuestions.hhsElectricCycles.totalBikesNumber;
    data['hhsECAdultsBikesNumber'] =
        householdQuestions.hhsElectricCycles.adultsBikesNumber;
    data['hhsECChildrenBikesNumber'] =
        householdQuestions.hhsElectricCycles.childrenBikesNumber;
    //======hhsElectricScooter(ES)============
    data['hhsESTotalBikesNumber'] =
        householdQuestions.hhsElectricScooter.totalBikesNumber;
    data['hhsESAdultsBikesNumber'] =
        householdQuestions.hhsElectricScooter.adultsBikesNumber;
    data['hhsESChildrenBikesNumber'] =
        householdQuestions.hhsElectricScooter.childrenBikesNumber;
    data['hhsTotalIncome'] = householdQuestions.hhsTotalIncome ?? '';
    //
    data['hhsSeparateFamilies'] = hhsSeparateFamilies
            ?.map((e) => jsonEncode(e.toJson()))
            .toList()
            .toString() ??
        [].toString();
    data['vehiclesBodyType'] = vehiclesBodyType
            ?.map((e) => jsonEncode(e.toJson()))
            .toList()
            .toString() ??
        [].toString();
    data['personData'] =
        personData?.map((e) => jsonEncode(e.toJson())).toList().toString() ??
            [].toString();
    data['tripsList'] =
        tripsList?.map((e) => jsonEncode(e.toJson())).toList().toString() ??
            [].toString();
    return data;
  }

  @override
  Map<String, dynamic> toJsonAPI() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = EnumToString.convertToString(type, camelCase: true);
    data['synced'] = synced.toString();
    data['headerDate'] = header.interviewDate.toString();
    debugPrint(jsonEncode(vehiclesData.toJson()));
    data['vehiclesData'] = vehiclesData.toJson();
    data['headerEmpNumber'] = header.empNumber;
    data['headerInterviewNumber'] = header.interviewNumber;
    data['headerDistrictName'] = header.districtName;
    data['headerZoneNumber'] = header.zoneNumber;
    data['hhsAddressLong'] = header.householdAddress.hhsAddressLong;
    data['hhsAddressLat'] = header.householdAddress.hhsAddressLat;
    data['hhsPhone'] = header.householdAddress.hhsPhone.text;
    //========householdQuestions===============================
    data['hhsDwellingType'] = householdQuestions.hhsDwellingType;
    data['hhsIsDwelling'] = householdQuestions.hhsIsDwelling;
    data['hhsNumberBedRooms'] = householdQuestions.hhsNumberBedRooms.text;
    data['hhsNumberHealthTrip'] = householdQuestions.hhsNumberHealthTrip.text;
    data['hhsNumberShoppingTrip'] = householdQuestions.hhsNumberShoppingTrip.text;
    data['hhsNumberApartments'] = householdQuestions.hhsNumberApartments.text;
    data['hhsNumberFloors'] = householdQuestions.hhsNumberFloors.text;
    data['hhsNumberSeparateFamilies'] =
        householdQuestions.hhsNumberSeparateFamilies;
    data['hhsNumberAdults'] = householdQuestions.hhsNumberAdults;
    data['hhsNumberChildren'] = householdQuestions.hhsNumberChildren;
    data['hhsNumberYearsInAddress'] =
        householdQuestions.hhsNumberYearsInAddress;
    // data['hhsIsDemolishedAreas'] = householdQuestions.hhsIsDemolishedAreas;
    // data['hhsDemolishedAreas'] = householdQuestions.hhsDemolishedAreas;
    //==========hhsPedalCycles(PC)============
    data['hhsPCTotalBikesNumber'] =
        householdQuestions.hhsPedalCycles.totalBikesNumber;
    data['hhsPCAdultsBikesNumber'] =
        householdQuestions.hhsPedalCycles.adultsBikesNumber;
    data['hhsPCChildrenBikesNumber'] =
        householdQuestions.hhsPedalCycles.childrenBikesNumber;
    //======hhsElectricCycles(EC)============
    data['hhsECTotalBikesNumber'] =
        householdQuestions.hhsElectricCycles.totalBikesNumber;
    data['hhsECAdultsBikesNumber'] =
        householdQuestions.hhsElectricCycles.adultsBikesNumber;
    data['hhsECChildrenBikesNumber'] =
        householdQuestions.hhsElectricCycles.childrenBikesNumber;
    //======hhsElectricScooter(ES)============
    data['hhsESTotalBikesNumber'] =
        householdQuestions.hhsElectricScooter.totalBikesNumber;
    data['hhsESAdultsBikesNumber'] =
        householdQuestions.hhsElectricScooter.adultsBikesNumber;
    data['hhsESChildrenBikesNumber'] =
        householdQuestions.hhsElectricScooter.childrenBikesNumber;
    data['hhsTotalIncome'] = householdQuestions.hhsTotalIncome ?? '';
    debugPrint('vehiclesDatax');
    debugPrint(hhsSeparateFamilies?.map((e) => e.toJson()).toList().toString());
    data['hhsSeparateFamilies'] =
        hhsSeparateFamilies?.map((e) => e.toJson()).toList() ??
            jsonDecode([].toString());
    data['vehiclesBodyType'] =
        vehiclesBodyType?.map((e) => e.toJson()).toList() ??
            jsonEncode([].toString());
    data['personData'] = personData?.map((e) => e.toJson()).toList() ??
        jsonEncode([].toString());
    data['tripsList'] =
        tripsList?.map((e) => e.toJson()).toList() ?? jsonEncode([].toString());
    return data;
  }

  SurveyPT.fromJson(Map<String, dynamic> json)
      : super(EnumToString.fromString(SurveyType.values, json['type'],
            camelCase: true)!) {
    provider = SurveyPTProvider(this);
    id = json['id'].toString();
    synced = json['synced'] == false ? false : true;
    header = HeaderBase();
    header.interviewDate = json['headerDate'] == null
        ? DateTime.now()
        : DateTime.parse(json['headerDate']);
    header.empNumber = int.parse(json['headerEmpNumber']);
    header.interviewNumber = int.parse(json['headerInterviewNumber'] ?? '0');
    header.districtName = json['headerDistrictName'] ?? '';
    header.zoneNumber = json['headerZoneNumber'] ?? '';
    //====================HHS Header=========================
    header.householdAddress.hhsAddressLat = json['hhsAddressLat'];
    header.householdAddress.hhsAddressLong = json['hhsAddressLong'];
    header.householdAddress.hhsPhone.text = json['hhsPhone'];
    //================householdQuestions================
    householdQuestions.hhsDwellingType = json['hhsDwellingType'];
    householdQuestions.hhsIsDwelling = json['hhsIsDwelling'];
    householdQuestions.hhsNumberBedRooms.text = json['hhsNumberBedRooms'];
    householdQuestions.hhsNumberShoppingTrip.text = json['hhsNumberShoppingTrip'];
    householdQuestions.hhsNumberHealthTrip.text = json['hhsNumberHealthTrip'];
    householdQuestions.hhsNumberApartments.text = json['hhsNumberApartments'];
    householdQuestions.hhsNumberFloors.text = json['hhsNumberFloors'];
    householdQuestions.hhsNumberSeparateFamilies =
        json['hhsNumberSeparateFamilies'];
    householdQuestions.hhsNumberAdults = json['hhsNumberAdults'];
    householdQuestions.hhsNumberChildren = json['hhsNumberChildren'];
    householdQuestions.hhsNumberYearsInAddress =
        json['hhsNumberYearsInAddress'];
    // householdQuestions.hhsIsDemolishedAreas = json['hhsIsDemolishedAreas'];
    // householdQuestions.hhsDemolishedAreas = json['hhsDemolishedAreas'];
    //==========hhsPedalCycles(PC)============
    householdQuestions.hhsPedalCycles.totalBikesNumber =
        json['hhsPCTotalBikesNumber'];
    householdQuestions.hhsPedalCycles.adultsBikesNumber =
        json['hhsPCAdultsBikesNumber'];
    householdQuestions.hhsPedalCycles.childrenBikesNumber =
        json['hhsPCChildrenBikesNumber'];
    //======hhsElectricCycles(EC)============
    householdQuestions.hhsElectricCycles.totalBikesNumber =
        json['hhsECTotalBikesNumber'];
    householdQuestions.hhsElectricCycles.adultsBikesNumber =
        json['hhsECAdultsBikesNumber'];
    householdQuestions.hhsElectricCycles.childrenBikesNumber =
        json['hhsECChildrenBikesNumber'];
    //======hhsElectricScooter(ES)============
    householdQuestions.hhsElectricScooter.totalBikesNumber =
        json['hhsESTotalBikesNumber'];
    householdQuestions.hhsElectricScooter.adultsBikesNumber =
        json['hhsESAdultsBikesNumber'];
    householdQuestions.hhsElectricScooter.childrenBikesNumber =
        json['hhsESChildrenBikesNumber'];
    householdQuestions.hhsTotalIncome = json['hhsTotalIncome'] ??
        QuestionsData.qh9[
            'Please indicate in which of the following bands your total monthly household income inclusive of benefits falls?'][0];
    vehiclesData = VehiclesModel.fromJson(jsonDecode(json['vehiclesData']));
    hhsSeparateFamilies = jsonDecode(json['hhsSeparateFamilies'])
        .map<SeparateFamilies>(
            (e) => SeparateFamilies.fromJson(e as Map<String, dynamic>))
        .toList();
    vehiclesBodyType = jsonDecode(json['vehiclesBodyType'])
        .map<VehiclesBodyType>(
            (e) => VehiclesBodyType.fromJson(e as Map<String, dynamic>))
        .toList();
    personData = jsonDecode(json['personData'])
        .map<PersonModel>(
            (e) => PersonModel.fromJson(e as Map<String, dynamic>))
        .toList();
    tripsList = jsonDecode(json['tripsList'])
        .map<TripsModel>((e) => TripsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  SurveyPT.fromJsonAPI(Map<String, dynamic> json)
      : super(EnumToString.fromString(SurveyType.values, json['type'],
            camelCase: true)!) {
    provider = SurveyPTProvider(this);
    id = json['id'].toString();
    synced = json['synced'] == false ? false : true;
    header = HeaderBase();
    header.interviewDate = json['headerDate'] == null
        ? DateTime.now()
        : DateTime.parse(json['headerDate']);
    header.empNumber = int.parse(json['headerEmpNumber']);
    header.interviewNumber = int.parse(json['headerInterviewNumber'] ?? '0');
    header.districtName = json['headerDistrictName'] ?? '';
    header.zoneNumber = json['headerZoneNumber'] ?? '';
    //====================HHS Header=========================
    header.householdAddress.hhsAddressLat = json['hhsAddressLat'];
    header.householdAddress.hhsAddressLong = json['hhsAddressLong'];
    header.householdAddress.hhsPhone.text = json['hhsPhone'];
    //================householdQuestions================
    householdQuestions.hhsDwellingType = json['hhsDwellingType'];
    householdQuestions.hhsIsDwelling = json['hhsIsDwelling'];
    householdQuestions.hhsNumberBedRooms.text = json['hhsNumberBedRooms'];
    householdQuestions.hhsNumberShoppingTrip.text = json['hhsNumberShoppingTrip'];
    householdQuestions.hhsNumberHealthTrip.text = json['hhsNumberHealthTrip'];
    householdQuestions.hhsNumberApartments.text =
        json['hhsNumberApartments'] ?? "";
    householdQuestions.hhsNumberFloors.text = json['hhsNumberFloors'];
    householdQuestions.hhsNumberSeparateFamilies =
        json['hhsNumberSeparateFamilies'];
    householdQuestions.hhsNumberAdults = json['hhsNumberAdults'];
    householdQuestions.hhsNumberChildren = json['hhsNumberChildren'];
    householdQuestions.hhsNumberYearsInAddress =
        json['hhsNumberYearsInAddress'];
    // householdQuestions.hhsIsDemolishedAreas = json['hhsIsDemolishedAreas'];
    // householdQuestions.hhsDemolishedAreas = json['hhsDemolishedAreas'];
    //==========hhsPedalCycles(PC)============
    householdQuestions.hhsPedalCycles.totalBikesNumber =
        json['hhsPCTotalBikesNumber'];
    householdQuestions.hhsPedalCycles.adultsBikesNumber =
        json['hhsPCAdultsBikesNumber'];
    householdQuestions.hhsPedalCycles.childrenBikesNumber =
        json['hhsPCChildrenBikesNumber'];
    //======hhsElectricCycles(EC)============
    householdQuestions.hhsElectricCycles.totalBikesNumber =
        json['hhsECTotalBikesNumber'];
    householdQuestions.hhsElectricCycles.adultsBikesNumber =
        json['hhsECAdultsBikesNumber'];
    householdQuestions.hhsElectricCycles.childrenBikesNumber =
        json['hhsECChildrenBikesNumber'];
    //======hhsElectricScooter(ES)============
    householdQuestions.hhsElectricScooter.totalBikesNumber =
        json['hhsESTotalBikesNumber'];
    householdQuestions.hhsElectricScooter.adultsBikesNumber =
        json['hhsESAdultsBikesNumber'];
    householdQuestions.hhsElectricScooter.childrenBikesNumber =
        json['hhsESChildrenBikesNumber'];
    householdQuestions.hhsTotalIncome = json['hhsTotalIncome'] ??
        QuestionsData.qh9[
            'Please indicate in which of the following bands your total monthly household income inclusive of benefits falls?'][0];
    vehiclesData = VehiclesModel.fromJson(json['vehiclesData']);
    hhsSeparateFamilies = json['hhsSeparateFamilies']
        .map<SeparateFamilies>(
            (e) => SeparateFamilies.fromJson(e as Map<String, dynamic>))
        .toList();
    vehiclesBodyType = json['vehiclesBodyType']
        .map<VehiclesBodyType>(
            (e) => VehiclesBodyType.fromJson(e as Map<String, dynamic>))
        .toList();
    personData = json['personData']
        .map<PersonModel>(
            (e) => PersonModel.fromJson(e as Map<String, dynamic>))
        .toList();
    tripsList = json['tripsList']
        .map<TripsModel>((e) => TripsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    synced = json['synced'];
    header = HeaderBase();
    header.interviewDate = DateTime.parse(json['headerDate']);
    header.empNumber = int.parse(json['headerEmpNumber']);
    header.interviewNumber = int.parse(json['headerInterviewNumber']);
    header.districtName = json['headerDistrictName'];
    header.zoneNumber = json['headerZoneNumber'];
    //====================HHS Header=========================
    header.householdAddress.hhsAddressLat = json['hhsAddressLat'];
    header.householdAddress.hhsAddressLong = json['hhsAddressLong'];
    header.householdAddress.hhsPhone.text = json['hhsPhone'];
    //================householdQuestions================
    householdQuestions.hhsDwellingType = json['hhsDwellingType'];
    householdQuestions.hhsIsDwelling = json['hhsIsDwelling'];
    householdQuestions.hhsNumberBedRooms.text = json['hhsNumberBedRooms'];
    householdQuestions.hhsNumberShoppingTrip.text = json['hhsNumberShoppingTrip'];
    householdQuestions.hhsNumberHealthTrip.text = json['hhsNumberHealthTrip'];
    householdQuestions.hhsNumberApartments.text = json['hhsNumberApartments'];
    householdQuestions.hhsNumberFloors.text = json['hhsNumberFloors'];
    householdQuestions.hhsNumberSeparateFamilies =
        json['hhsNumberSeparateFamilies'];
    householdQuestions.hhsNumberAdults = json['hhsNumberAdults'];
    householdQuestions.hhsNumberChildren = json['hhsNumberChildren'];
    householdQuestions.hhsNumberYearsInAddress =
        json['hhsNumberYearsInAddress'];
    // householdQuestions.hhsIsDemolishedAreas = json['hhsIsDemolishedAreas'];
    // householdQuestions.hhsDemolishedAreas = json['hhsDemolishedAreas'];
    //==========hhsPedalCycles(PC)============
    householdQuestions.hhsPedalCycles.totalBikesNumber =
        json['hhsPCTotalBikesNumber'];
    householdQuestions.hhsPedalCycles.adultsBikesNumber =
        json['hhsPCAdultsBikesNumber'];
    householdQuestions.hhsPedalCycles.childrenBikesNumber =
        json['hhsPCChildrenBikesNumber'];
    //======hhsElectricCycles(EC)============
    householdQuestions.hhsElectricCycles.totalBikesNumber =
        json['hhsECTotalBikesNumber'];
    householdQuestions.hhsElectricCycles.adultsBikesNumber =
        json['hhsECAdultsBikesNumber'];
    householdQuestions.hhsElectricCycles.childrenBikesNumber =
        json['hhsECChildrenBikesNumber'];
    //======hhsElectricScooter(ES)============
    householdQuestions.hhsElectricScooter.totalBikesNumber =
        json['hhsESTotalBikesNumber'];
    householdQuestions.hhsElectricScooter.adultsBikesNumber =
        json['hhsESAdultsBikesNumber'];
    householdQuestions.hhsElectricScooter.childrenBikesNumber =
        json['hhsESChildrenBikesNumber'];
    householdQuestions.hhsTotalIncome = json['hhsTotalIncome'];
    vehiclesData = VehiclesModel.fromJson(json['vehiclesData']);

    hhsSeparateFamilies = json['hhsSeparateFamilies']
        .map<SeparateFamilies>(
            (e) => SeparateFamilies.fromJson(e as Map<String, dynamic>))
        .toList();
    vehiclesBodyType = json['vehiclesBodyType']
        .map<VehiclesBodyType>(
            (e) => VehiclesBodyType.fromJson(e as Map<String, dynamic>))
        .toList();
    personData = json['personData']
        .map<PersonModel>(
            (e) => PersonModel.fromJson(e as Map<String, dynamic>))
        .toList();
    tripsList = json['tripsList']
        .map<TripsModel>((e) => TripsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
