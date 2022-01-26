
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prfirebase/screen/umpload_image_screen.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String? verificationId;

  bool showLoading = false;

  ///

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/img/a.jpg"),
          ),
        ),
        child: showLoading
            ? Center(child: CircularProgressIndicator())
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
        padding: EdgeInsets.all(16),
      ),
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential credential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(credential);
      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UploadImageScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("$e.message"),
        ),
      );
    }
  }

  ///
  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          keyboardType: TextInputType.phone,
          controller: phoneController,
          cursorColor: Colors.white,
          cursorHeight: 20,
          style: TextStyle(color: Colors.amber),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.white,
              size: 30,
            ),
            labelText: "Phone Number",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        FlatButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(

              phoneNumber: '+91${phoneController.text}',
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                // signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                _globalKey.currentState!.showSnackBar(
                  SnackBar(
                    content: Text('$verificationFailed.message'),
                  ),
                );
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {

              },
            );
          },
          child: Text('Send'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  ///
  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          keyboardType: TextInputType.number,
          controller: otpController,
          cursorColor: Colors.white,
          cursorHeight: 20,
          style: TextStyle(color: Colors.amber),
          decoration: InputDecoration(
            labelText: "Enter Otp",
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId!,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
            // Navigator.pushReplacement(
            //   context,
            //    MaterialPageRoute(
            //     builder: (context) => CurrentUser(),
            //   ),
            // );
          },
          child: Text('Verify'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }
}
