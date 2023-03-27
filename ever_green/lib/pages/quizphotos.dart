import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sorttrash/pages/main_menu.dart';
import '../button.dart';

class QuizPhotos extends StatelessWidget {
  const QuizPhotos({super.key});

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
            Container(
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
                          href: '/',
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
                      child: Container(
                        child: Column(
                          //les reponses sont dans tous ce qui suit
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              //le container des questions
                              height: 0.25 * MediaQuery.of(context).size.height,
                              width: 0.35 * MediaQuery.of(context).size.width,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Container(
                                      width: 0.2 *
                                          MediaQuery.of(context).size.width,
                                      child: const Center(
                                          child: Text(
                                        "JE PEUX TRANSFORMER UNE BOITE A CHAUSSURES VIDES EN :",
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 218, 78, 204),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                    child: Container(
                                      height: 0.18 *
                                          MediaQuery.of(context).size.height,
                                      width: 0.08 *
                                          MediaQuery.of(context).size.width,
                                      // color: Colors.amber,
                                      child: const Image(
                                        image: AssetImage(
                                            "assets/images/chaussures.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              //le container des reponses
                              height: 0.38 * MediaQuery.of(context).size.height,
                              width: 0.75 * MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 0.35 *
                                        MediaQuery.of(context).size.height,
                                    width: 0.16 *
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(18.0),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 251, 194, 240),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  181, 44, 43, 43)
                                              .withOpacity(0.5),
                                          offset: const Offset(0, 5),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage("assets/images/cereals.png"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "UNE BOITE DE CEREALES",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:Color.fromARGB(255, 218, 78, 204),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 0.35 *MediaQuery.of(context).size.height,
                                    width: 0.16 *
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(18.0),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 251, 194, 240),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  181, 44, 43, 43)
                                              .withOpacity(0.5),
                                          offset: const Offset(0, 5),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage("assets/images/carton.png"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "DES CARTONS DE DEMANEGEMENT",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:Color.fromARGB(255, 218, 78, 204),
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 0.35 *
                                        MediaQuery.of(context).size.height,
                                    width: 0.16 *
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(18.0),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 251, 194, 240),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  181, 44, 43, 43)
                                              .withOpacity(0.5),
                                          offset: const Offset(0, 5),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage("assets/images/papier.png"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "DU PAPIER TOILETTES",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:Color.fromARGB(255, 218, 78, 204),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 0.35 *
                                        MediaQuery.of(context).size.height,
                                    width: 0.16 *
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(18.0),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 251, 194, 240),
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  181, 44, 43, 43)
                                              .withOpacity(0.5),
                                          offset: const Offset(0, 5),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage("assets/images/sac.png"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 0.15 *MediaQuery.of(context).size.height,
                                          width: 0.13 *MediaQuery.of(context).size.width,
                                          // color: Colors.amber,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "UN SAC A DOS",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:Color.fromARGB(255, 218, 78, 204),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
