import 'file:///D:/Desktop/flutterProjects/about_australia/lib/components/google_maps/background_container.dart';
import 'file:///D:/Desktop/flutterProjects/about_australia/lib/components/google_maps/top_place_box.dart';
import 'package:about_australia/components/travel_information_card.dart';
import 'package:about_australia/data.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/views/map_page.dart';
import 'package:flutter/material.dart';

class ListMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.only(right: 24.0, left: 24, top: 32),
        child: ListView.builder(
            itemCount: mapsCardsInformation.length,
            itemBuilder: (context, index) {
              return TravelInformationCard(
                cardInformationModel: mapsCardsInformation[index],
                descriptionColor: AppColors.neutrals[700],
              );
            }),
      ),
    );
  }
}
