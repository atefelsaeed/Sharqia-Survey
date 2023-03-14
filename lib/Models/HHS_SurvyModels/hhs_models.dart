import 'package:flutter/cupertino.dart';

class HouseholdAddress {
  String? hhsAddressLat;
  String? hhsAddressLong;
  TextEditingController hhsPhone = TextEditingController();

  HouseholdAddress({
    this.hhsAddressLat,
    this.hhsAddressLong,
    required this.hhsPhone,
  });
}

class HouseholdQuestions {
  String? hhsDwellingType;
  bool ? hhsDwellingFlag;
  String? hhsIsDwelling;
  bool ? hhsIsDwellingTypeFlag;
  TextEditingController? hhsDwellingTypeOther = TextEditingController();
  TextEditingController? hhsIsDwellingOther = TextEditingController();
  TextEditingController hhsNumberBedRooms = TextEditingController();
  // TextEditingController hhsNumberShoppingTrip = TextEditingController();
  // TextEditingController hhsNumberHealthTrip = TextEditingController();
  TextEditingController hhsNumberApartments = TextEditingController();
  TextEditingController hhsNumberFloors = TextEditingController();
  String? hhsNumberSeparateFamilies;
  String? hhsNumberAdults;
  String? hhsNumberChildren = "";
  String? hhsNumberYearsInAddress;
  // bool? hhsIsDemolishedAreas;
  // String? hhsDemolishedAreas;

  BikesType hhsPedalCycles = BikesType("", "", "");

  BikesType hhsElectricCycles = BikesType("", "", "");

  BikesType hhsElectricScooter = BikesType("", "", "");

  String? hhsTotalIncome;

  HouseholdQuestions({
    this.hhsDwellingType,
    this.hhsIsDwelling,
    required this.hhsNumberBedRooms,
    required this.hhsNumberApartments,
    // required this.hhsNumberHealthTrip,
    // required this.hhsNumberShoppingTrip,
    required this.hhsNumberFloors,
    this.hhsNumberSeparateFamilies,
    this.hhsTotalIncome,
    this.hhsDwellingTypeOther,
    this.hhsIsDwellingOther,
    this.hhsNumberYearsInAddress,
    required this.hhsElectricCycles,
    required this.hhsElectricScooter,
    required this.hhsPedalCycles,
    // this.hhsDemolishedAreas,
    // this.hhsIsDemolishedAreas,
    this.hhsNumberChildren,
    this.hhsNumberAdults,
  });
}

class BikesType {
  late String totalBikesNumber;
  late String adultsBikesNumber;
  late String childrenBikesNumber;

  BikesType(
    this.adultsBikesNumber,
    this.totalBikesNumber,
    this.childrenBikesNumber,
  );
}

class SeparateFamilies {
  String? numberChildren;
  String? numberAdults;
  String? totalNumberVehicles;

  SeparateFamilies(
    this.numberAdults,
    this.numberChildren,
    this.totalNumberVehicles,
  );

  SeparateFamilies.fromJson(Map<String, dynamic> json) {
    numberChildren = json['numberChildren'] ?? 0;
    numberAdults = json['numberAdults'] ?? 0;
    totalNumberVehicles = json['totalNumberVehicles'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['numberChildren'] = numberChildren;
    data['numberAdults'] = numberAdults;
    data['totalNumberVehicles'] = totalNumberVehicles;
    return data;
  }
}

class HhsStatic {

  static HouseholdAddress householdAddress = HouseholdAddress(
    hhsAddressLat: "",
    hhsAddressLong: "",
    hhsPhone: TextEditingController(),
  );
  static HouseholdQuestions householdQuestions = HouseholdQuestions(
    hhsPedalCycles: BikesType("", "", ""),
    hhsDwellingTypeOther: TextEditingController(),
    hhsNumberBedRooms: TextEditingController(),
    // hhsNumberShoppingTrip: TextEditingController(),
    // hhsNumberHealthTrip: TextEditingController(),
    hhsNumberApartments: TextEditingController(),
    hhsNumberFloors: TextEditingController(),
    hhsIsDwellingOther: TextEditingController(),
    hhsElectricCycles: BikesType("", "", ""),
    hhsTotalIncome: '',
    hhsNumberSeparateFamilies: '',
    hhsElectricScooter: BikesType("", "", ""),
  );
  static List<SeparateFamilies> houseHold = [];
  static BikesType hhsPedalCycles = BikesType("", "", "");
  static String peopleAdults18 = "";
  static String peopleUnder18 = "";
  static bool hasPasTrip = false;

  static BikesType hhsElectricCycles = BikesType("", "", "");

  static BikesType hhsElectricScooter = BikesType("", "", "");
}
