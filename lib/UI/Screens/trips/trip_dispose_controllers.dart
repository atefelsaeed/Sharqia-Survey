import 'package:sharqia_household_survey/Data/HouseholdPart1/TripsData/trip_mode_list.dart';

class TripDisposeControllers {
  static dispose() {
    if (TripModeList.tripModeList.isNotEmpty) {
      for (int i = 0; i < TripModeList.tripModeList.length; i++) {
        ///
        TripModeList.tripModeList[i].startBeginningModel?.block.dispose();
        TripModeList.tripModeList[i].startBeginningModel?.area.dispose();
        TripModeList.tripModeList[i].startBeginningModel?.streetName.dispose();
        TripModeList.tripModeList[i].startBeginningModel?.nearestLandMark
            .dispose();
        TripModeList.tripModeList[i].startBeginningModel?.streetNumber
            .dispose();

        ///
        TripModeList.tripModeList[i].endingAddress?.block.dispose();
        TripModeList.tripModeList[i].endingAddress?.area.dispose();
        TripModeList.tripModeList[i].endingAddress?.streetName.dispose();
        TripModeList.tripModeList[i].endingAddress?.nearestLandMark.dispose();
        TripModeList.tripModeList[i].endingAddress?.streetNumber.dispose();

        ///
        TripModeList.tripModeList[i].taxiTravelTypeEditingControl.dispose();
        TripModeList.tripModeList[i].otherWhereDidYouParkEditingControl
            .dispose();
        TripModeList.tripModeList[i].departureTime.dispose();

        ///
        TripModeList.tripModeList[i].arrivalDepartTime.arriveDestinationTime
            .dispose();
        TripModeList.tripModeList[i].arrivalDepartTime.departTime.dispose();

        ///
        TripModeList.tripModeList[i].travelTypeModel.otherWhereDidYouParking
            .dispose();
        TripModeList.tripModeList[i].travelTypeModel.taxiTravelTypeOther
            .dispose();
        TripModeList.tripModeList[i].travelTypeModel.taxiFare.dispose();
        TripModeList.tripModeList[i].travelTypeModel.ticketSub.dispose();

        ///
        TripModeList.tripModeList[i].travelAloneHouseHold?.adultsNumber
            .dispose();
        TripModeList.tripModeList[i].travelAloneHouseHold?.childrenNumber
            .dispose();

        ///
        TripModeList.tripModeList[i].travelWithOtherModel?.adultsNumber
            .dispose();
        TripModeList.tripModeList[i].travelWithOtherModel?.childrenNumber
            .dispose();
      }
    }
  }
}
