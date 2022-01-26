// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:prfirebase/constant/const.dart';
// import 'package:prfirebase/repo/delete_repo.dart';
// import 'package:prfirebase/repo/google_signin_repo.dart';
// import 'package:prfirebase/screen/login.dart';
// import 'package:prfirebase/screen/sing_up.dart';
//
// class CurrentUserScreen extends StatefulWidget {
//   @override
//   _CurrentUserScreenState createState() => _CurrentUserScreenState();
// }
//
// class _CurrentUserScreenState extends State<CurrentUserScreen> {
//   final _auth = FirebaseAuth.instance;
//
//   // final _email = TextEditingController();
//   //
//   // final _pass = TextEditingController();
//
//   @override
//   void dispose() {
//     // _email.dispose();
//     // _pass.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screen = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: Container(
//         height: screen.height * 1,
//         width: screen.width * 1,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 150, right: 10, left: 10),
//           child: Column(
//             children: [
//               CircleAvatar(
//                 // backgroundImage: NetworkImage(imageUrl!),
//                 radius: 80,
//                 backgroundColor: Colors.transparent,
//               ),
//               Text(
//                 "Profile",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: screen.height * 0.03,
//               ),
//               Text(
//                 "${kFirebaseAuth.currentUser!.email}",
//                 style: TextStyle(
//                     fontSize: 20, color: Colors.white, letterSpacing: 2),
//               ),
//               Text(
//                 "Email ",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: screen.height * 0.03,
//               ),
//               Text(
//                 "${kFirebaseAuth.currentUser!.uid}",
//                 style: TextStyle(
//                     fontSize: 15, color: Colors.white, letterSpacing: 2),
//               ),
//               Text(
//                 "Generate Id ",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: screen.height * 0.03,
//               ),
//               TextButton(
//                 onPressed: () {
//                   AuthRepo.deleteaccount(context: context, email: email);
//                   //     .then((res) {
//                   //   ScaffoldMessenger.of(context).showSnackBar(
//                   //     SnackBar(
//                   //       duration: Duration(milliseconds: 600),
//                   //       content: Text("User Account Deleted"),
//                   //     ),
//                   //   );
//                   // }).catchError((onError) {
//                   //   ScaffoldMessenger.of(context).showSnackBar(
//                   //     SnackBar(
//                   //       content: Text("Credential Error"),
//                   //     ),
//                   //   );
//                   // });
//
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //       builder: (context) => Login(),
//                   //     ));
//                 },
//                 child: Text(
//                   "Delete Account",
//                   style: TextStyle(
//                       decoration: TextDecoration.underline,
//                       color: Colors.orange,
//                       wordSpacing: 2,
//                       fontSize: 15),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   signOutGoogle();
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SingUp(),
//                       ));
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Image(
//                       image: AssetImage("assets/img/b.png"),
//                       height: 20,
//                     ),
//                     SizedBox(
//                       width: screen.width * 0.03,
//                     ),
//                     Text(
//                       'Sing Out ',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           letterSpacing: 2,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage("assets/img/a.jpg"),
//           ),
//         ),
//       ),
//     );
//   }
// }
