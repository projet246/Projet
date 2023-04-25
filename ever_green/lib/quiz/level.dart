import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../BackEnd/PlayerProgress/player.dart';
import '../player_box.dart';
import 'quizphotos.dart';
import 'package:sorttrash/quiz/quizmultiples.dart';
import 'package:sorttrash/quiz/quizgestes.dart';

class Level extends StatefulWidget {

  late Function(bool) _changeBooleanStatus;
  List<Widget> liste = [
    const QuizMultiples(
      question: "Que signifie le terme \"recyclage\" ?",
      reponse1: "Transformer des déchets en de nouveaux produits",
      reponse2: "Jeter des déchets dans une décharge",
      reponse3: "Brûler des déchets pour produire de l'énergie",
      reponse4: "Nettoyer l'environnement du déchets",
      reponseCorrecte: 1,
    ),
    const QuizMultiples(
      question: "Quelle est la première étape du recyclage ?",
      reponse1: "Le broyage des matériaux",
      reponse2: "Le tri des déchets",
      reponse3: "La collecte des déchets",
      reponse4: "Le nettoyage des déchets",
      reponseCorrecte: 3,
    ),
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
    const QuizMultiples(
      question: "Avant de commencer le processus de recyclage , on doit trier les ordures selon : ",
      reponse1: "La couleur",
      reponse2: "Le type",
      reponse3: "Le volume",
      reponse4: "L'odeur",
      reponseCorrecte: 2,
    ),
    
    const QuizMultiples(
      question: "Quels sont les matériaux les plus couramment recyclés ?",
      reponse1: "Le plastique et le papier",
      reponse2: "Le carton",
      reponse3: "Le métal et le bois",
      reponse4: "Le verre",
      reponseCorrecte: 1,
    ),
    QuizPhotosDesign(
        quizPhotos: QuizPhotos(
      question: "Quel matériau peut être recyclé pour faire des canettes ?",
      photoQuestion: "assets/images/canette.png",
      reponse1: "Du verre",
      photo1: "assets/images/verre.png",
      reponse2: "Du carton",
      photo2: "assets/images/cartoon.png",
      reponse3: "Du métal",
      photo3: "assets/images/metall.png",
      reponse4: "D'aliminium",
      photo4: "assets/images/aluminium.png",
      reponseCorrecte: 4,
    )),
    const QuizGestes(
      question: "Quel est le bon geste quand j'ai des documents à imprimer",
      photo1: "assets/images/bongeste.jpg",
      photo2: "assets/images/mauvaisgeste.jpg",
      reponseCorrecte: 1,
    ),
    
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


  bool returnIsLocked() {
    return _isLocked;
  }


  void setIsLocked(bool isUnlockde) {
    _isLocked = isUnlockde;
  }



  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  final User? user = FirebaseAuth.instance.currentUser;
  late PlayerProgress playerProgress = currentProfileIndex == 1
      ? offlineProgress.returnParent().children[globalChildKey]
      : onlineProgress.returnParent().children[onlineGlobalChildKey];
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

                            widget._changeBooleanStatus(false);
                            String newLevelsCompleted = playerProgress
                                .gamesData[2].levelsCompleted
                                .replaceFirst('0', '1');
                            playerProgress.gamesData[2].levelsCompleted = newLevelsCompleted;
                            try {
                              if (currentProfileIndex == 1) {
                                offlineProgress.setChild(globalChildKey, playerProgress);
                                if (parentBox.isEmpty) {
                                  parentBox.add(offlineProgress);
                                }else{
                                  parentBox.putAt(0, offlineProgress.returnParent());
                                }
                              } else {
                                onlineProgress.setChild(onlineGlobalChildKey, playerProgress);
                                onlineParentBox.put(user!.uid, onlineProgress.returnParent());
                                onlineProgress.returnParent().updateData(onlineProgress.getUID());
                              }
                            } catch (e) {
                              print(e);
                            }
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/Nquiz');
                          }),
                    child: widget._currentIndex < widget.liste.length - 1
                        ? const Text("c'est fait")
                        : const Text("NEXT LEVEL"),
                  )
                ],
              )),
        )
      ]),
    ));
  }
}
