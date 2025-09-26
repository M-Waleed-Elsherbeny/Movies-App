  import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log("onEvent ====> $event");
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("onTransition ====> $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("onError ====> $error");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("onCreate ====> $bloc");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log("onClose ====> $bloc");
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("onChange ====> $change");
    super.onChange(bloc, change);
  }
}
