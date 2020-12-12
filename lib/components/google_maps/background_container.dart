import 'package:about_australia/components/bottom_nvaigation_bar.dart';
import 'package:about_australia/views/list_map.dart';
import 'package:about_australia/views/map_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  BackgroundContainer(
      {this.assetPath,
      @required this.child,
      this.bottomNavigationBar,
      this.linearGradient,
      this.imageUrl,
      this.appBar});
  final String assetPath;
  final Widget child;
  final BottomNavigation bottomNavigationBar;
  final Widget linearGradient;
  final String imageUrl;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(children: [
        imageUrl != null || assetPath != null
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageUrl != null
                            ? NetworkImage(imageUrl)
                            : AssetImage(this.assetPath),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
              )
            : SizedBox(),
        linearGradient == null ? SizedBox() : linearGradient,
        this.child
      ]),
    );
  }
}
