import 'package:flutter/material.dart';
import 'package:sign_up/screens/auth/register.dart';
import 'package:sign_up/screens/auth/sign_in.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool showSignIn = true;

  void toogleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toogleView: toogleView);
    }else {
      return Register(toogleView: toogleView);
    }
  }
}

