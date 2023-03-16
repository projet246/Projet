import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';
import 'dart:ui' as ui;
import '../composents/niveau.dart';
import '../button.dart';

import 'package:sorttrash/pages/main_menu.dart';

//la page de la gestion de niveaux

double width = ui.window.physicalSize.width;
double height = ui.window.physicalSize.height;

class Niveaux extends StatelessWidget {
  final int NbrNiveax;
  final int OpenLevels;
  final String href;
  const Niveaux({
    super.key,
    required this.NbrNiveax,
    required this.OpenLevels,
    required this.href
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          //le container qui contient le bg image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Row(
              //les bouttons au-dessus
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    child: const Center(
                      child: RoundButton(href: '/', myIcon: Icons.home),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5.0, 15.0, 0.0),
                  child: Container(
                    //pour creer un alignement des elements
                    height: 60.0,
                    width: 120.0,
                    // color: Colors.amber,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          const RoundButton(
                              href: '/',
                              myIcon: Icons.home), //le premier button
                          RoundButton(
                            href: this.href,
                            myIcon: Icons.settings,
                          ), //le deuxieme button
                        ]),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      //le corps de niveaux
                      height: 0.4 * height,
                      width: 100.0 * NbrNiveax + 50 * (NbrNiveax - 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(211, 178, 158, 211),
                      ),
                      child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(this.NbrNiveax, (index) {
                        return index != NbrNiveax - 1
                            ? Row(
                                children: [
                                  Niveau(
                                    NbrNiveax: this.NbrNiveax,
                                    height: height,
                                    width: width,
                                    index: index,
                                    openLevels: this.OpenLevels,
                                    href: this.href,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 0.4 * height,
                                        width: 50.0,
                                        // color: Colors.amber,
                                      ),
                                      Positioned(
                                        top: 0.1 * height,
                                        child: Container(
                                            width: 50.0,
                                            height: 170,
                                            // color: Colors.black,
                                            child: index % 2 != 0
                                                ? const Image(
                                                    image: AssetImage(
                                                        "assets/images/triAss.png"))
                                                : const Image(
                                                    image: AssetImage(
                                                        "assets/images/triDes.png"))),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Niveau(
                                NbrNiveax: this.NbrNiveax,
                                height: height,
                                width: width,
                                index: index,
                                openLevels: this.OpenLevels,
                                href: '/',
                              );
                      })),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
