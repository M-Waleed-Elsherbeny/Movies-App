import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/core/networking/dio_helper.dart';
import 'package:movies_app/features/home/logic/cubit/home_cubit.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  Dio? dioHelper = DioHelper.initialDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dioHelper));

  getIt.registerLazySingleton<HomeMoviesCubit>(
    () => HomeMoviesCubit(getIt<ApiServices>()),
  );
}
