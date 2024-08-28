import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/routing/app_route_constants.dart';

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
            return const SizedBox();
          }else{
            context.goNamed(MyAppRouteConstants.loginRouteName);
            return const SizedBox();
          }
        }
      ),
    );
  }
}