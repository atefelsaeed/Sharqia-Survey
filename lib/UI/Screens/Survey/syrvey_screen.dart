import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/hhs_Q1.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/hhs_Q10.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/hhs_Q2.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/Components/house_hold_address.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/components/action_button.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/components/house_hold_member.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/components/qh9.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/editing_controller.dart';

import '../../../Models/user_serveys_model.dart';
import '../../Widgets/exit_screen.dart';
import '../vechicles/components/nearest_transporter.dart';
import 'Components/hhs_Q5.dart';
import 'actions/action_survey_screen.dart';
import 'components/hhs_Q4.dart';
import 'components/hhs_Q81.dart';
import 'components/hhs_Q82.dart';
import 'components/hhs_Q83.dart';
import 'components/hhs_q6.dart';
import 'components/hhs_qh4.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen(
      {super.key, required this.id, required this.itemSurveyModel});

  final UserSurveysModelData itemSurveyModel;
  final String id;

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
  }

  @override
  Widget build(BuildContext context) {
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
                            q6peopleUnder18: editingController.q6peopleUnder18,
                            q6totalNumberOfVec:
                                editingController.q6totalNumberOfVec,
                          ),
                          AppSize.spaceHeight2(context),

                          // ====Question 5====
                          HHSQ5(
                            peopleAdults18: editingController.peopleAdults18,
                            peopleUnder18: editingController.peopleUnder18,
                          ),
                          AppSize.spaceHeight3(context),
                          // ====Question 6====
                          const HHsQ6(),
                          // ====Question 7====
                          // HHSQH62(editingController),
                          // DemolishedArea(editingController),
                          AppSize.spaceHeight5(context),
                          Q81(
                              editingController3:
                                  editingController.editingController3Q81),
                          AppSize.spaceHeight3(context),
                          Q82(
                              editingController3:
                                  editingController.editingController3Q82),
                          AppSize.spaceHeight3(context),
                          Q83(
                              editingController3:
                                  editingController.editingController3Q83),
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
                              id: widget.id),
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
