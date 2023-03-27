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
import 'pages/quizmultiples.dart';
import 'pages/quizgestes.dart';
import 'pages/quizphotos.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await Firebase.initializeApp();
  LevelManagement levelmangement = LevelManagement();
  Niveaux niveaux = Niveaux(
    levelMangement: levelmangement,
    NbrNiveax: 5,
    OpenLevels: 1,
    href: '/',
  );
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    initialRoute:
        // '/StartPage', //le widget Niveaux sera utilisé pour l'affichage du niveaux, lors de la construction on lui fais passer le nombre de niveaux aux total et le nombre de niveaux unlocked et le href qui sera un routename pour lier
        '/QuizPhotos',
    routes: {
      '/StartPage': (context) => StartPage(),
      '/': (context) => const mainMenu(),
      '/games': (context) => const GamesMenu(),
      '/tri': (context) => MainMenu(),
      '/Niveaux': (context) => niveaux,
      '/LoginPage': (context) => const LoginPage(),
      '/ProfilePage': (context) => const ProfilePage(),
      '/RegisterPage': (context) => const RegisterPage(),
      '/VerifyUserEmail': (context) => const VerifyUserEmail(),
      '/QuizGestes': (context) => const QuizGestes(
            question:
                "Quel est le bon geste quand j'ai des documents à imprimer",
            photo1: "",
            photo2: "",
          ),
      '/QuizMultiples': (context) => const QuizMultiples(
            question: "A ton avis à quoi sert de faire du compost ?",
            reponse1: "A nourir le sol du jardin",
            reponse2: "A rempoter les pots de fleurs",
            reponse3: "A reduire les poids de ma poubelle",
            reponse4: "A nourir le sol du jardin",
          ),
      '/QuizPhotos': (context) => QuizPhotos(),
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
