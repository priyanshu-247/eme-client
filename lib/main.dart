import 'package:flutter/material.dart';
import 'package:sign_up/eme_Splash.dart';
import 'package:sign_up/routes/routes.dart';

import 'package:provider/provider.dart';
// import 'package:sign_up/screens/conn.dart';
import 'package:sign_up/services/firebase_auth_service.dart';
import 'package:sign_up/models/user.dart';

void main() {
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EMESplash(),
        navigatorKey: Routes.sailor.navigatorKey, // important
        onGenerateRoute: Routes.sailor.generator(),
      ),
    );
  }
}
