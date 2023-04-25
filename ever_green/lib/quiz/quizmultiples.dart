import 'package:flutter/material.dart';
import '../button.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizMultiples extends StatefulWidget {
  final String question;
  final String reponse1;
  final String reponse2;
  final String reponse3;
  final String reponse4;
  final int reponseCorrecte; //pour indiquer le numero de la reponse correcte
  const QuizMultiples({
    super.key,
    required this.question,
    required this.reponse1,
    required this.reponse2,
    required this.reponse3,
    required this.reponse4,
    required this.reponseCorrecte,
  });

  @override
  State<QuizMultiples> createState() => _QuizMultiplesState();
}

class _QuizMultiplesState extends State<QuizMultiples> {
  final _player = AudioPlayer();
  final _audio = AudioCache();
  int? reponseUtilisateur;
  String showState = "none";
  Future<void> waitAndPop() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

  @override
  void initState() {
    _audio.load('music/correct.mp3');
    _audio.load('music/wrong.mp3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-image3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 0.03 * MediaQuery.of(context).size.height,
            ),
            SizedBox(
              height: 0.15 * MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 20.0,
                      ),
                      RoundButton(
                          href: '/Nquiz',
                          myIcon: Icons.arrow_back,
                          couleur: Color.fromARGB(255, 102, 235, 0)),
                    ],
                  ),
                  Row(
                    children: const [
                      RoundButton(
                        href: '/',
                        myIcon: Icons.settings,
                        couleur: Color.fromRGBO(255, 210, 23, 5),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.02 * MediaQuery.of(context).size.height,
            ),
            Stack(
              children: [
                Container(
                  //le container qui contient le corps du quiz
                  height: 0.75 * MediaQuery.of(context).size.height,
                ),
                Positioned(
                  child: Center(
                    child: Container(
                      //le carré blanc qui contient les quiz
                      height: 0.7 * MediaQuery.of(context).size.height,
                      width: 0.75 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33.0),
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5),
                            offset: const Offset(0, 5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        //les reponses sont dans tous ce qui suit
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            //le container des questions
                            height: 0.2 * MediaQuery.of(context).size.height,
                            width: 0.6 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 220, 247),
                              borderRadius: BorderRadius.circular(18.0),
                              border: Border.all(
                                color:
                                    const Color.fromARGB(255, 251, 194, 240),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(181, 44, 43, 43)
                                      .withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Center(
                                child: Text(
                              widget.question,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 218, 78, 204),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          SizedBox(
                            //le container des reponses
                            height: 0.35 * MediaQuery.of(context).size.height,
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 1;
                                            showState =
                                                widget.reponseCorrecte == 1
                                                    ? "yes"
                                                    : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: SizedBox(
                                          height: 0.15 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.21 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: showState ==
                                                                "yes" &&
                                                            reponseUtilisateur ==
                                                                1
                                                        ? Colors.green
                                                        : showState == "no" &&
                                                                reponseUtilisateur ==
                                                                    1
                                                            ? Colors.red
                                                            : const Color
                                                                    .fromARGB(
                                                                255,
                                                                251,
                                                                194,
                                                                240),
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: Center(
                                                    child: Text(
                                                  widget.reponse1,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                )),
                                              ),
                                              Positioned(
                                                bottom: -1,
                                                right: -1,
                                                child: showState == "yes" &&
                                                        reponseUtilisateur ==
                                                            1
                                                    ? SizedBox(
                                                        height: 0.06 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        width: 0.03 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                        child: const Image(
                                                          image: AssetImage(
                                                              "assets/images/juste.png"),
                                                        ),
                                                      )
                                                    : showState == "no" &&
                                                            reponseUtilisateur ==
                                                                1
                                                        ? SizedBox(
                                                            height: 0.06 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            width: 0.03 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child:
                                                                const Image(
                                                              image: AssetImage(
                                                                  "assets/images/faux.png"),
                                                            ),
                                                          )
                                                        : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 2;
                                            showState =
                                                widget.reponseCorrecte == 2
                                                    ? "yes"
                                                    : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: SizedBox(
                                          height: 0.15 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.21 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: showState ==
                                                                "yes" &&
                                                            reponseUtilisateur ==
                                                                2
                                                        ? Colors.green
                                                        : showState == "no" &&
                                                                reponseUtilisateur ==
                                                                    2
                                                            ? Colors.red
                                                            : const Color
                                                                    .fromARGB(
                                                                255,
                                                                251,
                                                                194,
                                                                240),
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: Center(
                                                    child: Text(
                                                  widget.reponse2,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                )),
                                              ),
                                              Positioned(
                                                bottom: -1,
                                                right: -1,
                                                child: showState == "yes" &&
                                                        reponseUtilisateur ==
                                                            2
                                                    ? SizedBox(
                                                        height: 0.06 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        width: 0.03 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                        child: const Image(
                                                          image: AssetImage(
                                                              "assets/images/juste.png"),
                                                        ),
                                                      )
                                                    : showState == "no" &&
                                                            reponseUtilisateur ==
                                                                2
                                                        ? SizedBox(
                                                            height: 0.06 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            width: 0.03 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child:
                                                                const Image(
                                                              image: AssetImage(
                                                                  "assets/images/faux.png"),
                                                            ),
                                                          )
                                                        : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 3;
                                            showState =
                                                widget.reponseCorrecte == 3
                                                    ? "yes"
                                                    : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: SizedBox(
                                          height: 0.15 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.21 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: showState ==
                                                                "yes" &&
                                                            reponseUtilisateur ==
                                                                3
                                                        ? Colors.green
                                                        : showState == "no" &&
                                                                reponseUtilisateur ==
                                                                    3
                                                            ? Colors.red
                                                            : const Color
                                                                    .fromARGB(
                                                                255,
                                                                251,
                                                                194,
                                                                240),
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: Center(
                                                    child: Text(
                                                  widget.reponse3,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                )),
                                              ),
                                              Positioned(
                                                bottom: -1,
                                                right: -1,
                                                child: showState == "yes" &&
                                                        reponseUtilisateur ==
                                                            3
                                                    ? SizedBox(
                                                        height: 0.06 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        width: 0.03 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                        child: const Image(
                                                          image: AssetImage(
                                                              "assets/images/juste.png"),
                                                        ),
                                                      )
                                                    : showState == "no" &&
                                                            reponseUtilisateur ==
                                                                3
                                                        ? SizedBox(
                                                            height: 0.06 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            width: 0.03 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child:
                                                                const Image(
                                                              image: AssetImage(
                                                                  "assets/images/faux.png"),
                                                            ),
                                                          )
                                                        : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            reponseUtilisateur = 4;
                                            showState =
                                                widget.reponseCorrecte == 4
                                                    ? "yes"
                                                    : "no";
                                            if (showState == "yes") {
                                              _player.play(AssetSource(
                                                  'music/correct.mp3'));
                                              _player.stop();
                                            } else {
                                              _player.play(AssetSource(
                                                  'music/wrong.mp3'));
                                              _player.stop();
                                            }
                                          });
                                          await waitAndPop();
                                        },
                                        child: SizedBox(
                                          height: 0.15 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height,
                                          width: 0.21 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width,
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 0.13 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                width: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: showState ==
                                                                "yes" &&
                                                            reponseUtilisateur ==
                                                                4
                                                        ? Colors.green
                                                        : showState == "no" &&
                                                                reponseUtilisateur ==
                                                                    4
                                                            ? Colors.red
                                                            : const Color
                                                                    .fromARGB(
                                                                255,
                                                                251,
                                                                194,
                                                                240),
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: Center(
                                                    child: Text(
                                                  widget.reponse4,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 78, 204),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                )),
                                              ),
                                              Positioned(
                                                bottom: -1,
                                                right: -1,
                                                child: showState == "yes" &&
                                                        reponseUtilisateur ==
                                                            4
                                                    ? SizedBox(
                                                        height: 0.06 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height,
                                                        width: 0.03 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                        child: const Image(
                                                          image: AssetImage(
                                                              "assets/images/juste.png"),
                                                        ),
                                                      )
                                                    : showState == "no" &&
                                                            reponseUtilisateur ==
                                                                4
                                                        ? SizedBox(
                                                            height: 0.06 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            width: 0.03 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child:
                                                                const Image(
                                                              image: AssetImage(
                                                                  "assets/images/faux.png"),
                                                            ),
                                                          )
                                                        : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
