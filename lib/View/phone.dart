import 'package:prfirebase/constant/const.dart';

class Phone {
  Future login(String phone) async {
    kFirebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {},
      codeSent: (verificationId, forceResendingToken) {},
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
