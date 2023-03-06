import 'package:sharqia_household_survey/Data/HouseholdPart1/empty_data/empty_person.dart';
import 'package:sharqia_household_survey/Data/HouseholdPart1/empty_data/empty_trips.dart';

import 'HHSData/questions_data.dart';
import 'VechelisData/vechelis_data.dart';
import 'empty_data/empty_hhs.dart';
import 'empty_data/empty_vechels.dart';

class HHSEmptyData {
  static emptyData() {
    EmptyPerson.emptyPerson();
    EmptyHHS.emptyHSS();
    EmptyVehicles.emptyVehicles();
    EmptyTrips.emptyTrips();
    //============HHS===========>

    QuestionsData.qh3[QuestionsData.qh3.keys.first]!
        .toList()[QuestionsData.qh3["index"]]["isChick"] = false;
    QuestionsData.qh4[QuestionsData.qh4.keys.first]!
        .toList()[QuestionsData.qh4["index"]]["isChick"] = false;
    QuestionsData.qh7[QuestionsData.qh7.keys.first]!
        .toList()[QuestionsData.qh7["index"]]["isChick"] = false;
    QuestionsData.qh7_2[QuestionsData.qh7_2.keys.first]!
        .toList()[QuestionsData.qh7_2["index"]]["isChick"] = false;
    QuestionsData.hhsHavePastTrip[QuestionsData.hhsHavePastTrip.keys.first]!
        .toList()[QuestionsData.hhsHavePastTrip["index"]]["isChick"] = false;
    //=============Vehicles===================
    VehiclesData.q3VecData[VehiclesData.q3VecData.keys.first]!
        .toList()[VehiclesData.q3VecData["index"]]["isChick"] = false;

    //================Personal========================================
    // PersonData.nationality[PersonData.nationality.keys.first]!
    //     .toList()[PersonData.nationality["index"]]["isChick"] = false;

    //================Trip========================================
    // TripData.tripReason[TripData.tripReason.keys.first]!
    //     .toList()[TripData.tripReason["chosenIndex"]]["isChick"] = false;
    // TripData.purposeOfBeingThere[TripData.purposeOfBeingThere.keys.first]!
    //     .toList()[TripData.purposeOfBeingThere["chosenIndex"]]["isChick"] = false;
    // TripData.travelWithOther[TripData.travelWithOther.keys.first]!
    //     .toList()[TripData.travelWithOther["index"]]["isChick"] = false;
  }
}
