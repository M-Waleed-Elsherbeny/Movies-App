import 'package:flutter/material.dart';
import 'package:movies_app/core/navigation/app_router.dart';
import 'package:movies_app/core/navigation/app_router_config.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialRoute: AppRouter.splashScreen,
      onGenerateRoute: AppRouterConfig.onGenerateRoute,
    );
  }
}
