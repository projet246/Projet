
import 'package:flutter/material.dart';

import '../player_box.dart';


class AnonButton extends StatefulWidget {
  const AnonButton({Key? key, required this.href, required this.color, required this.text}) : super(key: key);
  final String href;
  final Color color ;
  final String text;
  @override
  State<AnonButton> createState() => _AnonButtonState();
}

class _AnonButtonState extends State<AnonButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ()   async {
          getProgress();
          Navigator.pushNamed(context, widget.href);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            side: const BorderSide(width: 3, color: Colors.white),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
        child:  Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Digital',
          ),
        ));
  }
}

