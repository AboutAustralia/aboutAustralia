import 'components/google_maps/background_container.dart';
import 'package:about_australia/components/bottom_navigation_tabs_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavigationBarController(
        currentIndex: 1,
      ),
    );
  }
}
