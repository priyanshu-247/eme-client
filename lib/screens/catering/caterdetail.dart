import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:sign_up/models/caters.dart';

class CaterDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cater = Sailor.args<Caters>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Caterdetail"),
      ),
      body: Center(
        child: Text(
          cater.caterId.toString(),
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}
