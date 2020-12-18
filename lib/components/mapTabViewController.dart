import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:about_australia/views/list_map.dart';
import 'package:about_australia/views/map_page.dart';
import 'package:flutter/material.dart';

class MapTabViewController extends StatefulWidget {
  @override
  _MapTabViewControllerState createState() => _MapTabViewControllerState();
}

class _MapTabViewControllerState extends State<MapTabViewController> {
  List<Widget> containers = [
    MapPage(),
    ListMap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              title: Center(
                child: Text(
                  "أهم المعالم السياحية في أستراليا",
                  style: AppTypography.headerMedium.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500),
                ),
              ),
              backgroundColor: Colors.grey.withOpacity(0.5),
              elevation: 0,
            ),
            body: Column(
              children: [
                TabBar(
                  isScrollable: false,
                  labelColor: AppColors.aquaBlue,
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle: AppTypography.bodyMedium
                      .copyWith(fontWeight: FontWeight.w300),
                  labelStyle: AppTypography.bodyMedium
                      .copyWith(fontWeight: FontWeight.w300),
                  indicatorColor: Colors.red,
                  tabs: [
                    Tab(
                      text: "الخريطة",
                    ),
                    Tab(
                      text: "قائمة",
                    ),
                  ],
                ),
                Expanded(
                    child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: containers,
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
