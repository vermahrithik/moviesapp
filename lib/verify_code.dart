// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
// import 'package:moviesapp/routing/app_route_constants.dart';
//
// class VerifyCodeScreen extends StatefulWidget {
//   final Object verificationId;
//   const VerifyCodeScreen({super.key,required this.verificationId});
//
//   @override
//   State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
// }
//
// class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
//   bool loading = false;
//   TextEditingController verificationCodeController = TextEditingController();
//   final auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('verify'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           children: [
//             SizedBox(height: 50,),
//             TextFormField(
//               controller: verificationCodeController,
//               decoration: InputDecoration(
//                 hintText: '6 digit code',
//               ),
//             ),
//             SizedBox(height: 30,),
//             ElevatedButton(
//                 onPressed: () async{
//                   setState(() {
//                     loading = true;
//                   });
//                   final credential = PhoneAuthProvider.credential(
//                     verificationId: widget.verificationId.toString(),
//                     smsCode: verificationCodeController.text.toString()
//                   );
//
//                   try{
//                     await auth.signInWithCredential(credential);
//                     context.go(MyAppRouteConstants.dataRouteName);
//                   }catch(e){
//                     setState(() {
//                       loading = false;
//                     });
//                     Get.snackbar('error message', '${e.toString()}',backgroundColor: Colors.red.withOpacity(0.8),barBlur: 4,colorText: Colors.white,boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]);
//                   }
//
//                 },
//                 child: Text('click to verify')
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
