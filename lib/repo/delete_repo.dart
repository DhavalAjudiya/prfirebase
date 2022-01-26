import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prfirebase/constant/const.dart';

class AuthRepo {
  static deleteaccount({
    String? email,
    String? pass,
    BuildContext? context,
  }) async {
    User? user = kFirebaseAuth.currentUser;

    AuthCredential credential =
        EmailAuthProvider.credential(email: email!, password: pass!);

    await user!.reauthenticateWithCredential(credential).then((value) {
      value.user!.delete().then((res) {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            content: Text("User Account Deleted"),
          ),
        );
      });
    }).catchError((onError) {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text("Credential Error"),
        ),
      );
    });
  }
}
