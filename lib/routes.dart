import 'package:flutter/widgets.dart';
import 'package:plantix/modules/console/mqtt.dart';
import 'package:plantix/modules/dashboard/dashboard.dart';
import 'package:plantix/modules/splash_screen/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Splash_screen.routeName: (context) => Splash_screen(),
  Mqtt.routeName: (context) => Mqtt(),
  Dashboard.routeName: (context) => Dashboard(),
};
