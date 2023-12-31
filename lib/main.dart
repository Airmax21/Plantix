import 'package:flutter/material.dart';
import 'package:plantix/tools/NotificationService.dart';
import 'package:plantix/tools/MqttHandler.dart';
import 'package:plantix/modules/splash_screen/Splash_screen.dart';
import 'package:plantix/routes.dart';
import 'package:plantix/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plantix',
      theme: theme(),
      initialRoute: Splash_screen.routeName,
      routes: routes,
    );
  }
}
