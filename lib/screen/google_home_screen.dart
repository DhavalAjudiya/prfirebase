// import 'package:flutter/material.dart';
// import 'package:prfirebase/repo/google_signin_repo.dart';
//
// import 'login.dart';
//
// class GoogleHomeScreen extends StatefulWidget {
//   @override
//   _GoogleHomeScreenState createState() => _GoogleHomeScreenState();
// }
//
// class _GoogleHomeScreenState extends State<GoogleHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [Colors.blue[100]!, Colors.blue[400]!],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               CircleAvatar(
//                 backgroundImage: NetworkImage(imageUrl!),
//                 radius: 60,
//                 backgroundColor: Colors.transparent,
//               ),
//               SizedBox(height: 40),
//               Text(
//                 'NAME',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54),
//               ),
//               Text(
//                 name!,
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.deepPurple,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'EMAIL',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black54),
//               ),
//               Text(
//                 email!,
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.deepPurple,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 40),
//               RaisedButton(
//                 onPressed: () {
//                   signOutGoogle();
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Login(),
//                     ),
//                   );
//                 },
//                 color: Colors.deepPurple,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Sign Out',
//                     style: TextStyle(fontSize: 25, color: Colors.white),
//                   ),
//                 ),
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40)),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
