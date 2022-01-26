// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:prfirebase/constant/const.dart';
// import 'package:prfirebase/screen/currentuser.dart';
// import 'package:prfirebase/screen/phone_otp_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _auth = FirebaseAuth.instance;
//
//   final _email = TextEditingController();
//
//   final _pass = TextEditingController();
//
//   @override
//   void dispose() {
//     _email.dispose();
//     _pass.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Home Screen"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await kFirebaseAuth.signOut();
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CurrentUserScreen(),
//             ),
//           );
//         },
//         child: Icon(Icons.logout),
//       ),
//     );
//   }
// }
