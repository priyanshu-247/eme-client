import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_up/models/caters.dart';
import 'package:sign_up/routes/routes.dart';
import 'package:sign_up/screens/catering/caterlist.dart';
import 'package:sign_up/services/cloudfirestore_db_service.dart';

class Catering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Caters>>.value(
      value: DatabaseService().caterList,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text('Catering'),
              Text(
                'Powered by EME',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          backgroundColor: Colors.redAccent[400],
          centerTitle: true,
        ),
        body: CaterList(),
      ),
    );
  }
}
