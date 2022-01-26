import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:prfirebase/repo/google_signin_repo.dart';
import 'package:prfirebase/repo/singup_repo.dart';
import 'package:prfirebase/screen/currentuser.dart';
import 'package:prfirebase/screen/login.dart';
import 'package:prfirebase/screen/phone_otp_screen.dart';
import 'package:prfirebase/screen/umpload_image_screen.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  // Future<UserCredential> signWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  final _email = TextEditingController();

  final _pass = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screen.height * 1,
              width: screen.width * 1,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 220, left: 10, right: 10),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Text(
                            "Sing Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: screen.height * 0.02,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            cursorHeight: 20,
                            style: TextStyle(color: Colors.amber),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 30,
                              ),
                              labelText: "Name",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                          ),
                          SizedBox(
                            height: screen.height * 0.015,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* required";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.white,
                            cursorHeight: 20,
                            style: TextStyle(color: Colors.amber),
                            controller: _email,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 30,
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                          ),
                          SizedBox(
                            height: screen.height * 0.015,
                          ),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "* required";
                                } else {
                                  return null;
                                }
                              },
                              cursorColor: Colors.white,
                              cursorHeight: 20,
                              style: TextStyle(color: Colors.amber),
                              controller: _pass,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                labelText: "password",
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                              )),
                          SizedBox(
                            height: screen.height * 0.02,
                          ),
                          // RaisedButton(
                          //   color: Colors.teal[200],
                          //   splashColor: Colors.orange,
                          //   highlightColor: Colors.red,
                          //   onPressed: () {
                          //     if (_formkey.currentState!.validate()) {
                          //       AuthRepo.singup(
                          //           email: _email.text, pass: _pass.text);
                          //
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) {},
                          //           ));
                          //     }
                          //   },
                          //   child: Text(
                          //     "Submit",
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 20,
                          //         letterSpacing: 2,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          // ),
                          SizedBox(
                            height: screen.height * 0.02,
                          ),
                          TextButton(
                            onPressed: () {
                              signInWithFacebook().then(
                                (value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                        SnackBar(
                                          content: Text('Login success!'),
                                        ),
                                      )
                                      .closed;
                                  // .then(
                                  //   (value) => Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           UploadImageScreen(),
                                  //     ),
                                  //   ),
                                  // );
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  image: AssetImage("assets/img/b.png"),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: screen.width * 0.03,
                                ),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/a.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
