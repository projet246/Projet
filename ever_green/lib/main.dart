import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorttrash/pages/niveaux.dart';
import 'startPage/start_page.dart';
import 'pages/main_menu.dart';
import 'pages/games.dart';
import 'sort_game/Levels/levels_managment.dart';
import 'sort_game/Screens/main_menu.dart';
import 'dart:ui' as ui;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIOverlays([]);

  //les variables globals du main

  double width = ui.window.physicalSize.width; //retourne le width de l'ecran
  double height = ui.window.physicalSize.height; //retourne le height de l'ecran

  runApp(MaterialApp(
    initialRoute: '/Niveaux',
    routes: {
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
      '/tri': (context) => MainMenu(),
      '/StartPage': (context) => StartPage(),
      '/Niveaux': (context) => new Niveaux(
            NbrNiveax: 7,
          ),
    },
  ));
}

class MySortGame extends StatelessWidget {
  LevelManagement levelManagement = LevelManagement();
  MySortGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}
