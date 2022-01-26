import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prfirebase/View/cloud_database.dart';
import 'package:prfirebase/View/phoneauthenticaton.dart';
import 'package:prfirebase/screen/Phone_number_verify.dart';
import 'package:prfirebase/screen/phone_otp_screen.dart';
import 'package:prfirebase/screen/sing_up.dart';
import 'package:prfirebase/screen/umpload_image_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneAuthentication(),
    );
  }
}
