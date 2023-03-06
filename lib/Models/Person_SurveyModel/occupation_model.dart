import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/PersonData/person_data.dart';

class OccupationModel {
  String? occupationSector;
  TextEditingController occupationSectorController = TextEditingController();
  TextEditingController bestWorkspaceLocationController = TextEditingController();
  String? isEmployee = "";
  String? occupationLevelSector;
  String? bestWorkspaceLocation;
  int? commuteWorkDays;
  int? bikeWorkDays;
  TextEditingController address = TextEditingController();
  TextEditingController geoCodes = TextEditingController();
  bool? isWorkFromHome;
  int? numberWorkFromHome;
  TextEditingController startingWoke = TextEditingController();
  TextEditingController endingWoke = TextEditingController();
  String? flexibleWorkingHours;
  TextEditingController earliestTimeStartingWork = TextEditingController();
  TextEditingController earliestTimeFinishingWork = TextEditingController();
  TextEditingController mainOccupationAddress = TextEditingController();

  OccupationModel({
    required this.earliestTimeFinishingWork,
    required this.endingWoke,
    required this.occupationSectorController,
    required this.bestWorkspaceLocationController,
    required this.startingWoke,
    required this.address,
    required this.geoCodes,
    required this.mainOccupationAddress,
    this.bestWorkspaceLocation,
    this.bikeWorkDays,
    this.commuteWorkDays,
    required this.earliestTimeStartingWork,
    this.flexibleWorkingHours,
    this.isEmployee,
    this.isWorkFromHome,
    this.numberWorkFromHome,
    this.occupationLevelSector,
    this.occupationSector,
  });

  OccupationModel.fromJson(Map<String, dynamic> json) {
    occupationSector = json['occupationSector'] ??
        PersonData.occupationSector["what is the Occupation Sector"][0];
    isEmployee = json['isEmployee'] ?? "";
    occupationLevelSector = json['occupationLevelSector'] ?? "";
    bestWorkspaceLocation = json['bestWorkspaceLocation'] ??
        PersonData.workplace["what best describe your workplace location(s)?"]
            [0];
    commuteWorkDays = json['commuteWorkDays'] ?? 0;
    bikeWorkDays = json['bikeWorkDays'] ?? 0;
    address.text = json['address'] ?? '';
    geoCodes.text = json['geoCodes'] ?? '';
    isWorkFromHome = json['isWorkFromHome'] ?? false;
    numberWorkFromHome = json['numberWorkFromHome'] ?? 0;
    startingWoke.text = json['startingWoke'] ?? '';
    endingWoke.text = json['endingWoke'] ?? '';
    flexibleWorkingHours = json['flexibleWorkingHours'] ?? '';
    earliestTimeStartingWork.text = json['earliestTimeStartingWork'] ?? '';
    earliestTimeFinishingWork.text = json['earliestTimeFinishingWork'] ?? '';
    mainOccupationAddress.text = json['mainOccupationAddress'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['occupationSector'] = occupationSector ?? "";
    data['isEmployee'] = isEmployee ?? "";
    data['occupationLevelSector'] = occupationLevelSector ?? "";
    data['bestWorkspaceLocation'] = bestWorkspaceLocation ?? "";
    data['commuteWorkDays'] = commuteWorkDays ?? 0;
    data['bikeWorkDays'] = bikeWorkDays ?? 0;
    data['address'] = address.text;
    data['geoCodes'] = geoCodes.text;
    data['isWorkFromHome'] = isWorkFromHome ?? false;
    data['numberWorkFromHome'] = numberWorkFromHome ?? 0;
    data['startingWoke'] = startingWoke.text;
    data['endingWoke'] = endingWoke.text;
    data['flexibleWorkingHours'] = flexibleWorkingHours ?? '';
    data['earliestTimeStartingWork'] = earliestTimeStartingWork.text;
    data['earliestTimeFinishingWork'] = earliestTimeFinishingWork.text;
    data['mainOccupationAddress'] = mainOccupationAddress.text;
    return data;
  }
}
