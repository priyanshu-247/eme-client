import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_up/models/user.dart';
import 'package:sign_up/screens/auth/auth.dart';
import 'package:sign_up/screens/home/home.dart';

class Conn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return Auth();
    }
    else{
      return Home();
    }
    
  }
}