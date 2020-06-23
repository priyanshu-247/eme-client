import 'package:flutter/material.dart';
import 'package:sign_up/models/caters.dart';

class CaterCard extends StatelessWidget {
  final Caters caters;
  CaterCard({this.caters});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Text(caters.catersAbout),
      ),
    );
  }
}
