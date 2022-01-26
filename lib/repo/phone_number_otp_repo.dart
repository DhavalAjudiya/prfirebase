import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepo {
  final _auth = FirebaseAuth.instance;
  Future<void> verifyphonenumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "verificationCompleted");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    PhoneCodeSent codeSent =
        (String? varificatoinID, [int? forceResendingtoken]) {
      showSnackBar(context, "verification Code Sent on the Phone Number");
      setData(varificatoinID);
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String varificationID) {
      showSnackBar(context, "Time Out");
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> singInwithPhonenumber(
      String verificationId, String smsCode) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
    } catch (e) {}
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
