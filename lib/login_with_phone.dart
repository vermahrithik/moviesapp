// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:moviesapp/routing/app_route_constants.dart';
//
// class LoginWithPhone extends StatefulWidget {
//   const LoginWithPhone({super.key});
//
//   @override
//   State<LoginWithPhone> createState() => _LoginWithPhoneState();
// }
//
// class _LoginWithPhoneState extends State<LoginWithPhone> {
//   bool loading = false;
//   TextEditingController phoneNumberController = TextEditingController();
//   final auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('otp page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           children: [
//             SizedBox(height: 50,),
//             TextFormField(
//               controller: phoneNumberController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: '+91 6202020094',
//               ),
//             ),
//             SizedBox(height: 30,),
//             ElevatedButton(
//               onPressed: (){
//                 setState(() {
//                   loading = true;
//                 });
//                 auth.verifyPhoneNumber(
//                   phoneNumber: phoneNumberController.text,
//                     verificationCompleted: (_){
//                       setState(() {
//                         loading = false;
//                       });
//                     },
//                     verificationFailed: (e){
//                       setState(() {
//                         loading = false;
//                       });
//                       Get.snackbar('verification error message', '${e.toString()}',backgroundColor: Colors.red.withOpacity(0.8),barBlur: 4,colorText: Colors.white,boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]);
//                     },
//                     codeSent: (String verificationId , int? token){
//                         context.goNamed(MyAppRouteConstants.verifyRouteName,pathParameters: verificationId);
//                         setState(() {
//                           loading = false;
//                         });
//                     },
//                     codeAutoRetrievalTimeout: (e){
//                       Get.snackbar('verification error message', '${e.toString()}',backgroundColor: Colors.red.withOpacity(0.5),barBlur: 4,colorText: Colors.white,boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]);
//                       setState(() {
//                         loading = false;
//                       });
//                     }
//                 );
//               },
//               child: Text('Send Otp')
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
