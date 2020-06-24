import 'package:sailor/sailor.dart';
import 'package:sign_up/screens/catering/caterdetail.dart';
import 'package:sign_up/screens/catering/catering.dart';
import 'package:sign_up/screens/destwed/destwed.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoute(SailorRoute(
      name: "/destwed",
      builder: (context, args, params) {
        return Destwed();
      },
    ));
    sailor.addRoute(SailorRoute(
      name: "/catering",
      builder: (context, args, params) {
        return Catering();
      },
    ));
    sailor.addRoute(SailorRoute(
        name: "/caterdetail",
        builder: (context, params, args) => CaterDetail()));
  }
}
