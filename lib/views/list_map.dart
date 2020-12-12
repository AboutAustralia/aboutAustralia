import 'file:///D:/Desktop/flutterProjects/about_australia/lib/components/google_maps/background_container.dart';
import 'file:///D:/Desktop/flutterProjects/about_australia/lib/components/google_maps/top_place_box.dart';
import 'package:about_australia/views/map_page.dart';
import 'package:flutter/material.dart';

class ListMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TopPlaceBox(
            image:
                "https://ak-d.tripcdn.com/images/10060n000000e4c6nEB47.jpg?proc=source%2Ftrip",
            lat: -33.85657946005523,
            long: 151.21523232445094,
            locationName: "دار أوبرا سيدني",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TopPlaceBox(
            image:
                "https://ak-d.tripcdn.com/images/10060n000000e4c6nEB47.jpg?proc=source%2Ftrip",
            lat: -33.85657946005523,
            long: 151.21523232445094,
            locationName: "دار أوبرا سيدني",
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TopPlaceBox(
            image:
                "https://ak-d.tripcdn.com/images/10060n000000e4c6nEB47.jpg?proc=source%2Ftrip",
            lat: -33.85657946005523,
            long: 151.21523232445094,
            locationName: "دار أوبرا سيدني",
          ),
        ),
      ],
    );
  }
}
