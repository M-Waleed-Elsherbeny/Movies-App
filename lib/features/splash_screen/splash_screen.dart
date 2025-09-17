import 'package:flutter/material.dart';
import 'package:movies_app/core/assets/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // add animation
  AnimationController? animationController;
  TweenAnimationBuilder? tweenAnimationBuilder;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animationController!.reverse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.netflixLogo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            AnimatedContainer(
              
              onEnd: () {
                  // Navigator.pushReplacementNamed(context, '/home');
              },
              duration: const Duration(seconds: 5),
              curve: Curves.fastOutSlowIn,
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.netflixName),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
