import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Models/survey.dart';
import 'package:sharqia_household_survey/Providers/surveys.dart';
import 'package:sharqia_household_survey/Providers/user_surveys.dart';
import 'package:sharqia_household_survey/Resources/strings.dart';
import 'package:sharqia_household_survey/UI/Screens/UserSurveys/user_surveys.dart';

import '../../../Providers/auth.dart';
import '../../../Resources/assets_manager.dart';
import '../../../Resources/colors.dart';
import '../../../Resources/sizes.dart';
import 'itemHomeSurvey.dart';

class ChooseSurveyBody extends StatefulWidget {
  const ChooseSurveyBody({Key? key}) : super(key: key);

  @override
  State<ChooseSurveyBody> createState() => _ChooseSurveyBodyState();
}

class _ChooseSurveyBodyState extends State<ChooseSurveyBody> {
  late final subscription;

  @override
  initState() {
    super.initState();
    UserSurveysProvider userSurveysProvider =
        Provider.of<UserSurveysProvider>(context, listen: false);
    Auth auth = Provider.of<Auth>(context, listen: false);

    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {

          if (auth.user == null) {
            await auth.tryAutoLogin();
            await userSurveysProvider
                .fetchUserSurveysStatus(auth.user?.id ?? 1);
          } else {
            await userSurveysProvider
                .fetchUserSurveysStatus(auth.user?.id ?? 1);
          }

          if (userSurveysProvider.userSurveyStatus == "not filled") {
            await userSurveysProvider.multiSync();
          }
          if (mounted) {
            setState(() {
              debugPrint('connectivity');
            });
          }
        }
        // Got a new connectivity status!
      },
    );
    if (userSurveysProvider.userSurveyStatus == "not filled") {
      userSurveysProvider.multiSync();
    }
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SurveysProvider p = Provider.of<SurveysProvider>(context);
    Auth auth = Provider.of<Auth>(context, listen: false);

    List<Survey> surveyList = p.surveys;
    debugPrint("Survey List length: ${surveyList.length}");
    return Consumer<UserSurveysProvider>(
      builder: (context, model, _) => model.iSSyncing == true
          ? Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            )
          : Container(
              height: height(context),
              width: width(context),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.homeBackground),
                    fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSize.spaceHeight5(context),
                    Text(
                      'مرحباً ${auth.user?.name ?? ''}',
                      style: TextStyle(
                        color: ColorManager.wight,
                        fontSize: width(context) * .065,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (auth.user == null) {
                          await auth.tryAutoLogin();
                        }
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserSurveysScreen(id: auth.user?.id ?? 1),
                            ),
                          );
                        }
                        // }
                      },
                      child: ItemHomeSurvey(count: surveyList.length),
                    ),
                    AppSize.spaceHeight5(context),
                    Text(
                      'إصدار التطبيق  ${AppStrings.appVersion}',
                      style: TextStyle(
                        color: ColorManager.wight,
                        fontSize: width(context) * .035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
