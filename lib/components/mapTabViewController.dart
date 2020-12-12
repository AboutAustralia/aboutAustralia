import 'package:about_australia/views/list_map.dart';
import 'package:about_australia/views/map_page.dart';
import 'package:flutter/material.dart';

class MapTabViewController extends StatefulWidget {
  @override
  _MapTabViewControllerState createState() => _MapTabViewControllerState();
}

class _MapTabViewControllerState extends State<MapTabViewController> {
  List<Widget> containers = [ListMap(), MapPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "List",
                  ),
                  Tab(
                    text: "Map",
                  )
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: containers,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
