import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/Models/survey.dart';
import 'package:sharqia_household_survey/Providers/surveys.dart';
import 'package:sharqia_household_survey/Providers/user_surveys.dart';
import 'package:sharqia_household_survey/Resources/strings.dart';
import 'package:sharqia_household_survey/UI/Screens/UserSurveys/userSurveys.dart';

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
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          setState(() {
            debugPrint('connectivity');

            Auth auth = Provider.of<Auth>(context, listen: false);
            userSurveysProvider.fetchUserSurveysStatus(auth.user!.id);

            userSurveysProvider.multiSync();
          });
        }
        // Got a new connectivity status!
      },
    );
    userSurveysProvider.multiSync();
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

    FirebaseMessaging.onMessage.listen((e) async {
      UserSurveysProvider userSurveysProvider =
          Provider.of<UserSurveysProvider>(context, listen: false);
      userSurveysProvider.multiSync();
      debugPrint('sync message');
      Fluttertoast.showToast(
        msg: "Syncing",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // _messageHandler(e);
    });

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
                        'مرحباً ${auth.user!.name}',
                        style: TextStyle(
                          color: ColorManager.wight,
                          fontSize: width(context) * .065,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserSurveysScreen(id: auth.user!.id),
                            ),
                          );
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
                )));
  }
}
