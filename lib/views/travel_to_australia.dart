import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:about_australia/components/travel_information_card.dart';
import 'package:about_australia/data.dart';
import 'package:flutter/material.dart';
import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:about_australia/components/about_australia_card.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:about_australia/views/image_popup_page.dart';

class TravelToAustralia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      blurredBackground: true,
      linearGradient: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.5),
          Colors.grey.withOpacity(0.8),
          Colors.grey.withOpacity(0.3),
          Colors.white.withOpacity(0.5),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      ),
      assetPath: "assets/images/backgrounds/travel.jpg",
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 70.0,
                floating: true,
                backgroundColor: Colors.transparent,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return FlexibleSpaceBar.createSettings(
                    currentExtent: 25,
                    maxExtent: 50,
                    child: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      centerTitle: true,
                      title: Stack(
                        children: [
                          Align(
                            child: Container(
                              child: Text("معلومات للسفر الى استراليا",
                                  style: AppTypography.headerMedium),
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        ],
                      ),
                    ),
                  );
                })

                // FlexibleSpaceBar(
                //   centerTitle: true,
                //   title: Text(
                //     "معلومات للسفر الى استراليا",
                //     style: TextStyle(
                //       color: AppColors.neutrals[700],
                //       fontSize: 20.0,
                //     ),
                //   ),
                //   background: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(18),
                //       color: Colors.white.withOpacity(0.5),
                //     ),
                //   ),
                // ),
                )
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(
            right: 24.0,
            left: 24,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: ListView.builder(
                        itemCount: travelCardInformationModel.length,
                        itemBuilder: (context, index) {
                          return TravelInformationCard(
                            cardInformationModel:
                                travelCardInformationModel[index],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
