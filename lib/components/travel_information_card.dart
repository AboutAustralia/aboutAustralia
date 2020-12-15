import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:about_australia/views/image_container_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TravelInformationCard extends StatelessWidget {
  const TravelInformationCard({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    this.onPress,
  });

  final String imageUrl;
  final String title;
  final String description;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      closedColor: Colors.transparent,
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 800),
      openBuilder: (context, action) {
        return ImAgeContainerPage(
          imageUrl: imageUrl,
        );
      },
      closedBuilder: (context, action) {
        return Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onPress,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  padding: EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.darkBlue,
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                          alignment: Alignment.center)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                  child: Text(
                    this.title,
                    style: AppTypography.bodyNormal
                        .copyWith(color: AppColors.neutrals[800]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    this.description,
                    style: AppTypography.bodyMedium.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
