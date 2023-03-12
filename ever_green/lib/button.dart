import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String? href; //pour indiquer le chemin à prendre en cliquant sur l'icon
  final IconData myIcon;
  const RoundButton({super.key, required this.href, required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '$href');
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 245, 53),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(
                myIcon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RectangleButton extends StatelessWidget {
  final Color couleur1;
  final Color couleur2;
  final String? text;
  const RectangleButton(
      {super.key,
      required this.couleur1,
      required this.couleur2,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //le grand container vert
            height: 35.0,
            width: 86.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: couleur1, //secondaire
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
          Positioned(
            top: 2.0,
            left: 2.0,
            child: Container(
              height: 28.0,
              width: 82.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: couleur2,//principal
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                  child: Text(
                    "$text",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
