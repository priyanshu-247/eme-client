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
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomNav(
              title: "Enquiry",
              backColor: Colors.white54,
              textColor: Colors.black54,
            ),
            BottomNav(
              title: "Book Now",
              backColor: Colors.redAccent,
              textColor: Colors.white54,
            ),
          ],
        ),
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

class BottomNav extends StatefulWidget {
  const BottomNav({Key key, this.title, this.backColor, this.textColor})
      : super(key: key);
  final String title;
  final Color backColor;
  final Color textColor;

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  double width = 0.45;
  bool _istapped = false;
  void changeWidth() {
    setState(() {
      if (_istapped) {
        width += 0.05;
        _istapped = false;
      } else {
        width -= 0.05;
        _istapped = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {changeWidth()},
      child: Container(
          width: MediaQuery.of(context).size.width * width,
          height: 50,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: widget.backColor,
              border: Border.all(color: Colors.black54, width: 1)),
          child: Center(
              child: Text(
            widget.title,
            style:
                TextStyle(color: widget.textColor, fontWeight: FontWeight.w700),
          ))),
    );
  }
}
