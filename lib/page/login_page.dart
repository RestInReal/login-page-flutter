//import 'dart:html';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:tokopedia/authentication/authentication.dart';
import 'package:tokopedia/authentication/generated_plugin.dart';
import 'package:tokopedia/page/home_page.dart';
import 'package:tokopedia/theme/theme.dart';
import 'package:provider/provider.dart';

class loginPage extends StatefulWidget {
  loginPage({Key key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/Icon.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to Layfuu',
                textAlign: TextAlign.center,
                style: blueTextStyle.copyWith(fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                'sign in to continoue',
                textAlign: TextAlign.center,
                style: grayTextStyle.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: 50,
              ),
              _buildTextField(
                  nameController, Icons.account_circle, 'Your Email'),
              SizedBox(height: 8),
              _buildTextField(passwordController, Icons.lock, 'Password'),
              SizedBox(height: 30),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: nameController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                color: blueColor,
                child: Text(
                  'Sign In',
                  style: whiteTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async {
                  final GoogleSignInAccount googleUser =
                      await _googleSignIn.signIn();
                  final GoogleSignInAuthentication googleAuth =
                      await googleUser.authentication;

                  final AuthCredential credential =
                      GoogleAuthProvider.credential(
                          idToken: googleAuth.idToken,
                          accessToken: googleAuth.accessToken);
                  final User user =
                      (await _firebaseAuth.signInWithCredential(credential))
                          .user;
                },
                color: neutralLightColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.google),
                    SizedBox(width: 10),
                    Text('Sign-in using Google',
                        style: grayTextStyle.copyWith(fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: backgroundColor, border: Border.all(color: blueColor)),
      child: TextField(
        controller: controller,
        style: grayTextStyle,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: grayTextStyle,
            icon: Icon(
              icon,
              color: blueColor,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}

_signInGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  final User user = (await _firebaseAuth.signInWithCredential(credential)).user;
}
