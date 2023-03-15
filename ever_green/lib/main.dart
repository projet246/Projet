import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorttrash/StartPage/start_page.dart';
import 'package:sorttrash/pages/games.dart';
import 'package:sorttrash/pages/main_menu.dart';
import 'package:sorttrash/sort_game/Levels/levels_managment.dart';
import 'package:sorttrash/sort_game/Screens/main_menu.dart';


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

