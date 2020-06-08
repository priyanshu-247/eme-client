import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_up/models/user.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return UserAccountsDrawerHeader(
      accountName: Text(user.displayName ?? 'Awesome Guest'),
      accountEmail: Text(user.email ?? 'awesomeGuest@eme.com'),
      currentAccountPicture:
          CircleAvatar(backgroundImage: NetworkImage(user.photoUrl ?? ''),),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.redAccent,
          Colors.red,
        ]),
      ),
    );
  }
}