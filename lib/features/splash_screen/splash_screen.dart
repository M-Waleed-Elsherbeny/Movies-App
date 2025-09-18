import 'package:flutter/material.dart';
import 'package:movies_app/core/assets/app_assets.dart';
import 'package:movies_app/core/navigation/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // add animation
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    navigationToMainScreen();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  navigationToMainScreen() async {
    await Future.delayed(Duration(seconds: 5));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRouter.homeScreen);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Image.asset(AppAssets.netflixLogo),
            ),
            ScaleTransition(
              scale: animation,
              child: Image.asset(AppAssets.netflixName),
            ),
          ],
        ),
      ),
    );
  }
}
