import 'package:flutter/material.dart';
import 'package:sign_up/routes/routes.dart';

class Catering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.redAccent[100 * (index % 9)],
                    child: Text('List Item $index'),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
