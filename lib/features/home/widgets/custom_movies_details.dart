import 'package:flutter/material.dart';
import 'package:movies_app/core/assets/app_assets.dart';

class CustomMoviesDetails extends StatelessWidget {
  const CustomMoviesDetails({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
  });
  final double deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Image.asset(AppAssets.godZilla, height: deviceHeight * 0.20),
        ),
        SizedBox(width: deviceWidth * 0.02),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Title",
              style: TextStyle(
                color: Colors.white,
                fontSize: deviceHeight * 0.03,
              ),
            ),
            Text(
              "EN | 2022 | 2h 30m",
              style: TextStyle(
                color: Colors.white,
                fontSize: deviceHeight * 0.015,
              ),
            ),
            SizedBox(height: deviceHeight * 0.01),
            Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontSize: deviceHeight * 0.010,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          "Rate",
          style: TextStyle(color: Colors.white, fontSize: deviceHeight * 0.03),
        ),
      ],
    );
  }
}
