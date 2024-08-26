import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:moviesapp/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/routing/app_route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.goNamed(MyAppRouteConstants.mainRouteName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: const Color(0xff353434),
        child: const Center(
          child: Text(
            'FILMFLIX',
            style: TextStyle(
                fontFamily: 'roboto',
                color: Color(0xffE50914),
                // color: Color(0xff353434),
                letterSpacing: 8,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
      ),
    );
  }
}
