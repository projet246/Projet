import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';

class Niveau extends StatelessWidget {
  final double height;
  final double width;
  final int NbrNiveax;
  final int index;
  final int openLevels;
  final String href;

  const Niveau(
      {super.key,
      required this.height,
      required this.width,
      required this.NbrNiveax,
      required this.index,
      required this.openLevels,
      required this.href});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        mainAxisAlignment:
            index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                href,
              );
            },
            child: Container(
              height: 120.0,
              width: 100,
              child: index < openLevels
                  ? Stack(
                      children: [
                        Container(
                          height: 120.0,
                          width: 100,
                        ),
                        const Image(
                            image:
                                AssetImage("assets/images/opened-level.png")),
                        Positioned(
                          top: 85.0,
                          left: 7.0,
                          child: RectangleButton(
                            couleur1: const Color.fromARGB(255, 255, 209, 23),
                            couleur2: const Color.fromARGB(255, 255, 209, 23),
                            text: "Niveau ${index + 1}",
                          ),
                        )
                      ],
                    )
                  : Stack(
                      children: [
                        Container(
                          height: 120.0,
                          width: 100,
                        ),
                        const Image(
                            image: AssetImage("assets/images/close-level.png")),
                        Positioned(
                          top: 85.0,
                          left: 7.0,
                          child: RectangleButton(
                            couleur1: const Color.fromARGB(255, 170, 130, 29),
                            couleur2: const Color.fromARGB(255, 141, 104, 12),
                            text: "Niveau ${index + 1}",
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
