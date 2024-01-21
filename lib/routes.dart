import 'package:flutter/widgets.dart';
import 'package:plantix/modules/control/control.dart';
import 'package:plantix/modules/dashboard/dashboard.dart';
import 'package:plantix/modules/report/report.dart';
import 'package:plantix/modules/splash_screen/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Splash_screen.routeName: (context) => Splash_screen(),
  Dashboard.routeName: (context) => Dashboard(),
  Control.routeName: (context) => Control(),
  Report.routeName: (context) => Report(),
};
