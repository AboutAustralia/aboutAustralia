import 'package:about_australia/australia_icons_icons.dart';
import 'package:about_australia/components/about_australia_card.dart';
import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:about_australia/components/travel_information_card.dart';
import 'package:about_australia/data.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AboutAustralia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      imageUrl:
          "https://images.unsplash.com/photo-1558517286-6b7b81953cb5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
      linearGradient: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.grey.withOpacity(0.8),
          Colors.grey.withOpacity(0.4),
          Colors.white.withOpacity(0.5),
          Colors.grey.withOpacity(0.3),
          Colors.white.withOpacity(0.8),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      ),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 60.0,
                floating: true,
                backgroundColor: Colors.transparent,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar.createSettings(
                  currentExtent: 49,
                  maxExtent: 70,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    var top = constraints.biggest.height;
                    return FlexibleSpaceBar(
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
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text("عن استراليا",
                                    style: AppTypography.headerMedium.copyWith(
                                        fontSize: 24,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                        ],
                      ),
                    );
                  }),
                )

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
          padding: const EdgeInsets.only(top: 50.0),
          child: Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0, left: 24),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "لحكم الذاتي لولي عهد بريطيُعد الثّوم (الاسم العلمي: .Allium sativum L) أحدَ أنواع النباتات العشبيّة أُحاديّة الفلقة التي تنتمي الى جِنس الثّوم، وفصيلة الثّوميات، وهو نباتٌ بصليّ، ينمو في المُناخ المُعتدل، ويصل طوله الى 1.2 متر، وله عدّة أنواع، ويُعدُّ ثاني أكثر نوعٍ انتشاراً من جنس الثوم\nيّات (الاسم العلمي: Alliaceae) في جميع أنحاء العالم،[١][٢] والطب، ويمتاز باحتة س\nيت8",
                                style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.neutrals[600],
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Card(
                                margin: EdgeInsets.zero,
                                color: Colors.white.withOpacity(0.8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.language,
                                            size: 40,
                                            color: AppColors.aquaBlue,
                                          ),
                                          Text("اللغة",
                                              style: AppTypography.bodyMedium
                                                  .copyWith(
                                                      color: AppColors
                                                          .neutrals[500])),
                                          Text(
                                            "الإنجليزية",
                                            style: AppTypography.bodyNormal
                                                .copyWith(
                                                    color: AppColors
                                                        .neutrals[700]),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          width: 1,
                                          height: 60,
                                          color: AppColors.neutrals[500]
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            AustraliaIcons.canberra,
                                            size: 40,
                                            color: AppColors.aquaBlue,
                                          ),
                                          Text("العاصمة",
                                              style: AppTypography.bodyMedium
                                                  .copyWith(
                                                      color: AppColors
                                                          .neutrals[500])),
                                          Text(
                                            "5.34",
                                            style: AppTypography.bodyNormal
                                                .copyWith(
                                                    color: AppColors
                                                        .neutrals[700]),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 1,
                                        height: 60,
                                        color: AppColors.neutrals[500]
                                            .withOpacity(0.6),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.people_outline,
                                            color: AppColors.aquaBlue,
                                            size: 40,
                                          ),
                                          Text("اللغة",
                                              style: AppTypography.bodyMedium
                                                  .copyWith(
                                                      color: AppColors
                                                          .neutrals[500])),
                                          Text(
                                            "الانجليزية",
                                            style: AppTypography.bodyNormal
                                                .copyWith(
                                                    color: AppColors
                                                        .neutrals[700]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "معلومات عن أستراليا",
                                  style: AppTypography.bodyNormal.copyWith(
                                      color: AppColors.neutrals[800],
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        aboutAustraliaInformationModel.length,
                                    itemBuilder: (context, index) {
                                      return AboutAustraliaCard(
                                        cardInformationModel:
                                            aboutAustraliaInformationModel[
                                                index],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
