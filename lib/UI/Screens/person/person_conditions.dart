import 'package:sharqia_household_survey/Data/HouseholdPart1/PersonData/person_data.dart';

import '../../../Data/HouseholdPart1/PersonData/person_model_list.dart';

class PersonConditions {
  ///check-Occupation-Sector-Other
  bool checkOccupationSectorOther(int i) {
    var occupationSectorKey = PersonData.occupationSector.keys.first;
    var occupationSector =
        PersonModelList.personModelList[i].occupationModel!.occupationSector;
    PersonModelList.personModelList[i].occupationModel!
        .occupationSectorController.text = occupationSector!;
    if (((occupationSector == " حدد أخرى") ||
        (occupationSector.isNotEmpty &&
            !(PersonData.occupationSector[occupationSectorKey]!
                .any((element) => element == occupationSector))))) {
      return true;
    } else {
      return false;
    }
  }

  ///check-Best-Workspace-Location-Other
  bool checkBestWorkspaceLocationOther(int i) {
    var bestWorkspaceLocation = PersonModelList
        .personModelList[i].occupationModel!.bestWorkspaceLocation;

    if (((bestWorkspaceLocation == 'أخرى') ||
        (bestWorkspaceLocation!.isNotEmpty &&
            !(PersonData.workplace[PersonData.workplace.keys.first]!
                .any((element) => element == bestWorkspaceLocation))))) {
      return true;
    } else {
      return false;
    }
  }

  ///check-Driving-Licence-Type-Other
  bool checkDrivingLicenceTypeOther(int i) {
    var drivingLicenceType =
        PersonModelList.personModelList[i].personalQuestion!.drivingLicenceType;
    if (((drivingLicenceType == "آخر") ||
        (drivingLicenceType!.isNotEmpty &&
            !(PersonData.licence[PersonData.licence.keys.first]!
                .any((element) => element == drivingLicenceType))))) {
      return true;
    } else {
      return false;
    }
  }

  ///check-Have-Disability-Transport-Mobility-Other
  bool checkHaveDisabilityTransportMobilityOther(int i) {
    var haveDisabilityTransportMobility = PersonModelList
        .personModelList[i].personalQuestion!.haveDisabilityTransportMobility;

    if (((haveDisabilityTransportMobility == 'أخرى .. حدد') ||
        (haveDisabilityTransportMobility!.isNotEmpty &&
            !(PersonData
                .transporterMoblity[PersonData.transporterMoblity.keys.first]!
                .any((element) =>
                    element == haveDisabilityTransportMobility))))) {
      return true;
    } else {
      return false;
    }
  }
}
