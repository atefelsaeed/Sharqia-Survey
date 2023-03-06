import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/hhs_Q1.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/hhs_Q10.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/hhs_Q2.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/house_hold_address.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/components/action_button.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/components/qh9.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';

import '../../../Data/HouseholdPart1/HHSData/questions_data.dart';
import '../../../Data/HouseholdPart1/VechelisData/vechelis_data.dart';
import '../../../Models/user_serveys_model.dart';
import '../../../Providers/user_surveys.dart';
import '../../Widgets/exit_screen.dart';
import '../person/reset_person.dart';
import '../trips/provider/trip_provider.dart';
import '../vechicles/components/nearest_transporter.dart';
import '../vechicles/provider/vechiels_provider.dart';
import 'Components/hhs_Q5.dart';
import 'Components/hhs_header.dart';
import 'actions/action_survey_screen.dart';
import 'components/hhs_Q4.dart';
import 'components/hhs_Q81.dart';
import 'components/hhs_Q82.dart';
import 'components/hhs_Q83.dart';
import 'components/hhs_q6.dart';
import 'components/hhs_qh4.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({
    super.key,
    required this.itemSurveyModel,
  });

  final UserSurveysModelData itemSurveyModel;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  EditingController editingController = EditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editingController.editingController3Q83.totalNumber.text = '';
    editingController.editingController3Q83.peopleUnder18.text = '';
    editingController.editingController3Q83.peopleAdults18.text = '';

    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    VehiclesData.q3VecData = {
      " How far is the nearest public transport bus stop from your home by walk (in minutes) ?":
          [
        {"value": '<5 دقائق سيرا على الأقدام', "isChick": false},
        {"value": '6-10 دقائق سيرا على الأقدام', "isChick": false},
        {"value": '11 - 15 دقيقة مشي', "isChick": false},
        {"value": ' أكثر من 15 دقيقة', "isChick": false},
        {"value": 'لا اعرف', "isChick": false},
        {"value": 'لا يوجد محطة', "isChick": false},
      ],
      "index": 0
    };
    QuestionsData.qh7 = {
      "?How many years have you/your family lived at this particular address": [
        {"value": 'أقل من 1.5 سنة', "isChick": false}, //
        {"value": '1.5 - 3 سنوات', "isChick": false},
        {"value": '3 - 5 سنوات', "isChick": false},
        {"value": '5 - 10 سنوات', "isChick": false},
        {"value": '+10 سنوات', "isChick": false},
      ],
      "index": 0
    };
    QuestionsData.qh4 = {
      "? How many separate families live at this address": [
        {"value": '1', "isChick": false},
        {"value": '2', "isChick": false},
        {"value": '3', "isChick": false},
        {"value": '4', "isChick": false},
        {"value": '5', "isChick": false},
        {"value": '6', "isChick": false},
        {"value": '7', "isChick": false},
        {"value": '8', "isChick": false},
        {"value": '9', "isChick": false},
        {"value": '10', "isChick": false},
      ],
      "subTitle":
          " A separate family is defined as who share the kitchen expenses and meals",
      "index": 0
    };
    QuestionsData.qh3 = {
      "?How many bedrooms are there in the accommodation you live in": [
        {"value": '1', "isChick": false},
        {"value": '2', "isChick": false},
        {"value": '3', "isChick": false},
        {"value": '4', "isChick": false},
        {"value": '5', "isChick": false},
        {"value": '6', "isChick": false},
        {"value": '7', "isChick": false},
        {"value": '8', "isChick": false},
        {"value": '9', "isChick": false},
        {"value": '10', "isChick": false},
        {"value": '11', "isChick": false},
        {"value": '>12', "isChick": false},
      ],
      "subTitle":
          " A separate family is defined as who share the kitchen expenses and meals",
      "index": 0
    };
    QuestionsData.qh7_2 = {
      'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
          [
        {"value": 'نعم', "isChick": false},
        {"value": 'لا', "isChick": false},
      ],
      "index": 0
    };

    ///reset-values-for-editing
    final validationService =
        Provider.of<ActionSurveyProvider>(context, listen: false);
    final vecValidationService =
        Provider.of<VecProvider>(context, listen: false);
    final tripValidationService =
        Provider.of<TripProvider>(context, listen: false);
    final personValidationService =
        Provider.of<PersonProvider>(context, listen: false);
    //check-if-edit-or-new-survey
    if ((widget.itemSurveyModel.status == 'edit')) {
      print('first edit');
      int id = widget.itemSurveyModel.id!;
      validationService.resetHHSValues(editingController, context, id);
      vecValidationService.resetVechValues(context);
      personValidationService.getAllPeronUpdated(context);
      tripValidationService.getAllTripUpdated(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () {
        return OnExitScreen.onWillPop(context);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _key,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Consumer<ActionSurveyProvider>(
                        builder: (context, provider, child) {
                      return Column(
                        children: [
                          const HHSHeader(),
                          userSurveysProvider.loading
                              ? SizedBox(
                                  height: height(context) * .5,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: ColorManager.primaryColor,
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    // ===== HouseHoldAddress ===
                                    HouseHoldAddress(
                                      itemSurveyModel: widget.itemSurveyModel,
                                    ),
                                    AppSize.spaceHeight3(context),
                                    const HouseHoldMember(),
                                    // ====Question 1====
                                    const HHSQ1(),
                                    // ====Question 2====
                                    const HHSQ2(),
                                    // ====Question 3====
                                    AppSize.spaceHeight3(context),
                                    HHsQh4(
                                      editingController: editingController,
                                    ),
                                    // ====Question 4====
                                    HHSQ4(
                                      q6peopleAdults18:
                                          editingController.q6peopleAdults18,
                                      q6peopleUnder18:
                                          editingController.q6peopleUnder18,
                                      q6totalNumberOfVec:
                                          editingController.q6totalNumberOfVec,
                                    ),
                                    AppSize.spaceHeight2(context),

                                    // ====Question 5====
                                    HHSQ5(
                                      peopleAdults18:
                                          editingController.peopleAdults18,
                                      peopleUnder18:
                                          editingController.peopleUnder18,
                                    ),
                                    AppSize.spaceHeight3(context),
                                    // ====Question 6====
                                    const HHsQ6(),
                                    // ====Question 7====
                                    // HHSQH62(editingController),
                                    // DemolishedArea(editingController),
                                    AppSize.spaceHeight5(context),
                                    Q81(
                                        editingController3: editingController
                                            .editingController3Q81),
                                    AppSize.spaceHeight3(context),
                                    Q82(
                                        editingController3: editingController
                                            .editingController3Q82),
                                    AppSize.spaceHeight3(context),
                                    Q83(
                                        editingController3: editingController
                                            .editingController3Q83),
                                    AppSize.spaceHeight2(context),
                                     QH9(),
                                    AppSize.spaceHeight3(context),
                                    //========HHSQ9=================
                                    const NearestTransporter(),
                                    //========HHSQ10=================
                                    const HHSQ10(),
                                    ActionButton(
                                      editingController: editingController,
                                      keyVal: _key,
                                      id: widget.itemSurveyModel.id!.toString(),
                                    ),
                                  ],
                                )
                        ],
                      );
                    })),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
