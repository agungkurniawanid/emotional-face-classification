import 'dart:async';

import 'package:emotional_face_classification/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark));

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              const OnboardingScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation1, animation2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
              ).animate(animation1),
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFD4FF58),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Emotional",
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'MediaSans',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ))
                .animate()
                .fadeIn(duration: 1000.ms)
                .then(delay: 200.ms) // baseline=800ms
                .slide(),
            const Text("Face Classification",
                    style: TextStyle(
                        fontSize: 38,
                        fontFamily: 'MediaSans',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        height: 1.0))
                .animate()
                .fadeIn(duration: 1000.ms)
                .then(delay: 200.ms)
                .slide(),
            const Text("App",
                    style: TextStyle(
                        fontSize: 130,
                        fontFamily: 'MediaSans',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        height: 1.0))
                .animate()
                .fadeIn(duration: 1000.ms)
                .scale()
                .move(delay: 300.ms, duration: 600.ms),
            Image.asset(
              'assets/images/vector/garis_melengkung.png',
            )
                .animate()
                .fadeIn(duration: 1000.ms)
                .then(delay: 200.ms)
                .slideY(begin: 1, end: 0),
          ],
        ),
      ),
    ));
  }
}
