import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharqia_household_survey/UI/Screens/Settings/settings_screen.dart';

import '../../../Providers/auth.dart';
import '../../../Providers/surveys.dart';
import '../../../Resources/colors.dart';
import '../../Widgets/connection_error.dart';
import 'chooseSurveyBody.dart';

class ChooseSurveysScreen extends StatefulWidget {
  const ChooseSurveysScreen({Key? key}) : super(key: key);

  // static const routeName = "surveys-screen";
  static const routeName = "/";

  @override
  State<ChooseSurveysScreen> createState() => _ChooseSurveysScreenState();
}

class _ChooseSurveysScreenState extends State<ChooseSurveysScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        actions: [
          IconButton(
            onPressed: () async {
              // Provider.of<SurveysProvider>(context, listen: false).syncAll();
              // Provider.of<UserSurveysProvider>(context,listen: false).multiSync();
              setState(() {});
            },
            icon: const Icon(Icons.sync),
          ),
          const SizedBox(width: 30),
          IconButton(
            onPressed: Provider.of<Auth>(context).logout,
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 30),
          IconButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
            icon: const Icon(Icons.settings_suggest_rounded),
          ),
        ],
        leading: Container(),
      ),
      body: FutureBuilder(
        future: Provider.of<SurveysProvider>(context, listen: false).fetch(),
        builder: (fctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.all(40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return dataSnapshot.hasError
                ? Padding(
                    padding: const EdgeInsets.all(50),
                    child: ConnectionError(() => setState(() => {})),
                  )
                : dataSnapshot.hasData
                    ? const ChooseSurveyBody()
                    : const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            'لا يوجد استبيانات',
                          ),
                        ),
                      );
          }
        },
      ),
    );
  }
}
