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
  String initialDropDown = SearchCategory.popular;
  List<Result> allMovies = [];
  List<Result> upcomingMovies = [];
  List<Result> popularMovies = [];

  void changeDropDown({String? newValue}) {
    if (newValue != null) {
      initialDropDown = newValue;
    } else {
      initialDropDown = SearchCategory.popular;
    }
    emit(DropDownChanged());
  }

  Future<List<Result>> getAllMovies() async {
    emit(HomeLoading());
    try {
      Response response = await apiServices.getMovies(
        endPoint: "/movie/${initialDropDown.toLowerCase()}",
      );
      if (response.statusCode == 200) {
        MoviesModel moviesModel = MoviesModel.fromJson(response.data);
        if (initialDropDown == SearchCategory.popular) {
          popularMovies.clear();
          popularMovies.addAll(moviesModel.results);
          allMovies = popularMovies;
          log("popularMovies ==> ${allMovies.length}");
          emit(HomeSuccess());
          return allMovies;
        } else if (initialDropDown == SearchCategory.upcoming) {
          upcomingMovies.clear();
          upcomingMovies.addAll(moviesModel.results);
          allMovies = upcomingMovies;
          log("upcomingMovies ==> ${allMovies.length}");
          emit(HomeSuccess());
          return allMovies;
        } else {
          allMovies.clear();
          allMovies.addAll(moviesModel.results);
          log("allMovies ==> ${allMovies.length}");
          emit(HomeSuccess());
          return allMovies;
        }
      }
      emit(HomeSuccess());
      return allMovies;
    } on DioException catch (e) {
      log(e.message.toString());
      emit(HomeError(e.toString()));
      return [];
    } catch (e) {
      log(e.toString());
      emit(HomeError(e.toString()));
      return [];
    }
  }
  List<Result> searchMovies = [];
  List<Result> searchMoviesByTitle({required String searchQuery}) {
    searchMovies.clear();
    searchMovies.addAll(
      allMovies.where((query) => query.title.toLowerCase().contains(searchQuery)),
    );
    log("searchMovies ==> ${searchMovies.length}");
    if (searchMovies.isNotEmpty) {
      emit(HomeSuccess());
      return searchMovies;
    } else {
      return allMovies;
    }
  }
}
