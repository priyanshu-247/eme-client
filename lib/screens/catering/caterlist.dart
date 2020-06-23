import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_up/models/caters.dart';
import 'package:sign_up/screens/catering/catercard.dart';

class CaterList extends StatefulWidget {
  CaterList({Key key}) : super(key: key);

  @override
  _CaterListState createState() => _CaterListState();
}

class _CaterListState extends State<CaterList> {
  @override
  Widget build(BuildContext context) {
    final caters = Provider.of<List<Caters>>(context) ?? [];
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CaterCard(
                caters: caters[index],
              );
            },
            childCount: caters.length,
          ),
        ),
      ],
    );
  }
}
