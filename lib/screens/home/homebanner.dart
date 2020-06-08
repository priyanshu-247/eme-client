import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  final screenHeight;

  const HomeBanner({Key key, @required this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.3,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/banner.png'), fit: BoxFit.fill)),
        // child: Stack(children: <Widget>[
        //   Positioned(
        //       width: 80,
        //       height: 80,
        //       child: Container(
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage('assets/loveonbanner.png'))),
        //       )),
        //   Positioned(
        //       right: 0,
        //       width: 50,
        //       height: 0,
        //       child: Container(
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage('assets/loveonbanner.png'))),
        //       ))
        // ])
    );
  }
}
