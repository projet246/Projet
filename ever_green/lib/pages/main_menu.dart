import 'package:flutter/material.dart';
import 'package:sorttrash/card_bg.dart';

import '../button.dart';

class mainMenu extends StatelessWidget {
  const mainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              height: 330.0,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          //pour creer un alignement des elements
                          height: 60.0,
                          width: 120.0,
                          // color: Colors.amber,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                RoundButton(
                                    href: '/',
                                    myIcon: Icons.home), //le premier button
                                RoundButton(
                                  href: '/',
                                  myIcon: Icons.settings,
                                ), //le deuxieme button
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    //la ligne de widget de type cardBg
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      cardBg(
                        title: 'GAMES',
                        coleur1: Color.fromARGB(255, 79, 195, 7),
                        coleur2: Color.fromARGB(255, 102, 235, 0),
                        href: '/games',
                        Photo: "trash.png",
                        hei: 150.00,
                        wid: 200.0,
                      ),
                      cardBg(
                        title: 'HISTOIRES',
                        coleur1: Color.fromARGB(255, 79, 195, 7),
                        coleur2: Color.fromARGB(255, 102, 235, 0),
                        href: '/',
                        Photo: "trash2.png",
                        hei: 170.00,
                        wid: 200.0,
                      ),
                      cardBg(
                        title: 'STORY',
                        coleur1: Color.fromARGB(255, 79, 195, 7),
                        coleur2: Color.fromARGB(255, 102, 235, 0),
                        href: '/',
                        Photo: "trush3.png",
                        hei: 150.00,
                        wid: 200.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
