import 'package:ever_green/pages/games.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ever_green/pages/main_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
    },
  ));
}
