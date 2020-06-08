import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:sign_up/models/amenity.dart';
// import 'package:sign_up/models/user.dart';
import 'package:sign_up/screens/home/amenitiesList.dart';
import 'package:sign_up/screens/home/homebanner.dart';
import 'package:sign_up/screens/home/profileDrawer.dart';
import 'package:sign_up/screens/home/titleBar.dart';
import 'package:sign_up/services/cloudfirestore_db_service.dart';
import 'package:sign_up/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  // ? String greet = greeting();

  @override
  Widget build(BuildContext context) {
    // ? final user = Provider.of<User>(context);
    return StreamProvider<List<Amenity>>.value(
      value: DatabaseService().emeAmenitiesList,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          centerTitle: true,
          title: Text(
            'EME',
            style: TextStyle(),
          ),
          backgroundColor: Colors.redAccent[400],
          elevation: 1.1,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('logout'),
              textColor: Colors.white,
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            ProfileDrawer(),
            ListTile(
              leading: Icon(Icons.home, color: Colors.redAccent),
              title: Text('Destination Wedding'),
              trailing: Text('New',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          ],
        )),
        body: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            HomeBanner(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            TitleBar(title: "Our Collections" ),
            AmenitiesList(),
          ],
        ),
      ),
    );
  }
}



// ? String greeting() {
// ?   var hour = DateTime.now().hour;
// ?   if (hour < 12) {
// ?     return 'Morning';
// ?   }
// ?   if (hour < 17) {   
// ?     return 'Afternoon';
// ?   }
// ?   return 'Evening';
// ? }
 
// !Padding(
// !  padding: const EdgeInsets.only(left: 16, bottom: 30),
// !  child: Column(
// !    crossAxisAlignment: CrossAxisAlignment.center,
// !    children: <Widget>[
// !      Text(
// !        'Good $greet',
// !        style: GoogleFonts.inter(
// !            fontSize: 16,
// !            fontWeight: FontWeight.w500,
// !            color: Colors.blueGrey,
// !            letterSpacing: 2.0),
// !      ),
// !      Text(
// !        user.displayName ?? 'Guest',
// !        style: GoogleFonts.inter(
// !          fontSize: 20,
// !          fontWeight: FontWeight.w700,
// !          color: Colors.redAccent,
// !          letterSpacing: 1.5,
// !        ),
// !      )
// !    ],
// !  ),
// !)
