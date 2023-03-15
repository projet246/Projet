import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorttrash/pages/niveaux.dart';
import 'startPage/start_page.dart';
import 'pages/main_menu.dart';
import 'pages/games.dart';
import 'sort_game/Levels/levels_managment.dart';
import 'sort_game/Screens/main_menu.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MaterialApp(
    initialRoute: '/StartPage',
    routes: {
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
      '/tri' : (context) => MainMenu(),
      '/StartPage' : (context) =>  StartPage(),
      '/Niveaux' :(context) => const Niveaux(),
    },
  ));
}

class MySortGame extends StatelessWidget {
  LevelManagement levelManagement = LevelManagement();
  MySortGame({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MainMenu(),
    );
  }
}

