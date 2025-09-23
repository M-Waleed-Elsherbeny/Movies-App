import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/features/home/models/movies_model.dart';

part 'home_state.dart';

class HomeMoviesCubit extends Cubit<HomeMoviesState> {
  HomeMoviesCubit(this.apiServices) : super(HomeInitial());
  ApiServices apiServices;

  List<Result> movies = [];

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      Response response = await apiServices.getMovies( endPoint: "/movie/popular");
      if (response.statusCode == 200) {
        MoviesModel moviesModel = MoviesModel.fromJson(response.data);
        movies.addAll(moviesModel.results);
        log(movies.length.toString());
        emit(HomeSuccess());
      }
    } on DioException catch (e) {
      log(e.message.toString());
      emit(HomeError(e.toString()));
    }
  }
}
