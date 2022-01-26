// import 'package:flutter/material.dart';
// import 'package:prfirebase/repo/login-repo.dart';
// import 'package:prfirebase/screen/login.dart';
//
// class ResetPass extends StatefulWidget {
//   const ResetPass({Key? key}) : super(key: key);
//
//   @override
//   _ResetPassState createState() => _ResetPassState();
// }
//
// class _ResetPassState extends State<ResetPass> {
//   final _email = TextEditingController();
//
//   final _pass = TextEditingController();
//
//   final _formkey = GlobalKey<FormState>();
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
//     final screen = MediaQuery.of(context).size;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: screen.height * 1,
//               width: screen.width * 1,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(top: 220, left: 10, right: 10),
//                     child: Form(
//                       key: _formkey,
//                       child: Column(
//                         children: [
//                           Text(
//                             "Forget Password ",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 letterSpacing: 2,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           SizedBox(
//                             height: screen.height * 0.02,
//                           ),
//                           TextFormField(
//                             textInputAction: TextInputAction.next,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return "* required";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             cursorColor: Colors.white,
//                             cursorHeight: 20,
//                             style: TextStyle(color: Colors.amber),
//                             controller: _email,
//                             decoration: InputDecoration(
//                               prefixIcon: Icon(
//                                 Icons.email,
//                                 color: Colors.white,
//                                 size: 30,
//                               ),
//                               labelText: "Email",
//                               labelStyle: TextStyle(color: Colors.white),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               contentPadding: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                             ),
//                           ),
//                           SizedBox(
//                             height: screen.height * 0.02,
//                           ),
//                           RaisedButton(
//                             color: Colors.teal[200],
//                             splashColor: Colors.orange,
//                             highlightColor: Colors.red,
//                             onPressed: () {
//                               if (_formkey.currentState!.validate()) {
//                                 AuthRepo.passwordreset(
//                                         email: _email.text, context: context)
//                                     .then((value) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       duration: Duration(microseconds: 600),
//                                       content: Text(
//                                           "Password Reset email link is been sent"),
//                                     ),
//                                   );
//                                 }).catchError((onError) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text("Error In Email Reset"),
//                                     ),
//                                   );
//                                 });
//
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => Login(),
//                                     ));
//                               }
//                             },
//                             child: Text(
//                               "Submit",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   letterSpacing: 2,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage("assets/img/a.jpg"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
