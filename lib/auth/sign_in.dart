import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      //print("signed in " + user.displayName);

      return user;
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/ty.png')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400.0,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Sign in To Continue",
                    style: TextStyle(fontSize: 30.0,shadows: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.white,
                          offset: Offset(1.5,1.5)
                      ),
                    ]),
                  ),
                  Text(
                    "CU FOOD'S",
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.black,
                              offset: Offset(5, 5)),
                        ]),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Google,
                        text: "Sign in With Google",
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.AppleDark,
                        text: "Sign in With Apple ",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("By signin in you are agreeing to our"),
                      Text("Terms & Condition's "),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}