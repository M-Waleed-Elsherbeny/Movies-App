part of 'home_cubit.dart';

sealed class HomeMoviesState {}

final class HomeInitial extends HomeMoviesState {}

final class HomeLoading extends HomeMoviesState {}

final class HomeSuccess extends HomeMoviesState {}

final class HomeError extends HomeMoviesState {
  final String errorMessage;
  HomeError(this.errorMessage);
}

final class DropDownChanged extends HomeMoviesState{}
