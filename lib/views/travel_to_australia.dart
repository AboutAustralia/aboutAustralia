import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:about_australia/components/travel_information_card.dart';
import 'package:flutter/material.dart';
import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:about_australia/components/about_australia_card.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:about_australia/views/image_container_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class TravelToAustralia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        blurredBackground: true,
        imageUrl:
            "https://images.unsplash.com/photo-1598600703090-6867b834f070?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24, top: 60),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "معلومات للسفر الى استراليا",
                    style: AppTypography.headerMedium
                        .copyWith(color: AppColors.neutrals[800]),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      TravelInformationCard(
                        title: "اليسبش ي يبش",
                        description:
                            "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدبا يسكينج أليايت...",
                        imageUrl:
                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                      ),
                      TravelInformationCard(
                        title: "اليسبش ي يبش",
                        description:
                            "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدبا يسكينج أليايت...",
                        imageUrl:
                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                      ),
                      TravelInformationCard(
                        title: "اليسبش ي يبش",
                        description:
                            "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدبا يسكينج أليايت...",
                        imageUrl:
                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                      ),
                      TravelInformationCard(
                        title: "اليسبش ي يبش",
                        description:
                            "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدبا يسكينج أليايت...",
                        imageUrl:
                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                      ),
                      TravelInformationCard(
                        title: "اليسبش ي يبش",
                        description:
                            "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدبا يسكينج أليايت...",
                        imageUrl:
                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                      ),
                      TravelInformationCard(
                        title: "اليسبش ي يبش",
                        description:
                            "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدبا يسكينج أليايت...",
                        imageUrl:
                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                      ),
                      TravelInformationCard(
                        title: "اليسبش ي يبش",
                        description:
                            "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدبا يسكينج أليايت...",
                        imageUrl:
                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
