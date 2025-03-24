import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/constants/constants.dart';
import 'package:flutter_task/global/global.dart';
import 'package:flutter_task/routes/task_navigation.dart';
import 'package:flutter_task/theme/custom_colors.dart';
import 'package:flutter_task/views/auth/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      backgroundColor: CustomColors.lightBlue,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.infinity,
      duration: 2500,
      splash: SizedBox(
        height: 100,
        width: 200,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.1416,
              child: Image.asset(splashPng),
            );
          },
        ),
      ),
      screenFunction: () async {
        return loginUserApp.isEmpty ? const Login() : const Navigation();
      },
    );
  }
}
