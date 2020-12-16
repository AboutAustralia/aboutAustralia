import 'package:about_australia/components/google_maps/background_container.dart';
import 'package:flutter/material.dart';

class ImAgeContainerPage extends StatelessWidget {
  final assetPath;
  final imageUrl;

  const ImAgeContainerPage({this.assetPath, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      assetPath: assetPath,
      imageUrl: imageUrl,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                    ),
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
