import 'package:flutter/material.dart';
import 'package:sign_up/screens/home/profileDrawer.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.all(2.0),
      children: <Widget>[
        ProfileDrawer(),
        ListTile(
          leading: Icon(Icons.home, color: Colors.redAccent),
          title: Text('Destination Wedding'),
          trailing: Text('New',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        ),
      ],
    ));
  }
}
