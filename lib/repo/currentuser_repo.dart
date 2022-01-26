import 'package:prfirebase/constant/const.dart';

class AuthRepo {
  static currentRepo() {
    print("user email ==> ${kFirebaseAuth.currentUser!.email}");
    print("user id ==> ${kFirebaseAuth.currentUser!.uid}");
  }
}
