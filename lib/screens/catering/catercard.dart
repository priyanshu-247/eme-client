import 'package:flutter/material.dart';
import 'package:sign_up/models/caters.dart';
import 'package:sign_up/routes/routes.dart';

class CaterCard extends StatelessWidget {
  final Caters caters;
  CaterCard({this.caters});

  @override
  Widget build(BuildContext context) {
    String priceRange = "Rs." +
        caters.minPricePerPlate.toString() +
        "- Rs." +
        caters.maxPricePerPlate.toString();
    return InkWell(
      onTap: () {
        Routes.sailor.navigate("/caterdetail",
            args: Caters(
                catersName: caters.catersName,
                caterId: caters.caterId,
                catersAbout: caters.catersAbout,
                imageUrl: caters.imageUrl));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(caters.imageUrl[0]),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(width: 4.0, color: Colors.red),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3.0, color: Colors.redAccent),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                // boxShadow: [
                //   BoxShadow(
                //       blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                // ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        caters.catersName.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        caters.catersAbout.toLowerCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "Price per Plate   $priceRange",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                              color: Colors.lightBlue),
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Text(
                      caters.catersRating.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
