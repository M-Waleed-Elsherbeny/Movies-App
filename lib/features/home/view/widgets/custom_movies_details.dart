import 'package:flutter/material.dart';
import 'package:movies_app/core/config/api_config.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Image.network(
            "${ApiConfig.baseApiImage}${moviesModel[index].posterPath}", height: deviceHeight * 0.20),
        ),
        SizedBox(width: deviceWidth * 0.02),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                moviesModel[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: deviceHeight * 0.03,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "${moviesModel[index].originalLanguage.toUpperCase()} | ${moviesModel[index].releaseDate.toString().split(" ")[0]}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: deviceHeight * 0.015,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: deviceHeight * 0.01),
              SizedBox(
                width: deviceHeight,
                height: deviceHeight * 0.12,
                // color: Colors.red,
                child: Text(
                  moviesModel[index].overview,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: deviceHeight * 0.015,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),

        Text(
          moviesModel[index].voteAverage.toStringAsFixed(2),
          style: TextStyle(color: Colors.white, fontSize: deviceHeight * 0.03),
        ),
      ],
    );
  }
}
