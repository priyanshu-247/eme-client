import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:sign_up/models/caters.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CaterDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cater = Sailor.args<Caters>(context);
    List<String> images = cater.imageUrl;
    // Future<String> name() async {
    //   return cater.catersName;
    // }

    // String namedisplay = name().toString();
    // final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        child: Text('Enquiry'),
      ),
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(cater.catersName),
            Text(
              'Powered by EME',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        backgroundColor: Colors.redAccent[400],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1,
                    enlargeCenterPage: false),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.redAccent),
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 4.0, color: Colors.redAccent),
                            image: DecorationImage(
                              image: NetworkImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cater.catersName.toUpperCase(),
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
