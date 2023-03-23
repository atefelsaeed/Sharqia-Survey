import 'package:flutter/cupertino.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';

class HHSDisposeControllers {
  EditingController editingController = EditingController();

  void dispose() {
    editingController.peopleUnder18.dispose();
    editingController.peopleAdults18.dispose();
    editingController.yes.dispose();
    //
    editingController.editingController3Q81.peopleAdults18.dispose();
    editingController.editingController3Q81.peopleUnder18.dispose();
    editingController.editingController3Q81.totalNumber.dispose();
    //
    editingController.editingController3Q82.peopleAdults18.dispose();
    editingController.editingController3Q82.peopleUnder18.dispose();
    editingController.editingController3Q82.totalNumber.dispose();
    //
    editingController.editingController3Q83.peopleAdults18.dispose();
    editingController.editingController3Q83.peopleUnder18.dispose();
    editingController.editingController3Q83.totalNumber.dispose();
    //
    int q6peopleAdults18Length = editingController.q6peopleAdults18.length;
    if (q6peopleAdults18Length != 0) {
      for (int i = 0; i < q6peopleAdults18Length; i++) {
        editingController.q6peopleAdults18[i].dispose();
      }
    }
    //
    int q6totalNumberOfVecLength = editingController.q6totalNumberOfVec.length;
    if (q6totalNumberOfVecLength != 0) {
      for (int i = 0; i < q6peopleAdults18Length; i++) {
        editingController.q6totalNumberOfVec[i].dispose();
      }
    }
    //
    int q6peopleUnder18Length = editingController.q6peopleUnder18.length;
    if (q6peopleUnder18Length != 0) {
      for (int i = 0; i < q6peopleAdults18Length; i++) {
        editingController.q6peopleUnder18[i].dispose();
      }
    }
    debugPrint('Dispose HHS Controllers!');
  }
}
