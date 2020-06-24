import 'package:sailor/sailor.dart';

class Caters extends BaseArguments {
  String catersName;
  int catersRating;
  String catersAbout;
  int minPricePerPlate;
  int maxPricePerPlate;
  int caterId;
  String imageUrl;

  Caters(
      {this.catersAbout,
      this.catersName,
      this.catersRating,
      this.maxPricePerPlate,
      this.minPricePerPlate,
      this.caterId,
      this.imageUrl});
}
