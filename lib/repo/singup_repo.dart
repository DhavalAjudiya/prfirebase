import 'package:prfirebase/constant/const.dart';

class AuthRepo {
  static Future singup({String? email, String? pass}) async {
    try {
      await kFirebaseAuth.createUserWithEmailAndPassword(
          email: email!, password: pass!);
    } catch (e) {
      print("registration eroor ==> $e");
    }
  }
}
