import 'package:flutter/material.dart';

class Destwed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('Destination Wedding'),
            Text('Powered by EME',style: TextStyle(fontSize:14),)
          ],
        ),
        backgroundColor: Colors.redAccent[400],
        centerTitle: true,
      ),
      body: Center(
        child: Container(child: Text('destination wedding')),
      ),
    );
  }
}
