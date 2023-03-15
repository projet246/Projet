
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Level.dart';

class FlameGameScreen extends StatelessWidget   {
  late Level _level;
  FlameGameScreen({Key? key, required level}) {
    _level  = level;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Level',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/level1.jpg'), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Container(
                  height: 340,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 5.0,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xffb1fff8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const FittedBox(
                        child: Text(
                          'Game',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        '  Here Lies The Desciption of The Game Here Lies The Desciption of The Game Here Lies The Desciption of The Game',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => _level ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfffbb9b5),
                            side: const BorderSide(
                                width: 3, color: Colors.black),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            padding: const EdgeInsets.only(
                                left: 25, right: 10, top: 10, bottom: 10)),
                        child: FittedBox(
                          child: Row(
                            children: const [
                              Icon(
                                Icons.gamepad,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Play The Game !',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
