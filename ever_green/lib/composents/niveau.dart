import 'package:flutter/material.dart';
import 'package:sorttrash/button.dart';

class OpenNiveau extends StatelessWidget {
  final double height;
  final double width;
  final int NbrNiveax;
  final int index;

  const OpenNiveau(
      {super.key,
      required this.height,
      required this.width,
      required this.NbrNiveax,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment:
            index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            height: 120.0,
            width: 100,
            child: Stack(
              children: [
                Container(
                  height: 120.0,
                  width: 100,
                ),
                const Image(
                    image: AssetImage("assets/images/opened-level.png")),
                const Positioned(
                  top: 85.0,
                  left: 7.0,
                  child: RectangleButton(
                    couleur1: Color.fromARGB(255, 255, 209, 23),
                    couleur2: Color.fromARGB(255, 255, 209, 23),
                    text: "niveau",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
