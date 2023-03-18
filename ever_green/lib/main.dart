
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorttrash/pages/niveaux.dart';
import 'package:sorttrash/profile.dart';
import 'StartPage/LoginPage/login_page.dart';
import 'StartPage/RegisterPage/register_page.dart';
import 'BackEnd/AuthService/verify_user.dart';
import 'StartPage/start_page.dart';
import 'pages/main_menu.dart';
import 'pages/games.dart';
import 'sort_game/Levels/levels_managment.dart';
import 'sort_game/Screens/main_menu.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await Firebase.initializeApp();
  //les variables globals du main
  // double width = ui.window.physicalSize.width; //retourne le width de l'ecran
  // double height = ui.window.physicalSize.height; //retourne le height de l'ecran
  LevelManagement levelmangement = LevelManagement();
  Niveaux niveaux =  Niveaux(
    levelMangement: levelmangement,
    NbrNiveax: 5,
    OpenLevels: 1,
    href: '/',
  );
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    initialRoute:
        '/StartPage', //le widget Niveaux sera utilisé pour l'affichage du niveaux, lors de la construction on lui fais passer le nombre de niveaux aux total et le nombre de niveaux unlocked et le href qui sera un routename pour lier
    routes: {
      '/StartPage': (context) => StartPage(),
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
      '/tri': (context) => MainMenu(),
      '/Niveaux': (context) => niveaux,
      '/LoginPage': (context) => const LoginPage(),
      '/ProfilePage' : (context) => const ProfilePage(),
      '/RegisterPage' : (context) => const RegisterPage(),
      '/VerifyUserEmail' : (context) => const VerifyUserEmail(),
    },
  ));
}

class MySortGame extends StatelessWidget {
  MySortGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}
