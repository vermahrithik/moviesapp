// import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:moviesapp/datapage.dart';
import 'package:moviesapp/routing/app_route_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff353434),
      appBar: AppBar(
        title: const Text(
          'FILMFLIX',
          style: TextStyle(
            letterSpacing: 8,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Color(0xffE50914)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Movies',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              // onPressed: () async {
              //   List<dynamic> data = await apiCall();
              //   if (data.isNotEmpty) {
              //     List<dynamic> data = await apiCall();
              //     final String dataString = jsonEncode(data);
              //     // Navigator.of(context).push(MaterialPageRoute(
              //     //   builder: (context) => DataPage(data: data),
              //     // ));
              //     context.goNamed(MyAppRouteConstants.dataRouteName,pathParameters: {'data':dataString});
              //   } else {
              //     Get.snackbar(
              //       'error','failed to load data'
              //     );
              //   }
              // },
              onPressed: () {
                context.goNamed(MyAppRouteConstants.dataRouteName);
              },

                child: const Text('click to get movies')),
            Text(
              'signed in user : ${user.email!}',
              style: const TextStyle(color: Colors.white),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Text(
        'signed in user : ${user.email!}',
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
