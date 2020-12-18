import 'components/google_maps/background_container.dart';
import 'package:about_australia/components/bottom_navigation_tabs_controller.dart';
import 'package:about_australia/views/about_australia.dart';
import 'package:about_australia/views/onboarding.dart';
import 'package:about_australia/views/travel_to_australia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onboarding/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';

void  main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale("ar")
        // OR Locale('ar', 'AE') OR Other RTL locales,
        ,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: OnBoarding());
  }
}
