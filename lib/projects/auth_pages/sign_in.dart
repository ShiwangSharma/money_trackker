import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});
  Future<String?>? _authenticateUsers(LoginData data) {
    print('authenticate users');
    return Future.delayed(Duration(seconds: 1)).then((_) => null);
  }

  Future<String?>? _signupUsers(SignupData data) {
    print('signup users');
    return Future.delayed(Duration(seconds: 1)).then((_) => null);
  }
  Future<String?>? _onRecoverPassword(String name) {
    print('onRecoverPassword for user: $name');
    return Future.delayed(Duration(seconds: 1)).then((_) => null);
  }


  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return FlutterLogin(
      title: 'MMAS',
      logo: 'images/splash_screen.png',
      onSignup: _signupUsers,
      onLogin: _authenticateUsers,
      onRecoverPassword: _onRecoverPassword,
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      messages: LoginMessages(
        userHint: 'User',
        passwordHint: 'Pass',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot huh?',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription: 'recoverPasswordDescription',
        recoverPasswordSuccess: 'Password rescued successfully',
      ),
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            print('start google sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
            print('start facebook sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop facebook sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          callback: () async {
            print('start linkdin sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop linkdin sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            print('start github sign in');
            await Future.delayed(Duration(seconds: 1));
            print('stop github sign in');
            return null;
          },
        ),
      ],
      theme: LoginTheme(
        primaryColor: Colors.teal,
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
        bodyStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: const TextStyle(
          color: Colors.orange,
          shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.yellow,
        ),
        cardTheme: CardTheme(
          color: Colors.yellow.shade100,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.white,
          ),
          labelStyle: TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.purple,
          backgroundColor: Colors.pinkAccent,
          highlightColor: Colors.lightGreen,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
      ),
    );
  }
}
