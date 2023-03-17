import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorttrash/pages/niveaux.dart';
import 'StartPage/start_page.dart';
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
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  //les variables globals du main
  // double width = ui.window.physicalSize.width; //retourne le width de l'ecran
  // double height = ui.window.physicalSize.height; //retourne le height de l'ecran
  LevelManagement _levelmangement = LevelManagement();
  Niveaux niveaux = Niveaux(
    levelMangement: _levelmangement,
    NbrNiveax: 5,
    OpenLevels: 1,
    href: '/',
  );
  runApp(MaterialApp(
    initialRoute:
        '/Niveaux', //le widget Niveaux sera utilisé pour l'affichage du niveaux, lors de la construction on lui fais passer le nombre de niveaux aux total et le nombre de niveaux unlocked et le href qui sera un routename pour lier
    routes: {
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
      '/tri': (context) => MainMenu(),
      '/StartPage': (context) => StartPage(),
      '/Niveaux': (context) => niveaux
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
