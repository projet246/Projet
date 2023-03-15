import 'package:flutter/material.dart';

class AnonButton extends StatefulWidget {
  const AnonButton({Key? key}) : super(key: key);

  @override
  State<AnonButton> createState() => _AnonButtonState();
}

class _AnonButtonState extends State<AnonButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(255, 210, 23, 5),
            side: const BorderSide(width: 3, color: Colors.white),
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 10)),
        child: const Text(
          'Play',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Digital',
          ),
        ));
  }
}
