import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorttrash/Puzzle/Models/TrashCans.dart';
import 'package:sorttrash/Puzzle/main_puzzle.dart';
import 'package:sorttrash/pages/niveaux.dart';
import 'package:sorttrash/profile.dart';
import 'Puzzle/Models/Objects.dart';
import 'Puzzle/Models/puzzle_management.dart';
import 'Puzzle/puzzle_levels.dart';
import 'StartPage/LoginPage/login_page.dart';
import 'StartPage/RegisterPage/register_page.dart';
import 'BackEnd/AuthService/verify_user.dart';
import 'StartPage/start_page.dart';
import 'pages/main_menu.dart';
import 'pages/games.dart';
import 'sort_game/Levels/levels_managment.dart';
import 'sort_game/Screens/main_menu.dart';
import 'quiz/quizmultiples.dart';
import 'quiz/quizgestes.dart';
import 'quiz/quizphotos.dart';
import 'quiz/NiveauxQuiz.dart';
import 'quiz/managementQuiz.dart';

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
  PuzzleManagement puzzleManagement = PuzzleManagement();
  Niveaux niveaux = Niveaux(
    levelMangement: levelmangement,
    NbrNiveax: 5,
    OpenLevels: 1,
    href: '/',
  );
  

  Management man = Management();
  NiveauxQuiz N = NiveauxQuiz(NbrNiveax: 5, OpenLevels: 1, href: '/' , levelMangement: man,);
  PuzzleLevels puzzleLevels = PuzzleLevels(
    nbrNiveax: 5,
    openLevels: 1,
    levelMangement: puzzleManagement,
    href: '/',
  );
  bool decoyMethod(bool te) {
    return false;
  }

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
      '/ProfilePage': (context) => const ProfilePage(),
      '/RegisterPage': (context) => const RegisterPage(),
      '/VerifyUserEmail': (context) => const VerifyUserEmail(),
      '/Nquiz': (context) => N,

      '/Puzzles' : (context) =>  puzzleLevels,
      '/QuizGestes': (context) => const QuizGestes(
            question:
                "Quel est le bon geste quand j'ai des documents à imprimer",
            photo1: "",
            photo2: "",
          ),
      '/PuzzleLevel' : (context) =>  PuzzleLevel(
        isLocked: false,
        arrayOfPuzzlePieces: puzzleLevel1Array,
        arrayOfSquares: puzzleArray,
        matrixSSize: 4,
        timeCount: 100,
        changeBooleanStatus: decoyMethod, imageName: 'assets/images/puzzle_level1.jpg',
      ),
    },
  ));
}

class MySortGame extends StatelessWidget {
  const MySortGame({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}
