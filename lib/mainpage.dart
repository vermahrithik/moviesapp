import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviesapp/homepage.dart';
import 'package:moviesapp/loginpage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const HomePage();
          }else{
            return const LoginPage();
          }
        }
      ),
    );
  }
}