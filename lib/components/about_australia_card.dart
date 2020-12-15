import 'package:about_australia/theme/app_colors.dart';
import 'package:about_australia/theme/app_typography.dart';
import 'package:about_australia/views/image_container_page.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AboutAustraliaCard extends StatelessWidget {
  final String assetPath;
  final String imageUrl;
  final String title;

  const AboutAustraliaCard({Key key, this.assetPath, this.imageUrl, this.title})
      : super(key: key);

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
          assetPath: assetPath,
        );
      },
      closedBuilder: (context, action) {
        return Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 5,
              child: Stack(
                children: [
                  Container(
                      height: 250,
                      width: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: imageUrl == null
                                  ? AssetImage(assetPath)
                                  : NetworkImage(imageUrl),
                              fit: BoxFit.cover))),
                  // Container(
                  //   height: 260,
                  //   width: 175,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(16.0),
                  //       gradient: LinearGradient(
                  //           begin: Alignment.topCenter,
                  //           end: Alignment.bottomCenter,
                  //           colors: [
                  //             AppColors.aquaBlue.withOpacity(0.2),
                  //             Colors.white.withOpacity(0.2),
                  //           ])),
                  // ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16.0),
                      child: Text(
                        title,
                        style: AppTypography.bodyNormal
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
