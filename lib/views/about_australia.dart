import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:about_australia/components/about_australia_card.dart';
import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:about_australia/views/image_container_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AboutAustralia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        blurredBackground: true,
        imageUrl:
            "https://images.unsplash.com/photo-1598600703090-6867b834f070?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80",
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24, top: 60),
          child: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: ListView(
              shrinkWrap: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "استراليا",
                              style: AppTypography.header
                                  .copyWith(color: AppColors.neutrals[800]),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "أستراليا (بالإنجليزية: Australia)‏، أو رسميًّا كومنولث أستراليا (بالإنجليزية: Commonwealth of Australia)‏، دولة تقع في نصف الكرة الجنوبي جنوب شرق آسيا وغرب المحيط الهادي، عاصمتها كانبرا. ويحيط القارة من الشمال بحر تيمور وبحر أرفورا ومضيق تورز ومن الشرق بحر كورال وبحر تسمان ومن الجنوب ممر باس، ويحيط بها من الجنوب والغرب المحيط الهندي.",
                            style: AppTypography.bodySmall.copyWith(
                                color: AppColors.neutrals[600],
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.question_answer_outlined,
                                    size: 50,
                                    color: AppColors.aquaBlue,
                                  ),
                                  Text("اللغة",
                                      style: AppTypography.bodyMedium.copyWith(
                                          color:
                                              Colors.white.withOpacity(0.9))),
                                  Text(
                                    "123,141",
                                    style: AppTypography.bodyNormal.copyWith(
                                        color: AppColors.neutrals[700]),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.language,
                                    size: 50,
                                    color: AppColors.aquaBlue,
                                  ),
                                  Text("اللغة",
                                      style: AppTypography.bodyMedium.copyWith(
                                          color:
                                              Colors.white.withOpacity(0.9))),
                                  Text(
                                    "5.34",
                                    style: AppTypography.bodyNormal.copyWith(
                                        color: AppColors.neutrals[700]),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.people_outline,
                                    color: AppColors.aquaBlue,
                                    size: 50,
                                  ),
                                  Text("اللغة",
                                      style: AppTypography.bodyMedium.copyWith(
                                          color:
                                              Colors.white.withOpacity(0.9))),
                                  Text(
                                    "الانجليزية",
                                    style: AppTypography.bodyNormal.copyWith(
                                        color: AppColors.neutrals[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "معلومات عن أستراليا",
                                style: AppTypography.bodyNormal.copyWith(
                                    color: AppColors.neutrals[700],
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 260,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    AboutAustraliaCard(
                                      title: "الرياضة في أستراليا",
                                      imageUrl:
                                          "https://images.unsplash.com/photo-1532484364607-fc84a124a237?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                                    ),
                                    AboutAustraliaCard(
                                        title: "الرياضة في أستراليا",
                                        imageUrl:
                                            "https://images.unsplash.com/photo-1494233892892-84542a694e72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80"),
                                    AboutAustraliaCard(
                                        title: "الرياضة في أستراليا",
                                        imageUrl:
                                            "https://images.unsplash.com/photo-1539734710025-9ebbe24f22f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
