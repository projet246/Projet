import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';

import '../card_bg.dart';

class GamesMenu extends StatelessWidget {
  const GamesMenu({super.key});

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
                          width: 150.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                RoundButton(
                                    href: '/',
                                    myIcon: Icons.home), //le premier button
                                RoundButton(
                                    href: '/',
                                    myIcon: Icons
                                        .woo_commerce), //le deuxieme button
                                RoundButton(
                                    href: '/',
                                    myIcon:
                                        Icons.settings), //le deuxieme button
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            cardBg(
                              title: 'QUIZ',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              href: '/',
                              Photo: "boy.png",
                              hei: 190.00,
                              wid: 220.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            cardBg(
                              title: 'TRI',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              href: '/tri',
                              Photo: "girl.png",
                              hei: 220.00,
                              wid: 220.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            cardBg(
                              title: 'PUZZLE',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              href: '/',
                              Photo: "group.png",
                              hei: 100.00,
                              wid: 100.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            cardBg(
                              title: 'DEFIS',
                              coleur1: Color.fromARGB(223, 202, 63, 172),
                              coleur2: Color.fromARGB(255, 240, 71, 206),
                              href: '/',
                              Photo: "defis.png",
                              hei: 200.00,
                              wid: 200.0,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
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
    );
  }
}