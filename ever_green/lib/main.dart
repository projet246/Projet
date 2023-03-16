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
    initialRoute: '/Niveaux', //le widget Niveaux sera utilisé pour l'affichage du niveaux, lors de la construction on lui fais passer le nombre de niveaux aux total et le nombre de niveaux unlocked et le href qui sera un routename pour lier
    routes: {
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
      '/tri': (context) => MainMenu(),
      '/StartPage': (context) => StartPage(),
      '/Niveaux': (context) => const Niveaux(
            NbrNiveax: 7,
            OpenLevels: 1,
            href: '/',
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
