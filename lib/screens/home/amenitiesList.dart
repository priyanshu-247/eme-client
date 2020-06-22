import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_up/models/amenity.dart';
import 'package:sign_up/screens/home/amenityCard.dart';

class AmenitiesList extends StatefulWidget {
  @override
  _AmenitiesListState createState() => _AmenitiesListState();
}

class _AmenitiesListState extends State<AmenitiesList> {
  @override
  Widget build(BuildContext context) {
    final amenites = Provider.of<List<Amenity>>(context) ?? [];

    return Container(
        height: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16, right: 6),
              itemCount: amenites.length,
              itemBuilder: (context, index) {
                return AmenityCard(
                  amenity: amenites[index],
                );
              }),
        ));
  }
}
