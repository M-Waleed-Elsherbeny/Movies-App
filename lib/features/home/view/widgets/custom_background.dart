import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/core/assets/app_assets.dart';
import 'package:movies_app/core/config/api_config.dart';
import 'package:movies_app/core/di/get_it_config.dart';
import 'package:movies_app/features/home/logic/cubit/home_cubit.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.deviceHeight,
    required this.deviceWidth,
    this.index = 0,
  });
  final double deviceHeight, deviceWidth;
  final int index;

  @override
  Widget build(BuildContext context) {
    HomeMoviesCubit homeCubit = getIt<HomeMoviesCubit>();
    return Container(
      width: deviceWidth,
      height: deviceHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: homeCubit.allMovies.isEmpty
              ? const AssetImage(AppAssets.godZilla)
              : NetworkImage(
                  "${ApiConfig.baseApiImage}${homeCubit.allMovies[index].posterPath}",
                ),
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
