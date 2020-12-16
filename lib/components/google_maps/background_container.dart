import 'dart:ui';

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
      this.appBar,
      this.blurredBackground = false});
  final String assetPath;
  final Widget child;
  final BottomNavigation bottomNavigationBar;
  final Widget linearGradient;
  final String imageUrl;
  final AppBar appBar;
  final bool blurredBackground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(children: [
        imageUrl != null || assetPath != null
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
        blurredBackground
            ? Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              )
            : SizedBox(),
        linearGradient == null ? SizedBox() : linearGradient,
        this.child
      ]),
    );
  }
}
