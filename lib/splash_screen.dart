import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/routing/app_route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // getSharedPrefrences();
      // final user = FirebaseAuth.instance.currentUser!;
      // debugPrint('user name : ${user.isAnonymous}');
    });
  }


  late SharedPreferences sp;

  getSharedPrefrences() async {
    sp = await SharedPreferences.getInstance();
    // readFromSp();
    saveIntoSp();
  }
  //
  saveIntoSp() {
    final user = FirebaseAuth.instance.currentUser!;
    debugPrint('${user.isAnonymous}');
    // context.goNamed(MyAppRouteConstants.loginRouteName):context.goNamed(MyAppRouteConstants.dataRouteName);
    // List<String> productListString = products.map((product) => jsonEncode(product.toJson())).toList();
    // sp.setStringList('Products', productListString);
  }
  //
  readFromSp() {
    // List<String>? productListString = sp.getStringList('Products');
    sp.getString('token');

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
