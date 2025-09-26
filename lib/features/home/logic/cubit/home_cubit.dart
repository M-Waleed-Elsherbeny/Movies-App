import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/features/home/models/movies_model.dart';
import 'package:movies_app/features/home/models/search_category.dart';

part 'home_state.dart';

class HomeMoviesCubit extends Cubit<HomeMoviesState> {
  HomeMoviesCubit(this.apiServices) : super(HomeInitial());
  ApiServices apiServices;
  String initialDropDown = "";
  List<Result> popularMovies = [];
  List<Result> upcomingMovies = [];

  void changeDropDown({String? newValue}) {
    if (newValue != null) {
      initialDropDown = newValue;
    } else {
      initialDropDown = SearchCategory.popular;
    }
  }

  Future<void> getPopularMovies() async {
    emit(HomeLoading());
    changeDropDown();
    try {
      Response response = await apiServices.getMovies(
        endPoint: "/movie/${initialDropDown.toLowerCase()}",
        page: 1,
      );
      if (response.statusCode == 200) {
        MoviesModel moviesModel = MoviesModel.fromJson(response.data);
        if (initialDropDown == SearchCategory.popular) {
          popularMovies.clear();
          popularMovies.addAll(moviesModel.results);
          log(popularMovies.length.toString());
          emit(HomeSuccess());
        } else if (initialDropDown == SearchCategory.upcoming) {
          upcomingMovies.clear();
          upcomingMovies.addAll(moviesModel.results);
          log(upcomingMovies.length.toString());
          emit(HomeSuccess());
        }
      }
    } on DioException catch (e) {
      log(e.message.toString());
      emit(HomeError(e.toString()));
    }
  }

  Future<void> getUpcomingMovies() async {
    emit(HomeLoading());
    try {
      Response response = await apiServices.getMovies(
        endPoint: "/movie/${initialDropDown.toLowerCase()}",
        page: 1,
      );
      if (response.statusCode == 200) {
        MoviesModel moviesModel = MoviesModel.fromJson(response.data);
        upcomingMovies.clear();
        upcomingMovies.addAll(moviesModel.results);
        log(upcomingMovies.length.toString());
        emit(HomeSuccess());
      }
    } on DioException catch (e) {
      log(e.message.toString());
      emit(HomeError(e.toString()));
    }
  }

  List<Result> searchMovies = [];
  List<Result> searchMoviesByTitle({required String searchQuery}) {
    searchMovies.addAll(
      popularMovies.where((query) => query.title.contains(searchQuery)),
    );
    log(searchMovies.length.toString());
    if (searchMovies.isNotEmpty) {
      return searchMovies;
    } else {
      return popularMovies;
    }
  }
}
