import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sharqia_household_survey/Models/HHS_SurvyModels/survey_hhs.dart';
import 'package:sharqia_household_survey/Providers/survey_hhs.dart';
import 'package:sharqia_household_survey/UI/Screens/SplashScreen/splashScreen.dart';
import 'package:sharqia_household_survey/UI/Screens/Survey/actions/action_survey_screen.dart';
import 'package:sharqia_household_survey/UI/Screens/person/reset_person.dart';
import 'package:sharqia_household_survey/UI/Screens/trips/provider/trip_provider.dart';

import 'Providers/auth.dart';
import 'Providers/surveys.dart';
import 'Providers/user_surveys.dart';
import 'Resources/colors.dart';
import 'UI/Screens/Login/login_screen.dart';
import 'UI/Screens/Splash/splash_screen.dart';
import 'UI/Screens/vechicles/provider/vechiels_provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    debugPrint("something");
    Intl.defaultLocale = 'ar_EG';
    HttpOverrides.global = MyHttpOverrides();
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://c333eada722f449eadcf891288f881c6@o4504843865030656.ingest.sentry.io/4504843868700672';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(const MyApp()),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   // WidgetsBinding.instance.addObserver(
  //   //
  //   //   LifecycleEventHandler(
  //   //     resumeCallBack: () async => setState(
  //   //       () {
  //   //         debugPrint("returned to app");
  //   //       },
  //   //     ),
  //   //   ),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SurveyPTProvider(SurveyPT())),
        ChangeNotifierProvider(
          create: (_) => ActionSurveyProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PersonProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TripProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => VecProvider(),
        ),
        ChangeNotifierProvider<Auth>(create: (ctx) => Auth()),
        ChangeNotifierProvider<UserSurveysProvider>(
            create: (ctx) => UserSurveysProvider()),
        ChangeNotifierProxyProvider<Auth, SurveysProvider>(
          create: (ctx) => SurveysProvider(),
          update: (ctx, auth, old) =>
              SurveysProvider.auth(auth.authHeader, auth.uid, old!),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sharqia Household Survey',
        navigatorKey: navigatorKey,
        theme: ThemeData(
            primaryColor: ColorManager.primaryColor, fontFamily: 'Somar'),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("ar"),
        routes: {
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
        },
        home: const SplashView(),
      ),
    );
  }
}
