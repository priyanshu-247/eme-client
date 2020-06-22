import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sign_up/models/amenity.dart';
import 'package:sign_up/routes/routes.dart';

class AmenityCard extends StatelessWidget {
  final Amenity amenity;

  AmenityCard({this.amenity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routes.sailor.navigate(amenity.route);
      },
      child: AspectRatio(
        aspectRatio: 1.5 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            border:Border.all(width:4.0,color:Colors.red),
            borderRadius: BorderRadius.circular(0),
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.redAccent,
              Colors.red,
            ]),
            image: DecorationImage(
              alignment: Alignment.center,
                image: CachedNetworkImageProvider(amenity.imgPath),
                fit: BoxFit.cover),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2)
                ])),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  amenity.amenityName,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
        ),
      ),
    );
  }
}