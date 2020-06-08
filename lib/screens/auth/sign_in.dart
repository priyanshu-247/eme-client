import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sign_up/services/firebase_auth_service.dart';
import 'package:sign_up/shared/constants.dart';
import 'package:sign_up/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;
  SignIn({this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  // form global key
  final _formKey = GlobalKey<FormState>();
  // loading status
  bool loading = false;

  // save state of email and password
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
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.redAccent[50],
            appBar: AppBar(
              title: Text('EME'),
              backgroundColor: Colors.redAccent[400],
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: widget.toogleView,
                  icon: Icon(
                    Icons.flash_on,
                    color: Colors.white,
                  ),
                  label: Text('Register'),
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
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) => val.length < 8
                          ? 'Enter an password with 8+ length'
                          : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => {password = val});
                      },
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                            color: Colors.redAccent[400],
                            textColor: Colors.white,
                            child: Text('Anonymous'),
                            onPressed: () async {
                              dynamic result = await _auth.signInAnom();
                              if (result == null) {
                                print('error_occured');
                              } else {
                                print('sign in');
                                // print(result.uid);
                              }
                            }),
                        RaisedButton(
                            child: Text('Login'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'could not sign in with those credintials';
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
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Social Login',style: TextStyle(
                      letterSpacing: 2.0,fontSize: 16.0
                    ),),
                    SizedBox(height: 20),
                    OutlineButton(
                      splashColor: Colors.white,
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithGoogle();
                        if (result == null) {
                          setState(() {
                            error = 'could not sign in with those credintials';
                            loading = false;
                          });
                          errorFlushBar(context, error);
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      highlightElevation: 0,
                      borderSide: BorderSide(color: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/google_logo.png"),
                                height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ])),
            ));
  }
}

// onPressed: () async {
//   dynamic result = await _auth.signInAnom();
//   if (result == null) {
//     print('error_occured');
//   } else {
//     print('sign in');
//     print(result.uid);
//   }
// },
