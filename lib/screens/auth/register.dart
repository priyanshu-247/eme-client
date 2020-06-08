import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sign_up/services/firebase_auth_service.dart';

import 'package:sign_up/shared/constants.dart';
import 'package:sign_up/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toogleView;
  Register({this.toogleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  void errorFlushBar(BuildContext context, String error) {
    Flushbar(
      // There is also a messageText property for when you want to
      // use a Text widget and not just a simple String
      message: error,
      backgroundColor: Colors.redAccent[100],
      // Even the button can be styled to your heart's content
      duration: Duration(seconds: 3),
      // Show it with a cascading operator
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
        backgroundColor: Colors.redAccent[50],
        appBar: AppBar(
          title: Text('EME'),
          backgroundColor: Colors.redAccent[400],
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                widget.toogleView();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('Sign In'),
              textColor: Colors.white,
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 8
                      ? 'Enter an password with 8+ length'
                      : null,
                  onChanged: (val) {
                    setState(() => {password = val});
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    child: Text('Register'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'please supply the valid email';
                            loading = false;
                          });
                          errorFlushBar(context, error);
                        }
                        print(email);
                        print(password);
                      }
                    },
                    color: Colors.redAccent[400],
                    textColor: Colors.white),
              ])),
        ));
  }
}
