import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'quizphotos.dart';
import 'package:sorttrash/quiz/quizmultiples.dart';
import 'package:sorttrash/quiz/quizgestes.dart';

class Level extends StatefulWidget {
  late Function(bool) _changeBooleanStatus;
  List<Widget> liste = [
    QuizPhotosDesign(
      quizPhotos: QuizPhotos(
        question: "JE PEUX TRANSFORMER UNE BOITE A CHAUSSURES VIDES EN :",
        photoQuestion: "assets/images/chaussures.png",
        reponse1: "UNE BOITE DE CEREALES",
        photo1: "assets/images/cereals.png",
        reponse2: "DES CARTONS DE DEMANEGEMENT",
        photo2: "assets/images/carton.png",
        reponse3: "DU PAPIER TOILETTES",
        photo3: "assets/images/papier.png",
        reponse4: "UN SAC A DOS",
        photo4: "assets/images/sac.png",
        reponseCorrecte: 2,
      ),
    ),
    QuizPhotosDesign(
        quizPhotos: QuizPhotos(
      question: "JE PEUXA CHAUSSURES VIDES EN :",
      photoQuestion: "assets/images/chaussures.png",
      reponse1: "UNE BOITE DE CEREALES",
      photo1: "assets/images/cereals.png",
      reponse2: "DES CARTONS DE DEMANEGEMENT",
      photo2: "assets/images/carton.png",
      reponse3: "DU PAPIER TOILETTES",
      photo3: "assets/images/papier.png",
      reponse4: "UN SAC A DOS",
      photo4: "assets/images/sac.png",
      reponseCorrecte: 2,
    )),
    const QuizMultiples(
      question: "A ton avis à quoi sert de faire du compost ?",
      reponse1: "A nourir le sol du jardin",
      reponse2: "A rempoter les pots de fleurs",
      reponse3: "A reduire les poids de ma poubelle",
      reponse4: "A nourir le sol du jardin",
      reponseCorrecte: 1,
    ),
    const QuizGestes(
      question: "Quel est le bon geste quand j'ai des documents à imprimer",
      photo1: "assets/images/blue.png",
      photo2: "assets/images/blue.png",
      reponseCorrecte: 1,
    ),
    QuizPhotosDesign(
        quizPhotos: QuizPhotos(
      question: "JEEN :",
      photoQuestion: "assets/images/chaussures.png",
      reponse1: "UNE BOIREALES",
      photo1: "assets/images/cereals.png",
      reponse2: "DES CARTONS DE DEMANEGEMENT",
      photo2: "assets/images/carton.png",
      reponse3: "DU PAPIER TOILETTES",
      photo3: "assets/images/papier.png",
      reponse4: "UN SAC ",
      photo4: "assets/images/sac.png",
      reponseCorrecte: 2,
    )),
  ];
  int _currentIndex = -1;
  Level(
      {super.key,
      required Function(bool) changeBooleanStatus,
      required bool isLocked}) {
    _changeBooleanStatus = changeBooleanStatus;
    _isLocked = isLocked;
  }
  bool _isLocked = false;
  bool _isFinished = false;

  bool returnIsLocked() {
    return _isLocked;
  }

  bool returnIsFinished() {
    return _isFinished;
  }

  void setIsLocked(bool isUnlockde) {
    _isLocked = isUnlockde;
  }

  void setIsFinished(bool isFinished) {
    _isFinished = isFinished;
  }

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(children: [
        Container(
          //le container qui contient le bg image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0.2 * MediaQuery.of(context).size.height,
          left: 0.05 * MediaQuery.of(context).size.width,
          child: Container(
              height: 0.6 * MediaQuery.of(context).size.height,
              width: 0.9 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color.fromARGB(211, 178, 158, 211),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 0.2 * MediaQuery.of(context).size.height,
                  ),
                  widget._currentIndex < widget.liste.length - 1
                      ? Text(
                          "Preparez vous pour le quiz numéro ${widget._currentIndex + 2} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        )
                      : const Text(
                          "Vous avez terminez ce niveau",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                  SizedBox(
                    height: 0.05 * MediaQuery.of(context).size.height,
                  ),
                  ElevatedButton(
                    onPressed: widget._currentIndex < widget.liste.length - 1
                        ? () {
                            setState(() {
                              widget._currentIndex += 1;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      widget.liste[widget._currentIndex]),
                            );
                          }
                        : (() {
                            widget.setIsFinished(true);
                            widget._changeBooleanStatus(false);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/Nquiz');
                          }),
                    child: widget._currentIndex < widget.liste.length - 1
                        ? Text("c'est fait")
                        : Text("NEXT LEVEL"),
                  )
                ],
              )),
        )
      ]),
    ));
  }
}
