// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:prfirebase/repo/phone_number_otp_repo.dart';
// import 'package:prfirebase/screen/login.dart';
//
// class PhoneNumberVerify extends StatefulWidget {
//   const PhoneNumberVerify({Key? key}) : super(key: key);
//
//   @override
//   _PhoneNumberVerifyState createState() => _PhoneNumberVerifyState();
// }
//
// class _PhoneNumberVerifyState extends State<PhoneNumberVerify> {
//   int start = 30;
//   bool wait = false;
//   String buttonname = "Send";
//   TextEditingController _PhoneNumber = TextEditingController();
//   AuthRepo authRepo = AuthRepo();
//   String varificaionIDFinal = "";
//   String smsCode = "";
//   @override
//   Widget build(BuildContext context) {
//     final screen = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         height: screen.height * 1,
//         width: screen.width * 1,
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage("assets/img/a.jpg"),
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 150),
//             child: Column(
//               children: [
//                 TextField(),
//                 SizedBox(
//                   height: screen.height * 0.02,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         indent: 20,
//                         color: Colors.grey,
//                         thickness: 3,
//                       ),
//                     ),
//                     Text("  Enter 6 Digit otp  ",
//                         style: TextStyle(fontSize: 17, color: Colors.white)),
//                     Expanded(
//                       child: Divider(
//                         endIndent: 20,
//                         color: Colors.grey,
//                         thickness: 3,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: screen.height * 0.03,
//                 ),
//                 otpField(),
//                 SizedBox(
//                   height: screen.height * 0.03,
//                 ),
//                 RichText(
//                     text: TextSpan(children: [
//                   TextSpan(
//                     text: "Send otp again in ",
//                     style: TextStyle(fontSize: 17, color: Colors.yellow),
//                   ),
//                   TextSpan(
//                     text: " 00:$start  ",
//                     style: TextStyle(fontSize: 17, color: Colors.pinkAccent),
//                   ),
//                   TextSpan(
//                     text: "Sec ",
//                     style: TextStyle(fontSize: 17, color: Colors.yellow),
//                   ),
//                 ])),
//                 SizedBox(
//                   height: screen.height * 0.08,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     authRepo.singInwithPhonenumber(smsCode, varificaionIDFinal);
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Login(),
//                         ));
//                   },
//                   child: Container(
//                     height: screen.height * 0.07,
//                     width: screen.width - 40,
//                     decoration: BoxDecoration(
//                         color: Colors.orangeAccent,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Center(
//                         child: Text(
//                       "Lets Go",
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     )),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void startTimer() {
//     const onsec = Duration(seconds: 1);
//     Timer timer = Timer.periodic(onsec, (timer) {
//       if (start == 0) {
//         setState(() {
//           timer.cancel();
//           wait = false;
//         });
//       } else {
//         setState(() {
//           start--;
//         });
//       }
//     });
//   }
//
//   Widget otpField() {
//     return OTPTextField(
//       length: 6,
//       width: MediaQuery.of(context).size.width,
//       fieldWidth: 50,
//       otpFieldStyle: OtpFieldStyle(
//         backgroundColor: Color(0xff1d1d1d),
//         borderColor: Colors.white,
//       ),
//       style: TextStyle(fontSize: 17, color: Colors.amber),
//       textFieldAlignment: MainAxisAlignment.spaceAround,
//       fieldStyle: FieldStyle.underline,
//       onCompleted: (pin) {
//         print("Completed: " + pin);
//         setState(() {
//           smsCode = pin;
//         });
//       },
//     );
//   }
//
//   Widget TextField() {
//     return TextFormField(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       textInputAction: TextInputAction.next,
//       cursorColor: Colors.white,
//       cursorHeight: 20,
//       style: TextStyle(color: Colors.amber),
//       controller: _PhoneNumber,
//       decoration: InputDecoration(
//         prefixIcon: Icon(
//           Icons.phone,
//           color: Colors.white,
//           size: 30,
//         ),
//         prefix: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           child: Text(
//             "(+91)",
//             style: TextStyle(color: Colors.amber),
//           ),
//         ),
//         suffix: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           child: TextButton(
//             onPressed: wait
//                 ? null
//                 : () async {
//                     startTimer();
//                     setState(() {
//                       start = 30;
//                       wait = true;
//                       buttonname = "Resend";
//                     });
//                     await authRepo.verifyphonenumber(
//                         "+91${_PhoneNumber.text}", context, setData);
//                   },
//             child: Text(
//               buttonname,
//               style: TextStyle(
//                   color: wait ? Colors.pinkAccent : Colors.amber,
//                   fontSize: 17,
//                   letterSpacing: 1,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         labelText: "Phone Number",
//         labelStyle: TextStyle(color: Colors.white),
//         enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
//         focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
//         contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//       ),
//     );
//   }
//
//   void setData(String varificaionID) {
//     setState(() {
//       varificaionIDFinal = varificaionID;
//     });
//     startTimer();
//   }
// }
