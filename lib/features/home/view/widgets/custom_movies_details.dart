import 'package:flutter/material.dart';
import 'package:movies_app/core/assets/app_assets.dart';
import 'package:movies_app/features/home/models/movies_model.dart';

class CustomMoviesDetails extends StatelessWidget {
  const CustomMoviesDetails({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.moviesModel,
    required this.index,
  });
  final double deviceHeight, deviceWidth;
  final List<Result> moviesModel;
  final int index;

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
            Expanded(
              child: Text(
                moviesModel[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: deviceHeight * 0.03,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "${moviesModel[index].originalLanguage} | ${moviesModel[index].releaseDate}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: deviceHeight * 0.015,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: deviceHeight * 0.01),
            Expanded(
              child: Text(
                moviesModel[index].overview,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: deviceHeight * 0.010,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Expanded(
          child: Text(
            moviesModel[index].voteAverage.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: deviceHeight * 0.03,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
