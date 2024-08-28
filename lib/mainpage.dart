import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/datapage.dart';
import 'package:moviesapp/homepage.dart';
import 'package:moviesapp/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/routing/app_route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.data?.refreshToken!=null){
            context.goNamed(MyAppRouteConstants.dataRouteName);
            return SizedBox();
          }else{
            context.goNamed(MyAppRouteConstants.loginRouteName);
            return SizedBox();
          }
        }
      ),
    );
  }
}