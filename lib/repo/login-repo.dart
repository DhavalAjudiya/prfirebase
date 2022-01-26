import 'package:flutter/material.dart';
import 'package:prfirebase/constant/const.dart';

class AuthRepo {
  static Future<bool?> loginRepo({String? email, String? pass}) async {
    try {
      await kFirebaseAuth.signInWithEmailAndPassword(
          email: email!, password: pass!);
      return true;
    } catch (e) {
      print("log                                                                                 in error ==> $e");
      return false;
    }
  }

  static passwordreset({
    String? email,
    BuildContext?                context,
  }) async {
    await kFirebaseAuth.sendPasswordResetEmail(email: email!);
  }
}
