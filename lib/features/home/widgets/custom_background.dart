import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/core/assets/app_assets.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });
  final double deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      height: deviceHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.godZilla),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(color: Colors.black.withAlpha(100)),
      ),
    );
  }
}
